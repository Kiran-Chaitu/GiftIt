import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_bloc.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_event.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_state.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class FoodForm extends StatefulWidget {
  const FoodForm({super.key});

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();

  final RegExp nameRegExp = RegExp(r'^[A-Za-z][A-Za-z0-9 ]*$');

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodFormBloc, FoodFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        final vegList = state.vegItemsList.entries.toList();
        final nonVegList = state.nonVegItemsList.entries.toList();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (vegList.isNotEmpty) ...[
                const Text("Veg Donations",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ...vegList.map(
                    (item) => _buildCard(context, item.key, item.value, false)),
              ],
              if (nonVegList.isNotEmpty) ...[
                const SizedBox(height: 10),
                const Text("Non-Veg Donations",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ...nonVegList.map(
                    (item) => _buildCard(context, item.key, item.value, true)),
              ],
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration("Food Name"),
                      validator: (val) {
                        final validCharactersRegExp = RegExp(
                            r'^[a-zA-Z][a-zA-Z0-9 ]*$'); 
                        final startsWithDigitRegExp =
                            RegExp(r'^\d'); 

                        if (val == null || val.trim().isEmpty) {
                          return "Enter food name";
                        } else if (startsWithDigitRegExp.hasMatch(val.trim())) {
                          return "Name can't start with a number";
                        } else if (!validCharactersRegExp
                            .hasMatch(val.trim())) {
                          return "Only letters, numbers, and spaces allowed";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: quantityController,
                      decoration: _inputDecoration("Quantity"),
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return "Enter quantity in KGs";
                        }
                        final number = int.tryParse(val.trim());
                        if (number == null || number <= 0) {
                          return "Enter a valid number";
                        } else if (number > 1000) {
                          return "Max allowed quantity is 1000 KG";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Veg"),
                            value: "Veg",
                            groupValue: state.isVegChecked ? "Veg" : "Non-Veg",
                            onChanged: (_) => context
                                .read<FoodFormBloc>()
                                .add(ToggleFoodType(true)),
                            activeColor: AppColors.primaryGreen,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Non-Veg"),
                            value: "Non-Veg",
                            groupValue: state.isVegChecked ? "Veg" : "Non-Veg",
                            onChanged: (_) => context
                                .read<FoodFormBloc>()
                                .add(ToggleFoodType(false)),
                            activeColor: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final name = nameController.text.trim();
                          final quantity = quantityController.text.trim();

                          if (state.isEditing) {
                            context.read<FoodFormBloc>().add(EditFoodItem(
                                  isVeg: state.isVegChecked,
                                  name: name,
                                  quantity: quantity,
                                ));
                          } else {
                            context.read<FoodFormBloc>().add(AddFoodItem(
                                  name: name,
                                  quantity: quantity,
                                ));
                          }
                          nameController.clear();
                          quantityController.clear();
                          context.read<FoodFormBloc>().add(CancelEditing());
                        }
                      },
                      child: Text(state.isEditing ? "Update" : "Add"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard(
      BuildContext context, String name, String quantity, bool isNonVeg) {
    return Card(
      color: AppColors.lightGreen,
      child: ListTile(
        title: Text(name),
        subtitle: Text("Quantity: $quantity KG(s)"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                context.read<FoodFormBloc>().add(StartEditFoodItem(
                      itemName: name,
                      quantity: quantity,
                      isVeg: !isNonVeg,
                    ));
                nameController.text = name;
                quantityController.text = quantity;
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context
                    .read<FoodFormBloc>()
                    .add(DeleteFoodItem(isVeg: !isNonVeg, itemName: name));
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.primaryGreen),
      filled: true,
      fillColor: AppColors.lightGreen,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.lightGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.lightGreen, width: 2),
      ),
    );
  }
}
