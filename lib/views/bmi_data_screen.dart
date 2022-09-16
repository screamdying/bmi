// import 'package:bmi/helpers/bmi_calculator.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import '../constants/constant.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 180;
  int weight = 54;
  int age = 20;
  String? gender;

  double calculateBmi() {
    // double heightInMeter = height / 100;
    // final h = (heightInMeter * heightInMeter);
    // final bmi = weight / h;
    final bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.permanentMarker(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? Colors.blue : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.male,
                      title: 'Male',
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? Colors.pink : primaryColor,
                      child: const GenderIconText(
                          icon: Icons.female, title: 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$height", style: numberTextStyle),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 200,
                    thumbColor: Colors.red,
                    inactiveColor: Colors.yellow,
                    activeColor: Colors.yellow,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.17,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                itemExtent: 25,
                                magnification: 1.5,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  // print(val);
                                  weight = val + 100;
                                },
                                children: generateList(20, 200),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: labelTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.17,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 17),
                                itemExtent: 25,
                                magnification: 1.5,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  // print(val);
                                  weight = val + 20;
                                },
                                children: generateList(10, 90),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // final bmiCalculator =
              //     BmiCalculator(height: height, weight: weight);
              final bmiCalculate = calculateBmi();
              // print(bmiCalculate.toStringAsFixed(1));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmiValue: bmiCalculate,
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: Colors.red,
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272a4e),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 92,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(title, style: labelTextStyle),
      ],
    );
  }
}
