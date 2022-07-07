import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tugas_calculator/hasil.dart';

import 'main.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> _history = [
    'dummy 1',
    'dummy 1',
    'dummy 1',
    'dummy 1',
    '1',
    '2',
    '3',
    '10',
    '11',
    '23',
  ];

  // void sortData() {
  //   if (_history >= '10') {
  //     print(_history[index].toString());
  //   }
  // }

  void dispose() {
    // _history.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Text("Back")),
                ),
              ),
              Text('Hasil > 10'),
              SizedBox(height: 50),
              Text('All Data'),

              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _history.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_history[index]),
                      );
                    }),
              ),
              // ListView.builder(itemBuilder: (context, index) {
              //   return ListTile(
              //     print(sortData()),
              //   );
              // })
            ],
          ),
        ),
      ),
    );
  }
}
