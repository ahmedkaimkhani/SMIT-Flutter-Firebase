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

  bool isUpdate = false;
  String userUpdateId = '';

  addUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .add({'name': nameController.text, 'contact': contactController.text})
        .then((value) => Utils().toastMessage('User data added successfully'))
        .onError(
          (error, stackTrace) => Utils().toastMessage(e.toString()),
        );
    nameController.clear();
    contactController.clear();
  }

  updateUser(userUpdateId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userUpdateId)
        .update(
            {'name': nameController.text, 'contact': contactController.text})
        .then((value) => Utils().toastMessage('Data updated'))
        .onError((error, stackTrace) => Utils().toastMessage(e.toString()));
  }

  customBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: contactController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (isUpdate) {
                      updateUser(userUpdateId);
                    } else {
                      addUsers();
                    }
                  },
                  child: Text(isUpdate ? 'Update' : 'Add'))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // addUsers();
          customBottomSheet();
          setState(() {
            isUpdate = false;
          });
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
                    key: Key(abc.id),
                    title: Text('${abc['name']}  ${abc.id}'),
                    subtitle: Text('${abc['contact']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isUpdate = true;
                                nameController.text = abc['name'];
                                contactController.text = abc['contact'];
                              });
                              userUpdateId = abc.id;
                              customBottomSheet();
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(abc.id)
                                  .delete();
                            },
                            icon: const Icon(Icons.delete))
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
