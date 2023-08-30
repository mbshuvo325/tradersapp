import 'package:flutter/material.dart';
import 'package:interviewapp/features/auth/presentation/widgets/internet_checker.dart';
import 'package:interviewapp/features/auth/presentation/widgets/login_desktop.dart';
import '../widgets/login_mobile.dart';
import '../widgets/responsive_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ConnectivityChecker(
      buildWidget:  SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: LoginMobile(),
          desktop: LoginDesktop(),
        ),
      ),
    );
  }
}

