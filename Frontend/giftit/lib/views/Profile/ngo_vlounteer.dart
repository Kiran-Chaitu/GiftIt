import 'package:flutter/material.dart';

class NgoVlounteerPage extends StatefulWidget {
  const NgoVlounteerPage({super.key});

  @override
  State<NgoVlounteerPage> createState() => _NgoVlounteerPageState();
}

class _NgoVlounteerPageState extends State<NgoVlounteerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text('NGO Volunteer',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 0.2),
                  ),
                  child: CircleAvatar(
                    radius: 58,
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildInputField(labelText: 'NGO ID:'),
                _buildInputField(labelText: 'NGO Name:'),
                _buildInputField(labelText: 'NGO Address :'),
                SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required String labelText}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black54,
            width: 0.5,
          ),
            boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0.5,
              spreadRadius: 0.1,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

// Widget _buildLabeledTextField({
//   required String label,
//   required TextEditingController controller,
//   required bool editable,
//   required VoidCallback onEditTap,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(label, style: const TextStyle(fontSize: 16)),
//       const SizedBox(height: 8),
//       Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           border: Border.all(
//             color: editable ? Colors.green : Colors.black54,
//             width: 0.5,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: 0.5,
//               spreadRadius: 0.1,
//               offset: Offset(0, 0),
//             )
//           ],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: controller,
//                 readOnly: !editable,
//                 style: const TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.w500),
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: onEditTap,
//               child: const Padding(
//                 padding: EdgeInsets.only(right: 12),
//                 child: Icon(Icons.edit, size: 20,color: Colors.green,),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
// }