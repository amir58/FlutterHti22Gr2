import 'package:flutter/material.dart';
import 'package:untitled/bmi/bmi_result_screen.dart';
import 'package:untitled/style/colors.dart';
import 'package:untitled/widgets/my_counter_item.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool male = true;
  double height = 165;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        // elevation: 0,
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [
          buildMaleFemaleItems(),
          buildHeightItem(),
          buildWeightAndAgeItems(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  Widget buildMaleFemaleItems() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                male = true;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: male ? selectedColor : secondColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.male,
                      size: 66,
                      color: Colors.white,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                male = false;
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: male ? secondColor : selectedColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.female_rounded,
                      size: 66,
                      color: Colors.white,
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeightItem() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Height",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 22,
              ),
            ),
            Text(
              "${height.toInt()}cm",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              value: height,
              min: 50,
              max: 220,
              onChanged: (double value) {
                print(value);
                height = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeightAndAgeItems() {
    return Expanded(
      child: Row(
        children: [
          MyCounterItem(title: "Weight", value: weight),
          MyCounterItem(title: "Age", value: age),
        ],
      ),
    );
  }

  Widget buildCalculateButton() {
    return Container(
      color: pinkColor,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BmiResultScreen(),
              ));
        },
        child: const Text(
          "CALCULATE",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
