import 'package:flutter/material.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  final weightCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  String gender = "male";
  double bmr = 0;

  final ScrollController scrollCtrl = ScrollController();
  final resultKey = GlobalKey();

  void calculateBMR() {
    double w = double.tryParse(weightCtrl.text) ?? 0;
    double h = double.tryParse(heightCtrl.text) ?? 0;
    double a = double.tryParse(ageCtrl.text) ?? 0;

    if (w > 0 && h > 0 && a > 0) {
      setState(() {
        if (gender == "male") {
          bmr = 66 + (13.7 * w) + (5 * h) - (6.8 * a);
        } else {
          bmr = 655 + (9.6 * w) + (1.8 * h) - (4.7 * a);
        }
      });

      // 👉 เลื่อนไปผลลัพธ์
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = resultKey.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      ageCtrl.clear();
      bmr = 0;
      gender = "male";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollCtrl,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(
              "คำนวณหาอัตราการเผาผลาญพื้นฐาน (BMR)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Image.asset(
                  "assets/images/bmi.png",
                  height: 100,
                ),

            const SizedBox(height: 20),

            const Text("เพศ"),

            Row(
              children: [
                Radio(
                  value: "male",
                  groupValue: gender,
                  onChanged: (v) => setState(() => gender = v!),
                ),
                const Text("ชาย"),

                const SizedBox(width: 20),

                Radio(
                  value: "female",
                  groupValue: gender,
                  onChanged: (v) => setState(() => gender = v!),
                ),
                const Text("หญิง"),
              ],
            ),

            const SizedBox(height: 10),

            TextField(
              controller: weightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "น้ำหนัก (kg.)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "ส่วนสูง (cm.)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ageCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "อายุ (ปี)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: calculateBMR,
              child: const Text("คำนวณ BMR"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: clearData,
              child: const Text("ล้างข้อมูล"),
            ),

            const SizedBox(height: 30),

            // ✅ ผลลัพธ์
            Container(
              key: resultKey,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text("BMR"),
                  Text(
                    bmr.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Text("kcal/day"),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
