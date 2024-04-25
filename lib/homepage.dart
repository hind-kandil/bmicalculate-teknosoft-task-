// ignore_for_file: camel_case_types

import 'package:bmicalaulate/calculate.dart';
import 'package:bmicalaulate/outputpage.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homePage();
}

class _homePage extends State<HomePage> {
  int selectGender = 0;
  int age = 20;
  int height = 100;
  int weight = 60;
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "BmiCalculatOr",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        _SelectGender(),
        _height(),
        _weightandAge(),
        _bmicalculate(),
      ],
    );
  }

  Widget _SelectGender() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(43, 78, 78, 76),
        borderRadius: BorderRadius.circular(27),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectGender = 1;
                  });
                },
                icon: const Icon(Icons.woman),
                color: selectGender == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.orange,
                iconSize: 89,
              ),
              const Text(
                "Female ",
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectGender = 0;
                  });
                },
                icon: const Icon(Icons.man),
                color: selectGender == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.orange,
                iconSize: 89,
              ),
              const Text(
                "Male",
                style: TextStyle(fontSize: 26),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _height() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(43, 78, 78, 76),
        borderRadius: BorderRadius.circular(27),
      ),
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 30),
          ),
          Slider(
              min: 0,
              max: 300,
              divisions: 300,
              value: height.toDouble(),
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              }),
          Text(
            "$height cm",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _weightandAge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _weight(),
        _age(),
      ],
    );
  }

  Widget _weight() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(43, 78, 78, 76),
          borderRadius: BorderRadius.circular(11)),
      child: Column(children: [
        const Text(
          "weight",
          style: TextStyle(fontSize: 30),
        ),
        ItemCount(
            initialValue: weight,
            minValue: 1,
            maxValue: 500,
            onChanged: (newvalue) {
              setState(() {
                weight = newvalue.toInt();
              });
            },
            decimalPlaces: 0)
      ]),
    );
  }

  Widget _age() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(43, 78, 78, 76),
          borderRadius: BorderRadius.circular(11)),
      child: Column(children: [
        const Text(
          "Age",
          style: TextStyle(fontSize: 30),
        ),
        ItemCount(
            initialValue: age,
            minValue: 1,
            maxValue: 150,
            onChanged: (newvalue) {
              setState(() {
                age = newvalue.toInt();
              });
            },
            decimalPlaces: 0)
      ]),
    );
  }

  Widget _bmicalculate() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(5),
              child: const Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )),
            onPressed: () {
              Calculate calc = Calculate(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calc.result(),
                    resultText: calc.getText(),
                    advise: calc.getAdvise(),
                    textColor: calc.getTextColor(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
