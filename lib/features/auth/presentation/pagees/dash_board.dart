import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/core/utils/utils.dart';
import '../../data/data_source/local/local_data_storage.dart';
import '../controllers/profile_controller.dart';
import '../widgets/asset_image.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/internet_checker.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/text_widget.dart';

class DashBoardPage extends StatelessWidget {
 DashBoardPage({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());
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
                onPressed: () async{
                  Dialogs.showLoadingDialog(message: "Logging out");
                  Future.delayed(const Duration(seconds: 2),(){
                    LocalDtaSource.clearBox();
                    AppRoute.routeToLogin();
                    Get.back();
                  });
                },
                icon: const Row(
                  children: [
                    TextRenderer(
                      value: "Log Out",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.logout,color: Colors.white,),
                  ],
                ),
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
                      height: 70,
                      width: 70,
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextRenderer(
                        value: "Open Trades",
                        color: CustomColor.liteGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.liteGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: (){
                            controller.getCurrentOpenTrades();
                          },child: const Row(
                            children: [
                              Icon(Icons.refresh,color: Colors.white,size: 15,),
                              TextRenderer(
                        value: "Refresh",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Obx(
                    ()=>controller.tradeLoading.value ?
                    Center(child: CircularProgressIndicator(color: CustomColor.liteGreen,),) :
                    controller.openTrades.isNotEmpty ?
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.openTrades.length,
                          itemBuilder: (context,index){
                          var item = controller.openTrades[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: CustomColor.liteGreen,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5,
                                      offset: const Offset(0,0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextRenderer(
                                      value: "Ticket : ${item.ticket}",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    const SizedBox(height: 5,),
                                    TextRenderer(
                                      value: "Current Price : ${item.currentPrice?.toStringAsFixed(item.digits!)}",
                                      color: CustomColor.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    const SizedBox(height: 5,),
                                    TextRenderer(
                                      value: "Open Price : ${item.openPrice?.toStringAsFixed(item.digits!)}",
                                      color: CustomColor.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    const SizedBox(height: 5,),
                                    TextRenderer(
                                      value: "Profit: ${item.profit?.toStringAsFixed(item.digits!)}",
                                      color: CustomColor.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ) : Container(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextRenderer(
                    value: "Total Profit : ${controller.totalProfit.value.toStringAsFixed(2)}",
                    color: CustomColor.darkGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextRenderer(
                    value: "Account Info",
                    color: CustomColor.liteGreen,
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
