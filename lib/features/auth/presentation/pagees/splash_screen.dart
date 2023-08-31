import 'package:flutter/material.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/core/utils/utils.dart';
import 'package:interviewapp/features/auth/presentation/widgets/text_widget.dart';
import '../../data/data_source/local/local_data_storage.dart';
import '../widgets/asset_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  decideRoute() async {
    LocalDtaSource.getToken().then((value) {
      Future.delayed(const Duration(seconds: 3),(){
        if(value != null){
          AppRoute.routeToDashBoard();
        }else{
          AppRoute.routeToLogin();
        }
      });
    });
  }

  @override
  void initState() {
    decideRoute();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AssetImageRenderer(path:CustomImages.appLogo,
            height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.4,
           ),
            TextRenderer(value:CustomString.bestTrade,color: CustomColor.darkGreen,fontWeight: FontWeight.bold,fontSize: 30,)
          ],
        )
      ),
    );
  }
}
