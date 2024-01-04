import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  final String phoneNumber;
  SignUp({required this.phoneNumber});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  var fullName = "";
  var email = "";
  var admissionNumber = "";

  Future<void> storeDataWithCustomId(
      String customId, Map<String, dynamic> data) async {
    try {
      await firestore.collection('users').doc(customId).set(data);
      print('Data stored successfully!');
    } catch (e) {
      print('Error storing data: $e');
    }
  }

  final collage = ['SRMAP'];
  String? collage_name;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 18),
        ),
      );

  Widget vehicleDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          value: collage_name,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          items: collage.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() => collage_name = value as String?),
          decoration: InputDecoration(
            labelText: "Vehicle Type",
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(color: Colors.black),
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
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 32.0,
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      "Sign up to make your journey \n"
                      "comfortable and affordable",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              onChanged: (name) {
                fullName = name;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            // Add other form fields here similarly
            vehicleDropdown(),
            TextFormField(
                onChanged: (mail) {
                  email = mail;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                )),

            TextFormField(
                onChanged: (admno) {
                  admissionNumber = admno;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Admission number',
                  prefixIcon: Icon(Icons.email),
                )),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String customId = widget.phoneNumber;
                Map<String, dynamic> data = {
                  'Name': fullName,
                  'email': email,
                  'Admission_number': admissionNumber,
                  'phonenumber': widget.phoneNumber,
                  'collage': collage_name,
                };
                await storeDataWithCustomId(customId, data);
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
