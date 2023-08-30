import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:interviewapp/features/auth/presentation/pagees/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'features/auth/data/data_source/local/local_data_storage.dart';
import 'features/auth/presentation/pagees/login_page.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized(); // Required for path_provider
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
