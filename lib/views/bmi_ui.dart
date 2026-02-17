import 'package:flutter/material.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  final weightCtrl = TextEditingController();
  final heightCtrl = TextEditingController();

  double bmi = 0;

  void calculateBMI() {
    double w = double.tryParse(weightCtrl.text) ?? 0;
    double h = double.tryParse(heightCtrl.text) ?? 0;

    if (w > 0 && h > 0) {
      setState(() {
        bmi = w / ((h / 100) * (h / 100));
      });
    }
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      bmi = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 10),

            const Text(
              "คำนวณหาค่าดัชนีมวลกาย (BMI)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Image.asset(
                  "assets/images/bmi.png",
                  height: 100,
                ),
            const SizedBox(height: 20),

            TextField(
              controller: weightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "น้ำหนัก (kg.)",
                border: OutlineInputBorder(),
                hintText: "กรอกน้ำหนักของคุณ",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "ส่วนสูง (cm.)",
                border: OutlineInputBorder(),
                hintText: "กรอกส่วนสูงของคุณ",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: calculateBMI,
              child: const Text("คำนวณ BMI"),
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

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text("BMI"),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
