import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Requests extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  List allData = [];
  var user_id;

  @override
  void initState() {
    super.initState();
    getData();
    getfunction();
  }

  void getData() async {
    CollectionReference req = FirebaseFirestore.instance.collection('requests');
    QuerySnapshot querySnapshot = await req.get();
    setState(() {
      allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
    // print("success");
  }

  void getfunction() async {
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
    }
  }

  void acceptRequest(Map<String, dynamic> requestData) async {
    print(requestData);

    if (user_id != null) {
      CollectionReference acceptedRequests = FirebaseFirestore.instance
          .collection('travels_vechiles')
          .doc(user_id)
          .collection('accepted_requests');

      await acceptedRequests.add(requestData);
      print("saved");
    } else {
      print("User ID is null. Unable to save data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        backgroundColor: Colors.black, // Change the app bar color here
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        allData[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8),
                          Text(
                            'Phone Number: ${allData[index]['Phonenumber']}',
                          ),
                          SizedBox(height: 4),
                          Text(
                            'College: ${allData[index]['Collage']}',
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Action to perform on accepting the request
                          // You can add your logic here
                          acceptRequest(allData[index]);
                          print('Accepted ${allData[index]['name']}');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
