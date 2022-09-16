import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({required this.bmiValue});
  final double bmiValue;
  // var bmivalue = bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 39.9) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }
    return category;
  }

  String getHealthRiskDescription(String categoryName) {
    String decs = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        decs = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        decs = "Low risk (healthy range)";
        break;
      case overweight:
      case obeseI:
      case obeseII:
      case obeseIII:
        decs =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
        break;
      default:
    }
    return decs;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmiValue);
    final bmidecs = getHealthRiskDescription(bmiCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: GoogleFonts.permanentMarker(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      bmiValue.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 88,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      bmidecs,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Colors.red,
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
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
