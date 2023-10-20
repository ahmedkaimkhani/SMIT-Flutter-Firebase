import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomStorage extends StatefulWidget {
  const CustomStorage({super.key});

  @override
  State<CustomStorage> createState() => _CustomStorageState();
}

class _CustomStorageState extends State<CustomStorage> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Pick image'))
        ],
      ),
    );
  }
}
