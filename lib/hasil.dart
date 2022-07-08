import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tugas_calculator/history.dart';
import 'package:tugas_calculator/main.dart';

class HHasil extends StatefulWidget {
  final List angkanya;
  final List operatornya;

  const HHasil({Key? key, required this.angkanya, required this.operatornya})
      : super(key: key);

  @override
  State<HHasil> createState() => _HHasilState(angkanya, operatornya);
}

class _HHasilState extends State<HHasil> {
  final List angkanya;
  final List operatornya;

  TextEditingController hasil = new TextEditingController();

  _HHasilState(this.angkanya, this.operatornya);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int total = 0;
    total = total + int.parse(angkanya[0].toString());

    for (var i = 0; i < angkanya.length; i++) {
      if (i >= 1) {
        if (operatornya[i - 1] == "+") {
          total += int.parse(angkanya[i].toString());
        } else if (operatornya[i - 1] == "-") {
          total -= int.parse(angkanya[i].toString());
        } else if (operatornya[i - 1] == "X") {
          total *= int.parse(angkanya[i].toString());
        } else if (operatornya[i - 1] == "/") {
          double hasil = total / angkanya[i];
          total = int.parse(hasil.floor().toString());
        } else if (operatornya[i - 1] == "^") {
          var hasil = pow(total, angkanya[i]);
          total = int.parse(hasil.floor().toString());
        }
      }
      hasil.text += angkanya[i].toString();
      hasil.text += operatornya[i].toString();
    }
    hasil.text += total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hasil",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil"),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                enabled: false,
                controller: hasil,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text("Back")),
            ],
          ),
        ),
      ),
    );
  }
}
