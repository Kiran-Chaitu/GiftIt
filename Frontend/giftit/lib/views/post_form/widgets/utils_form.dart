import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class UtilsForm extends StatefulWidget {
  const UtilsForm({super.key});

  @override
  State<UtilsForm> createState() => _UtilsFormState();
}

class _UtilsFormState extends State<UtilsForm> {
  final List<Map<String, dynamic>> utilList = [];
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();

  int? editingIndex;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              ...utilList.asMap().entries.map(
                    (entry) => _buildCard(entry.value, entry.key),
                  ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: _inputDecoration("Item Name"),
                      validator: (val) =>
                          val!.isEmpty ? "Enter item name" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration("Quantity"),
                      validator: (val) =>
                          val!.isEmpty ? "Enter quantity" : null,
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _handleSubmit,
                      child: Text(editingIndex != null ? "Update" : "Add"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final item = {
        'name': nameController.text.trim(),
        'quantity': int.tryParse(quantityController.text.trim()) ?? 0,
      };

      setState(() {
        if (editingIndex != null) {
          utilList[editingIndex!] = item;
          editingIndex = null;
        } else {
          utilList.insert(0, item);
        }

        nameController.clear();
        quantityController.clear();
      });
    }
  }

  Widget _buildCard(Map<String, dynamic> item, int index) {
    return Card(
      color: AppColors.lightGreen,
      child: ListTile(
        title: Text(item['name']),
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
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  utilList.removeAt(index);
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
