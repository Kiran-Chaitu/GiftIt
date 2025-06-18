import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityController extends GetxController {
  late StreamSubscription _subscription;
  var isConnected = true.obs;
  var isDialogShown = false;

  @override
  void onInit() {
    super.onInit();
    _monitorConnection();
  }

  void _monitorConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) async {
      debugPrint("🔄 Connectivity changed: $result");

      bool hasInternet =
          await InternetConnectionChecker.createInstance().hasConnection;
      debugPrint("Internet connection status: $hasInternet");

      if (!hasInternet && !isDialogShown) {
        debugPrint("No internet and dialog not shown yet. Showing dialog...");
        isDialogShown = true;
        isConnected.value = false;
        _showNoInternetDialog();
      } else if (hasInternet && isDialogShown) {
        debugPrint("Internet restored and dialog was shown. Closing dialog...");
        isConnected.value = true;
        isDialogShown = false;
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      } else {
        debugPrint(
            "Internet check ignored: hasInternet=$hasInternet, isDialogShown=$isDialogShown");
      }
    });
  }

  void _showNoInternetDialog() {
    debugPrint("Displaying custom no internet dialog");

    Future.delayed(Duration.zero, () {
      if (Get.context != null) {
        Get.dialog(
          PopScope(
            canPop: false,
            child: Dialog(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wifi_off_rounded,
                      size: 36.h,
                      color: AppColors.darkGreen,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "You're Offline",
                      style: AppTextStyles.heading3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Please check your internet connectivity and try again.",
                      style: AppTextStyles.bodyText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () async {
                        debugPrint("Retry button pressed");
                        bool hasInternet =
                            await InternetConnectionChecker.createInstance()
                                .hasConnection;
                        debugPrint("Rechecked internet: $hasInternet");

                        if (hasInternet) {
                          debugPrint(
                              "Internet is back. Closing dialog and reloading page...");

                          if (Get.isDialogOpen ?? false) {
                            Get.back();
                          }
                          isDialogShown = false;
                          isConnected.value = true;
                        } else {
                          debugPrint(
                              "Still no internet. Showing dialog again.");
                          Get.back();
                          _showNoInternetDialog();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Retry'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        debugPrint("Get.context is null. Cannot show dialog.");
      }
    });
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
