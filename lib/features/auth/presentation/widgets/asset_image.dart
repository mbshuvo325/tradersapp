import 'package:flutter/material.dart';

class AssetImageRenderer extends StatelessWidget {
  const AssetImageRenderer({Key? key, required this.path, required this.height, required this.width}) : super(key: key);
  final String path;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path,height: height,width: width,fit: BoxFit.cover,);
  }
}
