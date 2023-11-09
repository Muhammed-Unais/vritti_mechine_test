import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';
import 'package:vritti_mechine_test/common/widgets/width_spacer.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.iconColor,
    this.onTap,
  });

  final String buttonText;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppConst.kWidth * 0.3,
        margin: EdgeInsets.all(20.w),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
              const WidthSpacer(width: 5),
              ReusableText(
                text: buttonText,
                style: appStyle(
                  12,
                  textColor,
                  FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}