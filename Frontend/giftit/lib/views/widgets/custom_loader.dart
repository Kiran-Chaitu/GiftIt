import 'package:flutter/cupertino.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, this.size = 25});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: [
          AppColors.darkGreen,
          AppColors.darkGreen,
          AppColors.primaryGreen
        ]).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: SizedBox(
        child: CupertinoActivityIndicator(radius: size * 0.6),
      ),
    );
  }
}
