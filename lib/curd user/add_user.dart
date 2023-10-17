import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_smit_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class CurdAddUsers extends StatefulWidget {
  const CurdAddUsers({super.key});

  @override
  State<CurdAddUsers> createState() => _CurdAddUsersState();
}

class _CurdAddUsersState extends State<CurdAddUsers> {
  addUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .add({'name': 'Ahmed', 'contact': '031571863'})
        .then((value) => Utils().toastMessage('User data added successfully'))
        .onError((error, stackTrace) => Utils().toastMessage('$e'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addUsers();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs.toString());
            return ListView.builder(
              itemBuilder: (context, index) {
                return const ListTile();
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
