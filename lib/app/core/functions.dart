import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_app/app/constants/colors.dart';
import 'package:wallpaper_app/presentation/widgets/error_widget.dart';

customLoadingIndicator() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: CircularProgressIndicator(),
    ),
  );
}

showToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColor.kkGrey.withOpacity(0.6),
    textColor: AppColor.white,
    fontSize: 16,
    gravity: ToastGravity.CENTER,
  );
}

showErrorDialog(BuildContext context, String errorMessage) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ErrorStateWidget(errorMessage: errorMessage),
      ),
    );
  });
}
