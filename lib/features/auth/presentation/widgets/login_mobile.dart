import 'package:flutter/material.dart';
import 'package:interviewapp/features/auth/presentation/widgets/asset_image.dart';
import 'package:interviewapp/features/auth/presentation/widgets/text_widget.dart';

import '../../../../core/utils/utils.dart';
import 'build_card.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            AssetImageRenderer(path:CustomImages.appLogo,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            TextRenderer(value:CustomString.traders,color: CustomColor.darkGreen,fontWeight: FontWeight.bold,fontSize: 50,),
            const SizedBox(height: 15),
            TextRenderer(value:CustomString.tradersHelpManageTrade,color: CustomColor.liteGreen,fontWeight: FontWeight.normal,fontSize: 18,),
            const SizedBox(height: 20),
            BuildCard(),
          ],
        ),
      ),
    );
  }
}
