import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/drawer.dart';
import '../pages/userdashboard.dart';

class VolunteerForm extends StatefulWidget {
  const VolunteerForm({super.key});
  static const routeName = 'volunteer';
  @override
  State<VolunteerForm> createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  String? _selectedValue1 = 'Education For Street Children';
  String gender = '';

  void _handleDropdownValueChanged1(String value) {
    setState(() {
      _selectedValue1 = value;
    });
  }

  String? _selectedValue2 = 'Full-Time';

  void _handleDropdownValueChanged2(String value) {
    setState(() {
      _selectedValue2 = value;
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  var name = '';
  var phone = '';
  var emailid = '';
  var address = '';
  var typeofvolunteer = '';
  var availabletime = '';

  void login() async {
    final isvalid = _formKey.currentState!.validate();

    if (isvalid) {
      _formKey.currentState?.save();
      setState(() {
        isloading = true;
      });
      try {
        CollectionReference volunteerDonation =
            FirebaseFirestore.instance.collection('volunteer_registration');
        volunteerDonation.add({
          'name': name,
          'phone': phone,
          'address': address,
          'emailid': emailid,
          'typeofvolunteer': _selectedValue1,
          'availabletime': _selectedValue2,
          'gender': gender,
        });
        showAboutDialog(context: context, children: [
          AlertDialog(
            title: const Text('Success'),
            content: const Text('Registration Successful'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ]);
        setState(() {
          isloading = false;
        });
        Navigator.of(context).pushReplacementNamed(UserDashboard.routeName);
      } on FirebaseAuthException catch (error) {
        setState(() {
          isloading = false;
        });
        var msg = 'An error occured';
        if (error.message != null) {
          msg = error.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
          ),
        );
      } catch (error) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(
        title: const Text('Volunteer Registration'),
        backgroundColor: Colors.purple,
      ),
      drawer: const AppDra(),
      body: SizedBox(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => name = newValue!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this';
                            }
                            return null;
                          },
                          key: const ValueKey('a'),
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.text_format,
                            ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter name here",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => phone = newValue!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }

                            return null;
                          },
                          key: const ValueKey('b'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter Phone",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Address",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => address = newValue!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }

                            return null;
                          },
                          key: const ValueKey('d'),
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.text_fields,
                            ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter address here",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Email ID",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => emailid = newValue!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }

                            return null;
                          },
                          key: const ValueKey('e'),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter emailid here",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 8),
                          child: Text(
                            "Type Of Volunteer",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedValue1,
                            onChanged: (value) {
                              _handleDropdownValueChanged1(value!);
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 'Education For Street Children',
                                child: Text('Education For Street Children'),
                              ),
                              DropdownMenuItem(
                                value: 'Rescuing Dogs',
                                child: Text('Rescuing Dogs'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 8),
                          child: Text(
                            "Available Time",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedValue2,
                            onChanged: (value) {
                              _handleDropdownValueChanged2(value!);
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 'Full-Time',
                                child: Text('Full-Time'),
                              ),
                              DropdownMenuItem(
                                value: 'Part-Time',
                                child: Text('Part-Time'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 15,
                      bottom: 5,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Gender',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'male',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                            const Text('Male'),
                            Radio(
                              value: 'female',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: login,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade500,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: isloading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
