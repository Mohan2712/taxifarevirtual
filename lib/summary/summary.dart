import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Summary extends StatefulWidget {
  String? distance;
  String? waitingTime;
  String? fare;
  String? discount;
  String? vehicle;
  String? noDiscount;

  Summary(
      {Key? key,
      required this.discount,
      required this.waitingTime,
      required this.fare,
      required this.distance,
      required this.vehicle,
      required this.noDiscount})
      : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 85,
                ),
                Text(
                  "Summary",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 200, child: Lottie.asset('assets/cartaxi.json')),
            Text(
              " Vehicle : ${widget.vehicle}".toUpperCase(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Distance Travelled: ${widget.distance} km",
              style: TextStyle(fontSize: 20, overflow: TextOverflow.visible),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Waiting Time: ${widget.waitingTime} hr ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Fare without discount: \u20B9 ${widget.noDiscount} ",
              style: TextStyle(fontSize: 20, overflow: TextOverflow.visible),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Total Fare with discount: \u20B9 ${widget.fare} ",
              style: TextStyle(fontSize: 20, overflow: TextOverflow.visible),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Discount: \u20B9 ${widget.discount} ",
              style: TextStyle(fontSize: 20, overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    );
  }
}
