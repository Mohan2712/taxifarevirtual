import 'package:flutter/material.dart';

import '../summary/summary.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController distance = TextEditingController();
  TextEditingController waitingTime = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String vehicle = "";
  String? fare;

  String? discount;
  String? noDisFare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Home - Taxi",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Choose the vehicle type",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    title: Text("Auto"),
                    value: "auto",
                    groupValue: vehicle,
                    onChanged: (value) {
                      setState(() {
                        vehicle = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Car"),
                    value: "car",
                    groupValue: vehicle,
                    onChanged: (value) {
                      setState(() {
                        vehicle = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Van"),
                    value: "van",
                    groupValue: vehicle,
                    onChanged: (value) {
                      setState(() {
                        vehicle = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: distance,
                    decoration: InputDecoration(
                      labelText: 'Distance Travelled',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: waitingTime,
                    decoration: InputDecoration(
                      labelText: 'Waiting Time',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate() &&
                            vehicle.isNotEmpty) {
                          calculateFare();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Summary(
                                    discount: discount,
                                    waitingTime: waitingTime.text,
                                    fare: fare,
                                    distance: distance.text,
                                    vehicle: vehicle,
                                    noDiscount: noDisFare,
                                  )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Give the input before calculate'),
                            ),
                          );
                          print("Not Validated");
                        }
                      },
                      child: Text("Calculate fare")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateFare() {
    switch (vehicle) {
      case "auto":
        _autoFareCalculation();
        print("Auto is selected");
        break;
      case "car":
        print("Car is selected");
        _carFareCalculation();
        break;
      case "van":
        print("Van is selected");
        _vanFareCalculation();
        break;
    }
  }

  void _autoFareCalculation() {
    fare =
        "${30 + (12 * int.parse(distance.text)) + ((int.parse(waitingTime.text)) * 80) - 0}";
    discount = "0";
    print("THis is $fare");
  }

  void _carFareCalculation() {
    noDisFare =
        "${(60 + (21 * int.parse(distance.text)) + ((int.parse(waitingTime.text)) * 150))}";
    fare = "${double.parse(noDisFare!) * (1 - 5 / 100)}";
    discount = "${double.parse(noDisFare!) - double.parse(fare!)}";
    if (double.parse(discount!) > 50) {
      fare = "${double.parse(noDisFare!) - 50}";
      discount = "50";
      print('$fare  maximum discount 50');
    } else {
      fare = fare;
      discount = discount;
    }
    print(
        "car is $fare &&&& car Discount is $discount......Without Discount $noDisFare");
  }

  void _vanFareCalculation() {
    noDisFare =
        "${(100 + (25 * int.parse(distance.text)) + ((int.parse(waitingTime.text)) * 200))}";
    fare = "${double.parse(noDisFare!) * (1 - 10 / 100)}";
    discount = "${double.parse(noDisFare!) - double.parse(fare!)}";
    if (double.parse(discount!) > 100) {
      fare = "${double.parse(noDisFare!) - 100}";
      discount = "100";
      print('$fare  maximum discount 100');
    } else {
      fare = fare;
      discount = discount;
    }
    print(
        "car is $fare &&&& car Discount is $discount......Without Discount $noDisFare");
  }
}
