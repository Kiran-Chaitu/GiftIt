// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/data/API_Response/response.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:giftit/configs/colors/app_colors.dart';
// import 'package:giftit/configs/themes/app_dimesnions.dart';
// import 'package:giftit/configs/themes/app_text_styles.dart';
// import '../../models/profile/profileModell.dart';
// import '../widgets/custom_error_widget.dart';
// import '../widgets/custom_loader.dart';
//
//
//
//
// class EditProfilePage extends StatefulWidget {
//   final ProfileModel profileModel;
//   const EditProfilePage({ super.key , required this.profileModel, required });
//
//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController nameController;
//   late TextEditingController locationController;
//   late TextEditingController numberController;
//
//   bool isNameEditable = false;
//   bool isLocationEditable = false;
//   bool isNumberEditable = false;
//
//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: "Your Name");
//     locationController = TextEditingController(text: "Your Location");
//     numberController = TextEditingController(text: "Your Number");
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _pickedImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryGreen,
//         title: Center(
//           child: Text(
//             'Edit Profile',
//             style: AppTextStyles.heading2.copyWith(color: Colors.white),
//           ),
//         ),
//         leading: const BackButton(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 CircleAvatar(
//                   radius: 70,
//                   backgroundImage: _pickedImage != null
//                       ? FileImage(_pickedImage!)
//                       : const NetworkImage(
//                     'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
//                   ) as ImageProvider,
//                 ),
//                 Positioned(
//                   right: 0,
//                   bottom: 0,
//                   child: GestureDetector(
//                     onTap: _pickImage,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppColors.primaryGreen,
//                       ),
//                       padding: const EdgeInsets.all(6),
//                       child: Icon(
//                         Icons.camera_alt,
//                         color: Colors.white,
//                         size: AppDimensions.iconMedium,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             _buildLabeledTextField(
//               label: 'Name:',
//               controller: nameController,
//               editable: isNameEditable,
//               onEditTap: () {
//                 setState(() {
//                   isNameEditable = true;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildLabeledTextField(
//               label: 'Location:',
//               controller: locationController,
//               editable: isLocationEditable,
//               onEditTap: () {
//                 setState(() {
//                   isLocationEditable = true;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildLabeledTextField(
//               label: 'Mobile Number:',
//               controller: numberController,
//               editable: isNumberEditable,
//               onEditTap: () {
//                 setState(() {
//                   isNumberEditable = true;
//                 });
//               },
//             ),
//             const SizedBox(height: 30),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.07,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Simple mock save logic
//
//
//                   setState(() {
//                     isNameEditable = false;
//                     isLocationEditable = false;
//                     isNumberEditable = false;
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryGreen,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                 ),
//                 child: const Text(
//                   'Edit',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLabeledTextField({
//     required String label,
//     required TextEditingController controller,
//     required bool editable,
//     required VoidCallback onEditTap,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Expanded(
//           child: TextField(
//             controller: controller,
//             enabled: editable,
//             decoration: InputDecoration(
//               labelText: label,
//               border: const OutlineInputBorder(),
//             ),
//             //const SizedBox(width: 10),
//             // IconButton(
//             //   onPressed: onEditTap,
//             //   icon: const Icon(Icons.edit),
//             //   color: AppColors.primaryGreen,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//   Widget _buildLabeledTextField({
//     required String label,
//     required TextEditingController controller,
//     required bool editable,
//     required VoidCallback onEditTap,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: const TextStyle(fontSize: 16)),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.white,
//             border: Border.all(
//               color: editable ? AppColors.primaryGreen : Colors.black,
//               width: 1,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 0.5,
//                 spreadRadius: 0.1,
//                 offset: Offset(0, 0),
//               )
//             ],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: controller,
//                   readOnly: !editable,
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.w500),
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: onEditTap,
//                 child:  Padding(
//                   padding: EdgeInsets.only(right: 12),
//                   child: Icon(Icons.edit, size: AppDimensions.iconMedium,color:AppColors.primaryGreen),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/profile/profile_bloc.dart';
import 'package:giftit/bloc/profile/profile_event.dart';
import 'package:giftit/bloc/profile/profile_state.dart';
import 'package:giftit/models/profile/profileModell.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileModel profileModel;
  const EditProfilePage({super.key, required this.profileModel});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  String? _activeField;

  Future<void> _pickImage() async {
    await requestStoragePermission();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  void _setActiveField(String fieldName) {
    setState(() {
      _activeField = fieldName;
    });
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      if (await Permission.storage.request().isGranted) {
        // Permission granted
        debugPrint("Storage permission granted");
      } else {
        // Permission denied
        debugPrint("Storage permission denied");
      }
    } else {
      debugPrint("Storage permission already granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: Center(
          child: Text(
            'Edit Profile',
            style: AppTextStyles.heading2.copyWith(color: Colors.white),
          ),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: _pickedImage != null
                      ? FileImage(_pickedImage!)
                      : const NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png')
                          as ImageProvider,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryGreen,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: AppDimensions.iconMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildEditableTextField(
                label: "Name", controller: nameController, fieldName: "name"),
            const SizedBox(height: 20),
            _buildEditableTextField(
                label: "Location",
                controller: locationController,
                fieldName: "location"),
            const SizedBox(height: 20),
            _buildEditableTextField(
              label: "Mobile Number",
              controller: numberController,
              fieldName: "number",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.isSubmiting) {
                    return Center(
                      child: CustomLoader(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      final data = widget.profileModel;
                      context.read<ProfileBloc>().add(EditProfileEvent(
                          name: nameController.text ?? data.displayName,
                          number: numberController.text ?? data.mobileNumber,
                          location: locationController.text ?? data.location,
                          image: _pickedImage!));
                      context.read<ProfileBloc>().add(LoadProfileEvent());
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required String label,
    required TextEditingController controller,
    required String fieldName,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final isActive = _activeField == fieldName;

    return GestureDetector(
      onTap: () => _setActiveField(fieldName),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: isActive ? AppColors.primaryGreen : Colors.black,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 0.5,
                  spreadRadius: 0.1,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              enabled: isActive,
              autofocus: isActive,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
