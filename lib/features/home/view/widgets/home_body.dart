import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/hieght_spacer.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';
import 'package:vritti_mechine_test/common/widgets/width_spacer.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';
import 'package:vritti_mechine_test/features/home/view/widgets/employee_card.dart';
import 'package:vritti_mechine_test/features/home/view/widgets/home_tabbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.controller,
    required this.employees,
  });

  final TabController controller;
  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          HightSpacer(hieght: 25.h),
          Row(
            children: [
              Icon(
                Icons.person,
                color: AppConst.kLight,
                size: 20.w,
              ),
              WidthSpacer(width: 10.w),
              ReusableText(
                text: "Employees",
                style: appStyle(
                  18,
                  AppConst.kLight,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
          HightSpacer(hieght: 25.h),
          HomeTabbar(
            controller: controller,
            employees: employees,
          ),
          HightSpacer(hieght: 25.h),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: List.generate(
                controller.length,
                (index) => SingleChildScrollView(
                  child: Column(
                    children: [
                      EmployeeCard(
                        employee: employees[index],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




