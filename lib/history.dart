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
  List<String> dummy = [
    // 'dummy 1',
    // 'dummy 1',
    // 'dummy 1',
    // 'dummy 1',
    '1',
    '2',
    '3',
    '10',
    '11',
    '23',
  ];

  void _delete(int i) async {
    dummy.removeAt(i);
  }

  //     List<HHasil> _history = [HHasil(angkanya: [i],operatornya: [HHasil.i])];
  // void dispose() {
  //   // _history.dispose();
  //   super.dispose();
  // }

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
              SizedBox(
                height: 20,
              ),
              Text(
                'Hasil > 10',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dummy.length,
                  itemBuilder: (context, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dummy[i]),
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _delete(i)),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Text(
                'All Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dummy.length,
                  itemBuilder: (context, i) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dummy[i]),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(i)),
                        ]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
