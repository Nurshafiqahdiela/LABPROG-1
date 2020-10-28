import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController _height = new TextEditingController();
  TextEditingController _weight = new TextEditingController();

  double boer = 0, james = 0, hume = 0, child = 0;
  double percentB = 0, percentJ = 0, percentH = 0, percentC = 0;
  double fatB = 0, fatJ = 0, fatH = 0, fatC = 0;
  String lbm = "";
  int gender = 0, age = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lean Body Mass Calculator'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Gender  ',
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    Radio(
                      value: 1,
                      groupValue: gender,
                      onChanged: _handleChangeGender,
                    ),
                    Text('Male', style: new TextStyle(fontSize: 20.0)),
                    Radio(
                      value: 2,
                      groupValue: gender,
                      onChanged: _handleChangeGender,
                    ),
                    Text('Female', style: new TextStyle(fontSize: 20.0)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Are you 14 or younger?',
                        style: new TextStyle(fontSize: 20.0)),
                    Radio(
                      value: 3,
                      groupValue: age,
                      onChanged: _handleChangeAge,
                    ),
                    Text('Yes', style: new TextStyle(fontSize: 20.0)),
                    Radio(
                      value: 4,
                      groupValue: age,
                      onChanged: _handleChangeAge,
                    ),
                    Text('No', style: new TextStyle(fontSize: 20.0)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    controller: _height,
                    keyboardType: TextInputType.numberWithOptions(),
                    style: new TextStyle(
                        fontSize: 22.0,
                        color: Colors.black
    ,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway"),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        hintText: "Your Height (CM)",
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(),
                    style: new TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway"),
                    controller: _weight,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        hintText: "Your Weight (KG)",
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
                  child: new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    elevation: 10.0,
                    minWidth: 200.0,
                    height: 50,
                    color: Colors.blue,
                    child: new Text('CALCULATE LBM',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.black)),
                    onPressed: _leanBodyMassOperation,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(1.5),
                        child: Table(
                          border: TableBorder.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 3.0),
                          children: [
                            TableRow(children: [
                              Text(
                                "Formula",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Lean Body Mass (KG)",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Body Fat",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "Boer",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${boer.toStringAsFixed(1) + "(" + percentB.toStringAsFixed(0) + "%" + ")"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${fatB.toStringAsFixed(0) + "%"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "James",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${james.toStringAsFixed(1) + "(" + james.toStringAsFixed(0) + "%" + ")"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${james.toStringAsFixed(0) + "%"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "Hume",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${hume.toStringAsFixed(1) + "(" + percentH.toStringAsFixed(0) + "%" + ")"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${fatH.toStringAsFixed(0) + "%"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ]),
                            TableRow(children: [
                              Text(
                                "Age<14",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.4,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${child.toStringAsFixed(1) + "(" + percentC.toStringAsFixed(0) + "%" + ")"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${fatC.toStringAsFixed(0) + "%"}",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleChangeGender(int value) {
    setState(() {
      gender = value;
    });
  }

  void _handleChangeAge(int value) {
    setState(() {
      age = value;
    });
  }

  void _leanBodyMassOperation() {
    double h = double.parse(_height.text);
    double w = double.parse(_weight.text);

    setState(() {
      if (gender == 1 && age == 4) {
        boer = 0.407 * w + 0.267 * h - 19.2;
        james = 1.1 * w - (128 * (pow((w / h), 2)));
        hume = 0.32810 * w + 0.33929 * h - 29.5336;

        print(boer);
        print(james);
        print(hume);

        fatB = 100 - (boer / w) * 100;
        fatJ = 100 - (james / w) * 100;
        fatH = 100 - (hume / w) * 100;

        print(fatB);
        print(fatJ);
        print(fatH);

        percentB = 100 - fatB;
        percentJ = 100 - fatJ;
        percentH = 100 - fatH;

        print(percentB);
        print(percentJ);
        print(percentH);
      } else if (gender == 2 && age == 4) {
        boer = 0.252 * w + 0.473 * h - 48.3;
        james = 1.07 * w - (148 * (pow((w / h), 2)));
        hume = 0.29569 * w + 0.41813 * h - 43.2933;

        print(boer);
        print(james);
        print(hume);

        fatB = 100 - (boer / w) * 100;
        fatJ = 100 - (james / w) * 100;
        fatH = 100 - (hume / w) * 100;

        print(fatB);
        print(fatJ);
        print(fatH);

        percentB = 100 - fatB;
        percentJ = 100 - fatJ;
        percentH = 100 - fatH;

        print(percentB);
        print(percentJ);
        print(percentH);
      } else {
        double ecv = 0.0215 * pow(w, 0.6469) * pow(h, 0.7236);
        child = 3.8 * ecv;
        fatC = 100 - (child / w) * 100;
        percentC = 100 - fatC;

        print(child);
        print(percentC);
        print(fatC);
      }
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
