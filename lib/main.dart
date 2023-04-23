import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do you think this is the largest number?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _i = 1;
  List<int> _myList=[23,42,53,23,12,89,34,56,78,90];

  
  void reset() {
    setState(() {
      _myList = generateRandomIntList(10, 100, 900);
      _i = 1;
    });
  }

  List<int> generateRandomIntList(int length, int min, int max) {
    final random = Random();
    return List.generate(length, (index) => min + random.nextInt(max - min));
  }
  int max(List<int> list) {
    int max = list[0];
    for (int i = 1; i < list.length; i++) {
      if (list[i] > max) {
        max = list[i];
      }
    }
    return max;
  }


  void _reject() {
    setState(() {
      if (_i < 10) {
        _i++;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary offers"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Remember! there is no going back \n ${10-_i} salary packages ahead\n\n ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 30.0),
            Text(
              "${_myList[_i-1]}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _reject,
                  child: Text("Reject"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text('Your Score'),
                          ),
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Maximum package: ${max(_myList)}\nYour package: ${_myList[_i-1]}\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  'Score: ${(100 * _myList[_i-1] / max(_myList)).toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        reset();
                                      },
                                      child: Text('Retry'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        SystemNavigator.pop();
                                      },
                                      child: Text('Exit'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

                  },
                  child: Text("Accept"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}