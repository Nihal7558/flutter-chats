import 'package:chats/model/service/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  TextEditingController messagecntroller = TextEditingController();
  final useremail = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 45, 45),
        title: Text(
          "The Wall",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseServices().logout();
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 219, 217, 217),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something happened.!'),
              );
            }

            final doc = snapshot.data?.docs;
            if (doc == null) {
              return Center(
                child: Text('no datas'),
              );
            }

            return Center(
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: doc.length,
                    itemBuilder: (context, index) {
                      final indexdata = doc[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: ListTile(
                            title: Text(indexdata['mail'].toString()),
                            subtitle: Text(indexdata['message'].toString()),
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                    "assets/profile-removebg-preview.png")),
                          ),
                        ),
                      );
                    },
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: messagecntroller,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: IconButton(
                                onPressed: () {
                                  FirestoreServices().createData(
                                      messagecntroller.text, context);
                                  messagecntroller.clear();
                                },
                                icon: Icon(Icons.send_rounded)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Logged in as $useremail")
                ],
              ),
            );
          }),
    );
  }
}
