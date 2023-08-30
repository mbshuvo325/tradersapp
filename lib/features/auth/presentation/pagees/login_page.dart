import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/build_card.dart';
import '../widgets/responsive_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Traders',
                    style: GoogleFonts.roboto(
                        fontSize: 72,
                        color: const Color(0xff1877F2),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                      'Traders helps you to manage your trades',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  buildCard(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create a Page',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' for a celebrity, band or business.',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Traders',
                    style: GoogleFonts.roboto(
                        fontSize: 72,
                        color: const Color(0xff1877F2),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Traders helps you to manage your trades',
                    style: GoogleFonts.roboto(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 150),
                  buildCard(),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        'Create a Page',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' for a celebrity, band or business.',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
