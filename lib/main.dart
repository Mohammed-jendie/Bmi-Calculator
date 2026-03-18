import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMale = true;
  bool isFeMale = false;

  final Color inactiveColor = const Color.fromARGB(255, 97, 97, 97);
  final Color activeColor = const Color.fromARGB(255, 52, 52, 52);

  double height = 150;
  double weight = 50;
  double age = 20;

  Timer? _timer;

  double calculateResult(double a, double b) {
    return (a / (pow(b / 100, 2)));
  }

  void increaseTimerage() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (age < 100) {
          age++;
        }
      });
    });
  }

  void minusTimerage() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (age > 10) {
          age--;
        }
      });
    });
  }

  void increaseTimerweight() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (weight < 150) {
          weight++;
        }
      });
    });
  }

  void minusTimerWeight() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (weight > 30) {
          weight--;
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Bmi Calculator',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(175, 105, 240, 175),
            ),
            body: Column(
              children: [
                //!-------------------------------------------(1)--------------------------------------------------------
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                              isFeMale = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isMale == false
                                  ? inactiveColor
                                  : activeColor,
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male, color: Colors.white, size: 75),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFeMale = true;
                              isMale = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isFeMale == false
                                  ? inactiveColor
                                  : activeColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  color: Colors.white,
                                  size: 75,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //!----------------------------------------------(2)-----------------------------------------------------
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: inactiveColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text("Height", style: TextStyle(fontSize: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.round().toString(),
                              style: TextStyle(fontSize: 26),
                            ),
                            Text("cm", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Slider(
                          activeColor: Colors.greenAccent,
                          min: 120,
                          max: 220,
                          value: height,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //!----------------------------------------------(3)-------------------------------------------------------
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: inactiveColor,
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("weight", style: TextStyle(fontSize: 25)),
                              Text(
                                weight.round().toString(),
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      minusTimerWeight();
                                    },
                                    onLongPressEnd: (details) {
                                      stopTimer();
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (weight > 30) {
                                            weight--;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        fixedSize: Size(50, 50),
                                        iconColor: Colors.greenAccent,
                                      ),
                                      child: Icon(Icons.remove),
                                    ),
                                  ),

                                  GestureDetector(
                                    onLongPress: () {
                                      increaseTimerweight();
                                    },
                                    onLongPressEnd: (details) {
                                      stopTimer();
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (weight < 200) {
                                            weight++;
                                          }
                                        });
                                      },

                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        fixedSize: Size(50, 50),
                                        iconColor: Colors.greenAccent,
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: inactiveColor,
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Age", style: TextStyle(fontSize: 25)),
                              Text(
                                age.round().toString(),
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      minusTimerage();
                                    },
                                    onLongPressEnd: (details) {
                                      stopTimer();
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (age > 10) {
                                            age--;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        fixedSize: Size(50, 50),
                                        iconColor: Colors.greenAccent,
                                      ),
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  GestureDetector(
                                    onLongPress: () {
                                      increaseTimerage();
                                    },
                                    onLongPressEnd: (details) {
                                      stopTimer();
                                    },

                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (age < 100) {
                                            age++;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        fixedSize: Size(50, 50),
                                        iconColor: Colors.greenAccent,
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //!----------------------------------------------(The Button)-----------------------------------------------
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      final result = calculateResult(weight, height);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black87,
                            title: Text("Result"),
                            content: SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                    "${result.round()}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    classifyBmi(result),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(350, 20),
                    ),
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String classifyBmi(double bmi) {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi < 25.0) {
      return "Normal weight";
    } else if (bmi < 30.0) {
      return "Overweight";
    } else
      // ignore: curly_braces_in_flow_control_structures
      return "Obese";
  }
}
