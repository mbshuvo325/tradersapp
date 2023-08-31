import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/core/utils/utils.dart';
import '../../data/data_source/local/local_data_storage.dart';
import '../controllers/profile_controller.dart';
import '../widgets/asset_image.dart';
import '../widgets/internet_checker.dart';
import '../widgets/text_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    // controller.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityChecker(
      buildWidget: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.darkGreen,
          title: TextRenderer(
            value: CustomString.dashBoard,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(
                onPressed: () {
                  LocalDtaSource.clearBox();
                  AppRoute.routeToLogin();
                },
                icon: const Icon(Icons.logout,color: Colors.white,),
              ),
            )
          ],
        ),
        body: Obx(()=>controller.userData.value != null ?
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: AssetImageRenderer(
                      path: CustomImages.appLogo,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextRenderer(
                        value:"Name : ",
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      TextRenderer(
                        value: controller.userData.value!.name ?? "Name not found",
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextRenderer(
                        value:"Balance : ",
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      TextRenderer(
                        value: controller.userData.value!.balance.toString() ?? "Name not found",
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRenderer(
                        value: "User Info",
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  Text(controller.userData.toJson()),
                ],
              ),
            ),
          ),
        ) : Container()),
      ),
    );
  }
}
