import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MbiScreen extends StatefulWidget {
  const MbiScreen({super.key});
  @override
  State<MbiScreen> createState() => _MbiScreenState();
}

class _MbiScreenState extends State<MbiScreen> {
  double height = 150;
  int age = 19;
  int weight = 55;
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Color(0xFF212641),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = "male";
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: gender == "male"
                              ? const Color(0xFF5A7DFF).withOpacity(.2)
                              : const Color(0xFFFFEEF2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: gender == "male"
                                ? const Color(0xFF5A7DFF)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          Icons.male,
                          color: Color(0xFF5A7DFF),
                          size: 70,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212641),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = "female";
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: gender == "female"
                              ? const Color(0xFFF56DAA).withOpacity(.2)
                              : const Color(0xFFFFEEF2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: gender == "female"
                                ? const Color(0xFFF56DAA)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          Icons.female,
                          color: Color(0xFFF56DAA),
                          size: 70,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Female <3",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212641),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFFFFEEF2),
              ),
              child: Column(
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Color(0xFF212641),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${height.toInt()} cm",
                    style: const TextStyle(
                      color: Color(0xFF212641),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: height,
                    min: 60,
                    max: 230,
                    activeColor: const Color(0xFFF56DAA),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEEF2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF212641),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.small(
                              heroTag: 'w_add',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF212641),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton.small(
                              heroTag: 'w_remove',
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: const Color(0xFF212641),
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEEF2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF212641),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$age',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.small(
                              heroTag: 'a_add',
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: const Color(0xFF212641),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            FloatingActionButton.small(
                              heroTag: 'a_remove',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: const Color(0xFF212641),
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
Container(
  width: double.infinity,
  height: 55,
  decoration: BoxDecoration(
    color: const Color(0xFFF56DAA),
    borderRadius: BorderRadius.circular(20),
  ),
  child: MaterialButton(
    onPressed: () {
      double bmi = weight / ((height / 100) * (height / 100));
      String result;

      if (bmi < 18.5) {
        result = "Underweight";
      } else if (bmi >= 18.5 && bmi < 25) {
        result = "Healthy";
      } else if (bmi >= 25 && bmi < 30) {
        result = "Overweight";
      } else {
        result = "Obese";
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              "Your BMI Result",
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bmi.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
    child: const Text(
      'Check your BMI',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}