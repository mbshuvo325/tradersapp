import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectivityChecker extends StatelessWidget {
  const ConnectivityChecker({Key? key, required this.buildWidget}) : super(key: key);
  final Widget buildWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             body: SafeArea(
               child: OfflineBuilder(
                connectivityBuilder:(
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
                ){
            final bool connected = connectivity != ConnectivityResult.none;
            return Stack(
                fit: StackFit.expand,
                children: [
                  child,
                  Positioned(
                    height: 30.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: connected ? Colors.transparent : const Color(0xFFEE4400),
                      child: Center(
                        child: Text(connected ? '' : 'Device not connected to internet...!',
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                ],
            );
               }, child: buildWidget,
          ),
             ),
    );
  }
}
