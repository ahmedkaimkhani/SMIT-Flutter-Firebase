import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_smit_flutter/practice/home_view.dart';
import 'package:firebase_smit_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 character long';
    }
    return null;
  }

  signup() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String userId = credential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'id': userId,
        'name': nameController,
        'contact': contactController,
        'email': emailController
      });

      Utils().toastMessage('Account created');

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeViews(),
          ));
      setState(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        Utils().toastMessage(e.toString());
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        Utils().toastMessage(e.toString());
      }
    } catch (e) {
      // print(e);
      Utils().toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: validateName,
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    TextFormField(
                      validator: validateContact,
                      decoration: const InputDecoration(hintText: 'Contact'),
                    ),
                    TextFormField(
                      validator: validateEmail,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    TextFormField(
                      validator: validatePassword,
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  signup();
                }
              },
              child: Text('Sign up'))
        ],
      ),
    );
  }
}
