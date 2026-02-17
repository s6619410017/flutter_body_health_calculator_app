import 'package:flutter/material.dart';
import 'home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3), // หน่วยเป็นวินาที
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeUI()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF00000), // สีพื้นหลัง
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // โลโก้หรือภาพที่ต้องการแสดงใน Splash Screen
            Image.asset(
              'assets/images/ca.png', // ใส่ path ของโลโก้ที่ต้องการ
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // ข้อความหรือชื่อแอป
            const Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
       ), 
    );
  }
}
