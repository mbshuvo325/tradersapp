import 'package:flutter/material.dart';
import 'package:interviewapp/features/auth/presentation/widgets/build_card.dart';
import 'package:interviewapp/features/auth/presentation/widgets/text_widget.dart';

import '../../../../core/utils/utils.dart';

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRenderer(value:CustomString.traders,color: CustomColor.darkGreen,fontWeight: FontWeight.bold,fontSize: 72,),
            TextRenderer(value:CustomString.tradersHelpManageTrade,color: CustomColor.liteGreen,fontWeight: FontWeight.normal,fontSize: 28,),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 150),
            BuildCard(),
            const SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}
