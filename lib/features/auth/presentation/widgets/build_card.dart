import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewapp/core/utils/utils.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/presentation/controllers/auth_controller.dart';
import 'package:interviewapp/features/auth/presentation/widgets/input_form_widget.dart';

class BuildCard extends StatelessWidget {
  BuildCard({Key? key}) : super(key: key);

 final TextEditingController idController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final formKey = GlobalKey<FormState>();
 final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.liteGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Container(
        width: 430,
        height: 315,
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: InputRenderer(hintText: CustomString.inputUserId,controller: idController,keyBoardType: TextInputType.number,),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: InputRenderer(hintText: CustomString.password,controller: passwordController,keyBoardType: TextInputType.text),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 9.0, bottom: 15.0, left: 9.0, right: 9.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.darkGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // <-- Radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            CustomString.login,
                            style: GoogleFonts.roboto(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            LoginRequest request = LoginRequest(login: int.parse(idController.text), password: passwordController.text);
                            controller.useCase(request);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}