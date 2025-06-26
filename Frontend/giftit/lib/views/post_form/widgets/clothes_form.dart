import 'package:flutter/material.dart';

import 'package:giftit/configs/colors/app_colors.dart';

class ClothesForm extends StatefulWidget {
  const ClothesForm({super.key});

  @override
  State<ClothesForm> createState() => _ClothesFormState();
}

class _ClothesFormState extends State<ClothesForm> {
  final List<Map<String, dynamic>> clothesList = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController piecesController = TextEditingController();

  Map<String, bool> genderOptions = {
    "Male": false,
    "Female": false,
    "Other": false,
  };

  int? editingIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...clothesList.asMap().entries.map((entry) {
            int index = entry.key;
            var item = entry.value;
            return Card(
              color: AppColors.lightGreen,
              child: ListTile(
                title: Text("${item['name']} - Size: ${item['size']}"),
                subtitle: Text(
                    "Gender: ${item['gender']} | Pieces: ${item['pieces']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          editingIndex = index;
                          nameController.text = item['name'];
                          sizeController.text = item['size'].toString();
                          piecesController.text = item['pieces'].toString();

                          genderOptions.updateAll((key, _) => false);
                          for (var g in item['gender'].split(", ")) {
                            if (genderOptions.containsKey(g)) {
                              genderOptions[g] = true;
                            }
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          clothesList.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: _inputDecoration("Name"),
                  validator: (val) => val!.isEmpty ? "Enter name" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: sizeController,
                  decoration: _inputDecoration("Size"),
                  keyboardType: TextInputType.number,
                  validator: (val) => val!.isEmpty ? "Enter size" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: piecesController,
                  decoration: _inputDecoration("Pieces"),
                  keyboardType: TextInputType.number,
                  validator: (val) => val!.isEmpty ? "Enter pieces" : null,
                ),
                SizedBox(height: 10),
                Column(
                  children: genderOptions.keys.map((key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: genderOptions[key],
                      onChanged: (val) {
                        setState(() {
                          genderOptions[key] = val!;
                        });
                      },
                      activeColor: AppColors.primaryGreen,
                      checkColor: AppColors.white,
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final selectedGenders = genderOptions.entries
                          .where((e) => e.value)
                          .map((e) => e.key)
                          .join(", ");

                      final item = {
                        'name': nameController.text,
                        'size': int.tryParse(sizeController.text) ?? 0,
                        'pieces': int.tryParse(piecesController.text) ?? 0,
                        'gender': selectedGenders,
                      };

                      setState(() {
                        if (editingIndex != null) {
                          clothesList[editingIndex!] = item;
                          editingIndex = null;
                        } else {
                          clothesList.add(item);
                        }
                        nameController.clear();
                        sizeController.clear();
                        piecesController.clear();
                        genderOptions.updateAll((key, _) => false);
                      });
                    }
                  },
                  child: Text(editingIndex != null ? "Update" : "Add to List"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.primaryGreen),
      filled: true,
      fillColor: AppColors.lightGreen,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
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
