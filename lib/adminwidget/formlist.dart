import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormList extends StatelessWidget {
  const FormList({super.key});

  @override
  Widget build(BuildContext context) {
    var forml = FirebaseFirestore.instance.collection('forms');
    return StreamBuilder(
      stream: forml.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final formData = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemBuilder: (context, index) {
            return Container(
              child: Text(formData[index]['eventname']),
            );
          },
          itemCount: formData.length,
        );
      },
    );
    ;
  }
}
