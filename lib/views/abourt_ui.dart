import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Body Health Calculator",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // ✅ รูปหลัก
                Image.asset(
                  "assets/images/run.png",
                  height: 120,
                ),

                const SizedBox(height: 20),

                const Text(
                  "คำนวณหาค่าดัชนีมวลกาย (BMI)\n"
                  "คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 40),

                // ✅ โลโก้ล่าง
                Image.asset(
                  "assets/images/sau.png",
                  height: 60,
                ),

                const SizedBox(height: 10),

                const Text(
                  "Developed by NinniN SAU 2026",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
