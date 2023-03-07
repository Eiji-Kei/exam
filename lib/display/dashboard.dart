// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/class/Rooms.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  List <Rooms> _rooms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List <Rooms> allRooms = [];
    db.collection("roomAssignment").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          Rooms rooms = Rooms(
            id: docSnapshot.id,
            type: docSnapshot.data()['type'] ?? '',
            pic1: docSnapshot.data()['pic1'] ?? '',
            pic2: docSnapshot.data()['pic2'] ?? '',
            description: docSnapshot.data()['description'] ?? '',
            rate: docSnapshot.data()['rate'] ?? 0,
            floor: docSnapshot.data()['floor'] ?? '',
          );
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          allRooms.add(rooms);
        }
        setState(() {
          _rooms = allRooms;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Rooms'),
    ),
    body: _rooms.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      _rooms[index].pic1 != null ? Image.network(_rooms[index].pic1!) : Container(),
                      SizedBox(height: 10),
                      Text(_rooms[index].type ?? ''),
                      SizedBox(height: 10),
                      Text(_rooms[index].description ?? ''),
                      SizedBox(height: 10),
                      Text('\$${_rooms[index].rate ?? ''} per night'),
                    ],
                  ),
                );
              },
            ),
          )
        : CircularProgressIndicator(),
  );
}

}