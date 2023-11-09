import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';

class HomeTabbar extends StatelessWidget {
  const HomeTabbar({
    super.key,
    required this.controller,
    required this.employees,
  });

  final TabController controller;
  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        indicator: const BoxDecoration(
          color: AppConst.kGreyLight,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(right: 16),
        isScrollable: true,
        controller: controller,
        unselectedLabelColor: AppConst.kLight,
        labelColor: AppConst.kB1ueLight,
        dividerColor: Colors.transparent,
        labelStyle: appStyle(
          24,
          AppConst.kB1ueLight,
          FontWeight.w700,
        ),
        onTap: (value) {},
        tabs: List.generate(
          controller.length,
          (index) => Tab(
            child: Container(
              decoration: const BoxDecoration(
                color: AppConst.kBkLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: Center(
                child: ReusableText(
                  text: employees[index].first_name,
                  style: appStyle(16, AppConst.kLight, FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}