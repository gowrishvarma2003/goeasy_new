import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getbike extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => getbikestate();
}

class getbikestate extends State<getbike> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> storeDataWithCustomId(
      String customId, Map<String, dynamic> data) async {
    try {
      // Provide the custom ID while adding the document
      await firestore.collection('requests').doc(customId).set(data);
      print('Data stored successfully!');
    } catch (e) {
      print('Error storing data: $e');
    }
  }

  void getfunction() async {
    var user_id;
    var idToCheck;
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      user_id = user.phoneNumber;
      if (user_id != null) {
        setState(() {
          user_id = user_id?.replaceFirst("+91", "");
          idToCheck = user_id;
          print(user_id);
        });
      }
      final detailes = await FirebaseFirestore.instance
          .collection('users')
          .doc(idToCheck)
          .get();
      var name = detailes['Name'];
      var collage = detailes['collage'];
      var email = detailes['email'];
      var admission = detailes['Admission_number'];
      print(name);
      print(collage);
      print(email);
      print(admission);

      // CollectionReference bike_requests =FirebaseFirestore.instance.collection('requests');
      Map<String, dynamic> data = {
        "name": name,
        "Phonenumber": user_id,
        "Collage": collage,
        "Email": email,
        "AdmissionNumber": admission,
        "status": "pending"
      };
      storeDataWithCustomId(user_id, data);
    }
  }

  @override
  bool agree = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                //   MaterialPageRoute(builder: (context) => home()),
                // );
              },
            ),
          )),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  "Instrctions",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              "this is the first instructionb",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              "this is the first instructionb",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              "this is the first instructionb",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              "this is the first instructionb",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Checkbox(
                        value: agree,
                        onChanged: (bool? value) {
                          setState(() {
                            agree = value!;
                          });
                          print(agree);
                        }),
                    Text(
                      "Read the Instructions carefully and agree \n to the above conditions",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                      // padding: EdgeInsets.symmetric(horizontal: 200),
                      backgroundColor: Colors.black),
                  child: Text(
                    "Get Bike",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (agree) {
                      getfunction();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => getbike()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
