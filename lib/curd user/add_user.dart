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
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  addUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .add({'name': nameController, 'contact': contactController})
        .then((value) => Utils().toastMessage('User data added successfully'))
        .onError((error, stackTrace) => Utils().toastMessage('$e'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // addUsers();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                    ),
                    TextField(
                      controller: contactController,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('Add'))
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.docs.toString());
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot abc = snapshot.data!.docs[index];
                  print(abc.id);
                  return ListTile(
                    title: Text('${abc['name']}  ${abc.id}'),
                    subtitle: Text('${abc['contact']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
