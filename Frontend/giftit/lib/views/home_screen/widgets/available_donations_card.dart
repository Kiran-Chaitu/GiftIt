import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import '../../../bloc/home_screen/home_screen_bloc.dart';
import '../../../bloc/home_screen/home_screen_event.dart';


class AvailableDonationCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String item;
  final String address;

  AvailableDonationCard({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.item,
    required this.address,
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
              color: AppColors.lightGreen,
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
                  color: AppColors.primaryGreen,
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
                        context.read<HomeScreenBloc>().add(ClaimDonation(id));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGreen,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Claim'),
                    ),
                  ),
                  Align(
                    // top: 50,
                    // left: 40,
                    alignment: Alignment(-0.9,-0.7),
                    child: Container(
                      height: 100,
                      // width: 150,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 2,color: Colors.grey),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),fit: BoxFit.cover
                          )
                      ),
                    ),
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
                            Text("Name: $name",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text("Item: $item",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text("Address: $address",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ]
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