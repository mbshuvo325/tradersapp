import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/core/utils/utils.dart';
import '../../data/data_source/local/local_data_storage.dart';
import '../controllers/profile_controller.dart';
import '../widgets/asset_image.dart';
import '../widgets/dashboard_card.dart';
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRenderer(
                        value:"Phone : ",
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Obx(
                          ()=> TextRenderer(
                            value: controller.userPhone.value ?? controller.userData.value!.phone!,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRenderer(
                        value:"Address : ",
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextRenderer(
                          value: "${controller.userData.value!.address.toString()}," +
                              " ${controller.userData.value!.zipCode.toString()}," +
                              " ${controller.userData.value!.city.toString()}," +
                              " ${controller.userData.value!.country.toString()}",
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextRenderer(
                    value: "Account Info",
                    color: CustomColor.darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashBoardCard(
                              option: "Current Trades Count",
                              value: controller.userData.value!.currentTradesCount!.toString(),
                            ),
                            DashBoardCard(
                              option: "Current Trades Volume",
                              value: controller.userData.value!.currentTradesVolume!.toStringAsFixed(2),
                            ),
                            DashBoardCard(
                              option: "Equity",
                              value: controller.userData.value!.equity!.toStringAsFixed(2),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashBoardCard(
                              option: "Free Margin",
                              value: controller.userData.value!.freeMargin!.toStringAsFixed(2),
                            ),
                            DashBoardCard(
                              option: "Is Any Open Trades",
                              value: controller.userData.value!.isAnyOpenTrades! ? "Yes" : "No",
                            ),
                            DashBoardCard(
                              option: "Is Swap Free",
                              value: controller.userData.value!.isSwapFree! ? "Yes" : "No",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashBoardCard(
                              option: "Leverage",
                              value: controller.userData.value!.leverage!.toString(),
                            ),
                            DashBoardCard(
                              option: "Total Trade Count",
                              value: controller.userData.value!.totalTradesCount.toString(),
                            ),
                            DashBoardCard(
                              option: "Total Trade volume",
                              value: controller.userData.value!.totalTradesVolume!.toStringAsFixed(2),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashBoardCard(
                              option: "Currency",
                              value: controller.userData.value!.currency!.toString(),
                            ),
                            DashBoardCard(
                              option: "Type",
                              value: controller.userData.value!.type.toString(),
                            ),
                            DashBoardCard(
                              option: "Verification Level",
                              value: controller.userData.value!.verificationLevel!.toString(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) : Container()),
      ),
    );
  }
}
