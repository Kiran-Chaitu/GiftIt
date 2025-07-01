import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import '../../../bloc/home_screen/home_screen_bloc.dart';
import '../../../bloc/home_screen/home_screen_event.dart';

class AvailableDonationCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String item;
  final String address;
  final List<Map<String, dynamic>> items;

  AvailableDonationCard({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.item,
    required this.address,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
        children:[
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryGreen,
            ),
          ),
          ClipPath(
            clipper: AvailableDonationCardClipper(),
            child: Container(
              height: 220,
              width: double.infinity,
              // padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGreen,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black54,
                  //     spreadRadius: 7,
                  //     blurRadius: 7,
                  //     // offset: Offset(3,3)
                  //   )
                  // ]
                  // gradient: LinearGradient(
                  //     colors: [AppColors.primaryGreen,Colors.white],
                  //     stops: [0.3,1]
                  // )
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom:9,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        // Replace with actual donationId
                        _showItemPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreen,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('View',style: AppTextStyles.bodyText.copyWith(color: Colors.white),),
                    ),
                  ),
                  child: Text(
                    'View',
                    style: AppTextStyles.bodyText.copyWith(color: Colors.white),
                  ),
                  Align(
                      alignment: Alignment(0.7,-0.6),
                      child: Container(
                        // color: Colors.blue,
                        // padding: EdgeInsets.all(8),
                        // width: 170,
                        width: screenWidth * 0.4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: $name",style: AppTextStyles.bodyText.copyWith(color: AppColors.darkGreen),),
                            Text("Item: $item",style: AppTextStyles.bodyText.copyWith(color: AppColors.darkGreen),),
                            Text("Address: $address",style: AppTextStyles.bodyText.copyWith(color: AppColors.darkGreen),),
                          ],
                        ),
                        Text(
                          "Address: $address",
                          style: AppTextStyles.bodyText
                              .copyWith(color: AppColors.darkGreen),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ]);
  }

  void _showItemPopup(BuildContext context) {
    List<Map<String, dynamic>> selectedItems = List.from(items);
    List<bool> isSelected = List.generate(items.length, (_) => false);

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Select Items to Claim"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  final itemName = item['name'];
                  final value = item.containsKey('pieces')
                      ? "Pieces: ${item['pieces']}"
                      : "Qty: ${item['quantity']}";

                  return CheckboxListTile(
                    value: isSelected[index],
                    onChanged: (val) {
                      setState(() => isSelected[index] = val!);
                    },
                    title: Text(itemName),
                    subtitle: Text(value),
                    activeColor: AppColors.primaryGreen,
                    checkColor: AppColors.background,
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final selected = [
                    for (int i = 0; i < items.length; i++)
                      if (isSelected[i]) items[i]
                  ];

                  if (selected.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please select at least one item")),
                    );
                    return;
                  }

                  context.read<HomeScreenBloc>().add(ClaimDonation(id));

                  Navigator.pop(context);
                },
                child: Text("Claim"),
              ),
            ],
          );
        },
      ),
    );
  }
  void _showItemPopup(BuildContext context) {
    List<Map<String, dynamic>> selectedItems = List.from(items);
    List<bool> isSelected = List.generate(items.length, (_) => false);

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Select Items to Claim"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  final itemName = item['name'];
                  final value = item.containsKey('pieces') ? "Pieces: ${item['pieces']}" : "Qty: ${item['quantity']}";

                  return CheckboxListTile(
                    value: isSelected[index],
                    onChanged: (val) {
                      setState(() => isSelected[index] = val!);
                    },
                    title: Text(itemName),
                    subtitle: Text(value),
                    activeColor: AppColors.primaryGreen,
                    checkColor: AppColors.background,
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final selected = [
                    for (int i = 0; i < items.length; i++)
                      if (isSelected[i]) items[i]
                  ];

                  if (selected.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select at least one item")),
                    );
                    return;
                  }

                  context.read<HomeScreenBloc>().add(ClaimDonation(id));

                  Navigator.pop(context);
                },
                child: Text("Claim"),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AvailableDonationCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.65, size.height);
    path.lineTo(size.width * 0.4, size.height - 70);
    path.lineTo(0, size.height - 70);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



// class AvailableDonationCardClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0, 0); // top-left
//     path.lineTo(size.width, 0); // top-right
//     path.lineTo(size.width, size.height); // bottom-right
//     path.lineTo(270, size.height); // bottom (leave space for notch)
//     path.lineTo(160, size.height - 70);
//     path.lineTo(0, size.height - 70); // diagonal cut up
//     path.close(); // back to top-left
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }