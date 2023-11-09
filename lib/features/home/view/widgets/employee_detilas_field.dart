import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';

class EmployeeDetailsField extends StatelessWidget {
  const EmployeeDetailsField({
    super.key,
    required this.fieldText,
    this.enabled = false,
    required this.controller,
  });

  final String fieldText;
  final bool enabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppConst.kLight,
        borderRadius: BorderRadius.circular(10),
      ),
      width: AppConst.kWidth,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: fieldText,
          hintStyle: appStyle(
            12.w,
            AppConst.kBkDark,
            FontWeight.w500,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}