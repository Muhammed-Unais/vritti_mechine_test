import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/utils/utils.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/hieght_spacer.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';
import 'package:vritti_mechine_test/features/home/model/employee.dart';
import 'package:vritti_mechine_test/features/home/view/widgets/action_button.dart';
import 'package:vritti_mechine_test/features/home/view/widgets/employee_detilas_field.dart';
import 'package:vritti_mechine_test/features/home/view_model/home_view_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kGreyLight,
        borderRadius: BorderRadius.circular(10),
      ),
      width: AppConst.kWidth,
      child: Consumer<HomeViewModel>(
        builder: (context, homeProvider, _) {
          return Column(
            children: [
              const HightSpacer(hieght: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: AppConst.kGreyLight,
                backgroundImage: NetworkImage(
                  employee.avatar,
                ),
              ),
              const HightSpacer(hieght: 10),
              ExpansionTile(
                initiallyExpanded: true,
                title: ReusableText(
                  text: "${employee.first_name} ${employee.last_name}",
                  style: appStyle(
                    12.w,
                    AppConst.kLight,
                    FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_drop_down,
                  color: AppConst.kLight,
                ),
                children: [
                  EmployeeDetailsField(
                    controller: homeProvider.firstnameController,
                    enabled: homeProvider.isUpdate,
                    fieldText: "First Name : ${employee.first_name}",
                  ),
                  EmployeeDetailsField(
                    controller: homeProvider.lastNameController,
                    enabled: homeProvider.isUpdate,
                    fieldText: "Last Name : ${employee.last_name}",
                  ),
                  EmployeeDetailsField(
                    controller: homeProvider.emailController,
                    enabled: homeProvider.isUpdate,
                    fieldText: "Email : ${employee.email}",
                  ),
                ],
              ),
              HightSpacer(hieght: 10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButton(
                    buttonText: "Update",
                    icon: Icons.edit,
                    color: AppConst.kBkDark,
                    textColor: AppConst.kLight,
                    iconColor: AppConst.kLight,
                    onTap: () {
                      if (!homeProvider.isUpdate) {
                        homeProvider.setIsUpdate(true, employee);
                      } else {
                        final firstName = homeProvider.firstnameController.text;
                        final lastName = homeProvider.lastNameController.text;
                        final email = homeProvider.emailController.text;
                        homeProvider.update(
                          contex: context,
                          firstName: firstName,
                          lastName: lastName,
                          email: email,
                          employee: employee,
                        );
                      }
                    },
                  ),
                  ActionButton(
                    buttonText: homeProvider.isUpdate ? "Close" : "Delete",
                    icon: homeProvider.isUpdate ? Icons.close : Icons.delete,
                    color: AppConst.kRed,
                    textColor: AppConst.kLight,
                    iconColor: AppConst.kLight,
                    onTap: () {
                      if (homeProvider.isUpdate) {
                        homeProvider.setIsUpdate(false);
                      } else {
                        Utils.showDeleteDialog(
                          context,
                          onPressed: () async {
                            await homeProvider.delete(employee.id,context);
                          },
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
