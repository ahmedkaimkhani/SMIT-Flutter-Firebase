import 'package:cloud_firestore/cloud_firestore.dart';
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
        .add({'name': 'Ahmed', 'contact': '031571863'});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
