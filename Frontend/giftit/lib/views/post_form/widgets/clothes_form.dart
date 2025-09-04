import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/Forms%20data/clothes_form/clothes_form_bloc.dart';
import 'package:giftit/bloc/Forms%20data/clothes_form/clothes_form_event.dart';
import 'package:giftit/bloc/Forms%20data/clothes_form/clothes_form_state.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class ClothesForm extends StatefulWidget {
  const ClothesForm({super.key});

  @override
  State<ClothesForm> createState() => _ClothesFormState();
}

class _ClothesFormState extends State<ClothesForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final sizeController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    sizeController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClothesFormBloc, ClothesFormState>(
      listener: (context, state) {
        if (state.isEditing && state.editingIndex != null) {
          final item = state.clothesList[state.editingIndex!];
          nameController.text = item['name'] ?? '';
          sizeController.text = item['size'] ?? '';
          quantityController.text = item['quantity'] ?? '';
        } else {
          nameController.clear();
          sizeController.clear();
          quantityController.clear();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...state.clothesList.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Card(
                  color: AppColors.lightGreen,
                  child: ListTile(
                    title: Text("${item['name']} - Size: ${item['size']}"),
                    subtitle: Text(
                        "Gender: ${item['gender']} | Pieces: ${item['quantity']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.black),
                          onPressed: () => context
                              .read<ClothesFormBloc>()
                              .add(StartEditClothesItem(index)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => context
                              .read<ClothesFormBloc>()
                              .add(DeleteClothesItem(index)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration("Name"),
                      validator: (val) =>
                          val == null || val.isEmpty ? "Enter name" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: sizeController,
                      decoration: _inputDecoration("Size"),
                      validator: (val) =>
                          val == null || val.isEmpty ? "Enter size" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: quantityController,
                      decoration: _inputDecoration("Pieces"),
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Enter quantity" : null,
                    ),
                    const SizedBox(height: 10),

                    // Gender Radio Buttons
                    Column(
                      children: ["Male", "Female"].map((genderOption) {
                        return RadioListTile<String>(
                          title: Text(genderOption),
                          value: genderOption,
                          groupValue: state.gender,
                          onChanged: (val) {
                            if (val != null) {
                              context
                                  .read<ClothesFormBloc>()
                                  .add(ToggleGender(val));
                            }
                          },
                          activeColor: AppColors.primaryGreen,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ClothesFormBloc>()
                            ..add(UpdateClothesName(nameController.text))
                            ..add(UpdateClothesSize(sizeController.text))
                            ..add(
                                UpdateClothesQuantity(quantityController.text))
                            ..add(state.isEditing
                                ? UpdateClothesItem()
                                : AddClothesItem());
                        }
                      },
                      child: Text(state.isEditing ? "Update" : "Add to List"),
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
