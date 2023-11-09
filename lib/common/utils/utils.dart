import 'package:flutter/material.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';

class Utils {
  static Future<void> showDeleteDialog(BuildContext context,
      {required void Function()? onPressed}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: ReusableText(
            text: "Delete",
            style: appStyle(
              16,
              AppConst.kBkDark,
              FontWeight.bold,
            ),
          ),
          content: ReusableText(
            text: "Are you sure you want to Delete?",
            style: appStyle(
              12,
              AppConst.kBkDark,
              FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: ReusableText(
                text: "Cancel",
                style: appStyle(
                  12,
                  AppConst.kBkDark,
                  FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: ReusableText(
                text: "Delete",
                style: appStyle(
                  12,
                  AppConst.kRed,
                  FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showCustomSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ReusableText(
          text: content,
          style: appStyle(
            12,
            AppConst.kGreen,
            FontWeight.bold,
          ),
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
