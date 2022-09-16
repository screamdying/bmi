// import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
  double? bmiCalculator2;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }
  // double calculateBmi() {
  //   double heightInMeter = height! / 100;
  //   final h = (heightInMeter * heightInMeter);
  //   bmi = weight! / h;

  //   return bmi!;
  // }

  // String determineBmiCategory(double bmiValue) {
  //   String category = "";
  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue < 17) {
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue < 25) {
  //     category = normal;
  //   } else if (bmiValue < 30) {
  //     category = overweight;
  //   } else if (bmiValue < 35) {
  //     category = obeseI;
  //   } else if (bmiValue < 39.9) {
  //     category = obeseII;
  //   } else if (bmiValue >= 40.0) {
  //     category = obeseIII;
  //   }
  //   bmiCategory = category;
  //   return bmiCategory!;
  // }

  // String getHealthRiskDescription(String categoryName) {
  //   String decs = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       decs = "Possible nutritional deficiency and osteoporosis";
  //       break;
  //     case normal:
  //       decs = "Low risk (healthy range)";
  //       break;
  //     case overweight:
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       decs =
  //           "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus";
  //       break;
  //     default:
  //   }
  //   bmiDescription = decs;
  //   return decs;
  // }
}
