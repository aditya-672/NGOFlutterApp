import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/drawer.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});
  static const routeName = 'volunteerpage';
  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> databaseReference = FirebaseFirestore.instance
        .collection('volunteer_registration')
        .snapshots();

    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(
        title: const Text(
          'Volunteer Pages',
        ),
        backgroundColor: Colors.purple,
      ),
      drawer: const AppDra(),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: databaseReference,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return Container(
                  height: MediaQuery.of(context).size.height - 109,
                  width: double.infinity,
                  child: ListView(
                    padding: const EdgeInsets.all(2),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        leading: data['gender'] == 'male'
                            ? const CircleAvatar(
                                foregroundImage: AssetImage("assets/man.png"),
                              )
                            : const CircleAvatar(
                                foregroundImage: AssetImage("assets/woman.png"),
                              ),
                        title: Text(data['name'],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                        subtitle: Text(data['phone'],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w200),),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
