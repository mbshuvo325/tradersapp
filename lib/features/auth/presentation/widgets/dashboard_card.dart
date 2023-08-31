import 'package:flutter/material.dart';
import 'package:interviewapp/features/auth/presentation/widgets/text_widget.dart';

import '../../../../core/utils/utils.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key, required this.option, required this.value});
  final String option;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.29,
      width: MediaQuery.of(context).size.width * 0.29,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextRenderer(
            value: value ?? "",
            color: CustomColor.darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          const SizedBox(
            height: 5,
          ),
          TextRenderer(
            value: option ?? "",
            color: CustomColor.darkGreen,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
