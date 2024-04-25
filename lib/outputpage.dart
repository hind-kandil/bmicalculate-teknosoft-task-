import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  const ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("back"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 155, 186, 233),
                  borderRadius: BorderRadius.circular(32)),
              margin: const EdgeInsets.all(12),
              child: const Text(
                'Your Result:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 155, 186, 233),
                    ),
                    child: Text(
                      bmi,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                const Text(
                  'Normal BMI range:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '18.5 - 25 kg/m2',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  advise,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  constraints: const BoxConstraints.tightFor(
                    width: 200.0,
                    height: 56.0,
                  ),
                  fillColor: Color.fromARGB(255, 149, 165, 245),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    'SAVE RESULT',
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.repeat ,color: Colors.blue, size: 35,)),
          ),
        ],
      ),
    );
  }
}
