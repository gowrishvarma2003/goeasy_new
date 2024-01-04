import 'package:flutter/material.dart';
// import 'package:goeasy/screens/registration/vechileregister.dart';
// import 'package:goeasy/screens/loadingscreens/registration_successful.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class seller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sellerstate();
}

class _sellerstate extends State<seller> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // CollectionReference collage_vechiles = FirebaseFirestore.instance.collection('travels_vechiles');
  final vechiles = ['Bike'];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
      );

  String? first_name;
  String? last_name;
  String? travelsName;
  var phonenumber;
  String? vechile_type;
  String? pincode;
  String? city;
  String? street;

  var user_id;

  void getid() async {
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      user_id = user.phoneNumber;
      if (user_id != null) {
        setState(() {
          user_id = user_id?.replaceFirst("+91", "");
        });
      }
    }
  }

  Widget name() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              onChanged: (name) {
                first_name = name;
              },
              decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ))),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              onChanged: (name) {
                last_name = name;
              },
              decoration: const InputDecoration(
                fillColor: Colors.black,
                border: OutlineInputBorder(),
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                )),
                // errorText: validate && (phonenumber?.isEmpty ?? true)
                //   ? "This Field cannot be empty"
                //   :null      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget travels_Name() {
    return Container(
      child: Container(
        // height: 100,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: TextFormField(
          onChanged: (name) {
            travelsName = name;
          },
          decoration: InputDecoration(
            fillColor: Colors.black,
            border: OutlineInputBorder(),
            labelText: 'Travels name',
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            // errorText: validate && (phonenumber?.isEmpty ?? true)
            //     ? "This Field cannot be empty"
            //     :null
          ),
        ),
      ),
    );
  }

  Widget phone() {
    getid();
    return Container(
      child: Container(
        // height: 100,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: TextFormField(
          // onChanged: (number) {
          //   phonenumber = number;
          // },
          enabled: false,
          initialValue: user_id,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.black,
            border: OutlineInputBorder(),
            labelText: user_id,
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            // errorText: validate && (phonenumber?.isEmpty ?? true)
            //     ? "This Field cannot be empty"
            //     :null
          ),
        ),
      ),
    );
  }

  Widget vechile() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
          value: vechile_type,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          items: vechiles.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() => this.vechile_type = value),
          decoration: InputDecoration(
            labelText: "vachile type",
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            )),
          ),
        )));
  }

  Widget address() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TextFormField(
                  onChanged: (code) {
                    pincode = code;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      fillColor: Colors.black,
                      border: OutlineInputBorder(),
                      labelText: 'Pincode',
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ))),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  onChanged: (city_name) {
                    city = city_name;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    )),
                    // errorText: validate && (phonenumber?.isEmpty ?? true)
                    //   ? "This Field cannot be empty"
                    //   :null      ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: TextFormField(
            onChanged: (street_name) {
              street = street_name;
            },
            decoration: const InputDecoration(
              fillColor: Colors.black,
              border: OutlineInputBorder(),
              labelText: 'Address, streetname, Building no etc..',
              labelStyle: TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              )),
              // errorText: validate && (phonenumber?.isEmpty ?? true)
              //   ? "This Field cannot be empty"
              //   :null      ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    Future<void> storeDataWithCustomId(
        String customId, Map<String, dynamic> data) async {
      try {
        // Provide the custom ID while adding the document
        await firestore.collection('travels_vechiles').doc(customId).set(data);
        print('Data stored successfully!');
      } catch (e) {
        print('Error storing data: $e');
      }
    }

    Future<void> _register() async {
      String customId = user_id;
      Map<String, dynamic> data = {
        'first_name': first_name,
        'last_name': last_name,
        'phoennumber': user_id,
        'vechiel_type': vechile_type,
        'travels_name': travelsName,
        'pincode': pincode,
        'city': city,
        'street_name': street
      };
      storeDataWithCustomId(customId, data);
    }

    Widget button() {
      return Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 30),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                style: TextButton.styleFrom(
                    // padding: EdgeInsets.symmetric(horizontal: 200),
                    backgroundColor: Colors.black),
                onPressed: () {
                  _register();
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                )),
          ));
    }

    return Scaffold(
      appBar: AppBar(
          // elevation: 0.5,
          backgroundColor: Colors.white,
          title: Container(
            // padding: EdgeInsets.only(bottom: 20),
            // margin: EdgeInsets.only(top: 10),
            child: Text(
              "Travels vechile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: Container(
            // padding: EdgeInsets.only(bottom: 20),
            // margin: EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 25.0,
              color: Colors.black,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Vachileowner()),
                // );
              },
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Welcome",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Enter your detailes",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    name(),
                    travels_Name(),
                    phone(),
                    vechile(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        "Address of travels",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    address(),
                    button(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
