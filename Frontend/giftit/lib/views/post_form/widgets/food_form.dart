import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';


class FoodForm extends StatefulWidget {
  const FoodForm({super.key});

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final List<Map<String, dynamic>> vegList = [];
  final List<Map<String, dynamic>> nonVegList = [];
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final quantityController = TextEditingController();

  String foodType = "Veg"; // Default
  int? editingIndex;
  bool isEditingNonVeg = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (vegList.isNotEmpty) ...[
                Text("Veg Donations",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ...vegList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var item = entry.value;
                  return _buildCard(item, index, false);
                }),
              ],
              if (nonVegList.isNotEmpty) ...[
                SizedBox(height: 10),
                Text("Non-Veg Donations",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ...nonVegList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var item = entry.value;
                  return _buildCard(item, index, true);
                }),
              ],
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration("Food Name"),
                      validator: (val) => val!.isEmpty ? "Enter name" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantityController,
                      decoration: _inputDecoration("Quantity"),
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                          val!.isEmpty ? "Enter quantity" : null,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: foodType == "Veg",
                          onChanged: (val) {
                            setState(() => foodType = "Veg");
                          },
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryGreen,
                        ),
                        Text("Veg"),
                        Checkbox(
                          value: foodType == "Non-Veg",
                          onChanged: (val) {
                            setState(() => foodType = "Non-Veg");
                          },
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryGreen,
                        ),
                        Text("Non-Veg"),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final item = {
                            'name': nameController.text,
                            'quantity':
                                int.tryParse(quantityController.text) ?? 0,
                          };

                          setState(() {
                            if (editingIndex != null) {
                              if (isEditingNonVeg) {
                                nonVegList[editingIndex!] = item;
                              } else {
                                vegList[editingIndex!] = item;
                              }
                              editingIndex = null;
                            } else {
                              if (foodType == "Veg") {
                                vegList.add(item);
                              } else {
                                nonVegList.add(item);
                              }
                            }

                            nameController.clear();
                            quantityController.clear();
                            foodType = "Veg";
                          });
                        }
                      },
                      child: Text(editingIndex != null ? "Update" : "Add"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Widget _buildCard(Map<String, dynamic> item, int index, bool isNonVeg) {
    return Card(
      color: AppColors.lightGreen,
      child: ListTile(
        title: Text("${item['name']}"),
        subtitle: Text("Quantity: ${item['quantity']}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  nameController.text = item['name'];
                  quantityController.text = item['quantity'].toString();
                  editingIndex = index;
                  foodType = isNonVeg ? "Non-Veg" : "Veg";
                  isEditingNonVeg = isNonVeg;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  if (isNonVeg) {
                    nonVegList.removeAt(index);
                  } else {
                    vegList.removeAt(index);
                  }
                });
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
      hintStyle: TextStyle(color: AppColors.primaryGreen),
      filled: true,
      fillColor: AppColors.lightGreen,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.lightGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.lightGreen, width: 2),
      ),
    );
  }
}
