import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vritti_mechine_test/common/utils/constants.dart';
import 'package:vritti_mechine_test/common/widgets/app_style.dart';
import 'package:vritti_mechine_test/common/widgets/reuseble_text.dart';
import 'package:vritti_mechine_test/data/app_response/status.dart';
import 'package:vritti_mechine_test/features/home/view/widgets/home_body.dart';
import 'package:vritti_mechine_test/features/home/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<HomeViewModel>().initilize(vysnc: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kBkDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: ReusableText(
            text: "Dashboard",
            style: appStyle(18, AppConst.kLight, FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            width: 25.w,
            height: 25.w,
            decoration: const BoxDecoration(
              color: AppConst.kLight,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: GestureDetector(
              onTap: () async{
                await context.read<HomeViewModel>().refresh(isApiFetching: true);
              },
              child: const Icon(
                Icons.refresh,
                color: AppConst.kBkDark,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<HomeViewModel>(
          builder: (context, homeProvider, _) {
            switch (homeProvider.getAllEmployeesResponse.status) {
              case Status.completed:
                final data = homeProvider.getAllEmployeesResponse.data;
                if (homeProvider.tabController != null) {
                  return HomeBody(
                    controller: homeProvider.tabController!,
                    employees: data!,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return Center(
                  child: Text(
                    homeProvider.getAllEmployeesResponse.message ?? "",
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
