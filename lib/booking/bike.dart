import 'package:flutter/material.dart';
import 'package:goeasy/booking/get_bike.dart';
class bike extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BikeState();
}

class BikeState extends State<bike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back, size: 30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Image.asset(
                      "assets/images/bike.png",
                      width: 400, // Set the width here
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Goeasy Rentals",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.hourglass_top, size: 20),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Keep a bike and drive it for up to 12 \n hours",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_bag, size: 20),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Ideal for business meetings, tourist \n travel, and multiple stops trips",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.front_hand, size: 20),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "As many stops as you need",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>getbike()));
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
