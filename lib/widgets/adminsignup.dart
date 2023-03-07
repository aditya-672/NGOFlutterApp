import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});
  static const routeName = 'signup';

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference admins = FirebaseFirestore.instance.collection('admins');
  bool _obscureText = true;
  var email = '';
  var committee_name = '';
  var headname = '';
  var password = '';

  void login() async {
    final isvalid = _formKey.currentState!.validate();

    if (isvalid) {
      try {
        _formKey.currentState?.save();
        FocusScope.of(context).unfocus();
        UserCredential res = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        res.user?.updateDisplayName('admin');
        await admins.doc(res.user?.uid).set({
          'email': email,
          'committee_name': committee_name,
          'headname': headname,
          'role':'admin',
        });
      } on PlatformException catch (error) {
        var msg = 'An error occured';
        if (error.message != null) {
          msg = error.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
          ),
        );
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
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
                        "Committee Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff67727d),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this';
                        }
                        return null;
                      },
                      onSaved: (newValue) => committee_name = newValue!,
                      key: const ValueKey('a'),
                      textInputAction: TextInputAction.next,
                      cursorColor: black,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.group_outlined,
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
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
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff67727d),
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (newValue) => email = newValue!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this';
                        }
                        return null;
                      },
                      key: const ValueKey('a'),
                      textInputAction: TextInputAction.next,
                      cursorColor: black,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        suffixIconColor: Colors.black,
                        hintText: "Enter email here",
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
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
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
                        "President/Chairperson Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff67727d),
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (newValue) => headname = newValue!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this';
                        }
                        return null;
                      },
                      key: const ValueKey('a'),
                      textInputAction: TextInputAction.next,
                      cursorColor: black,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_4_outlined,
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
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
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
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff67727d),
                        ),
                      ),
                    ),
                    TextFormField(
                      onSaved: (newValue) => password = newValue!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        if (value.length < 7) {
                          return 'Password should of atleast 8 characteres';
                        }
                        return null;
                      },
                      key: const ValueKey('b'),
                      textInputAction: TextInputAction.done,
                      obscureText: _obscureText,
                      cursorColor: black,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        suffixIconColor: Colors.black,
                        hintText: "********",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.5),
                      ),
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
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
