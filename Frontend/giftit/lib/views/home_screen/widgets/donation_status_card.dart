import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';

class DonationStatusCard extends StatelessWidget {
  final String imageUrl;
  final String item;
  final String status;

  const DonationStatusCard({
    required this.imageUrl,
    required this.item,
    required this.status,
  });

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "active":
        return Colors.green;
      case "claimed":
        return Colors.orange;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: AppColors.lightGreen,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.lightGreen,
                  getStatusColor(status),
                ],
                stops: [0.5, 0.8],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 15,
              child: Text(
                item,
                style: AppTextStyles.subtitle,
              )),
          Positioned(
              bottom: 0,
              right: 15,
              child: Text(
                status,
                style: AppTextStyles.subtitle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),

          ClipPath(
            clipper: DonationStatusCardClipper(),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
          ),
          // ClipRRect(
          //         borderRadius: BorderRadius.all(Radius.circular(30)),
          //         child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover)
          // ),
          // Positioned(
          //     top: 2,
          //     right: 2,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //           color: Colors.black
          //       ),
          //       child: Text(item, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          //     )
          // ),
          // Positioned(
          //     top: 40,
          //     right: 2,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(30),
          //         color: getStatusColor(status),
          //       ),
          //       child: Text(status, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          //     )
          // ),
        ],
      ),
    );
    // return Container(
    //   height: 100,
    //   width: 160,
    //   margin: EdgeInsets.only(right: 12),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(12),
    //     color: Colors.white,
    //     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    //   ),
    //   child: Stack(
    //     children: [
    //       ClipRRect(
    //           borderRadius: BorderRadius.all(Radius.circular(30)),
    //           child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover)),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text(item, style: TextStyle(fontWeight: FontWeight.bold)),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //         child: Text(
    //           status,
    //           style: TextStyle(
    //             color: getStatusColor(status),
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class DonationStatusCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.2); // Top-left diagonal
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(size.width, size.height * 0.8); // Bottom-right diagonal
    path.lineTo(0, size.height); // Bottom-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
