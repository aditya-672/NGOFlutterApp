import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/drawer.dart';
import '../pages/userdashboard.dart';

class BookForm extends StatefulWidget {
  const BookForm({super.key});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  var name = '';
  var phone = '';
  var address = '';
  var book = '';

  void login() async {
    final isvalid = _formKey.currentState!.validate();

    if (isvalid) {
      _formKey.currentState?.save();
      setState(() {
        isloading = true;
      });
      try {
        CollectionReference bookDonation = FirebaseFirestore.instance.collection('bookdonation');
        bookDonation.add({
          'name':name,
          'phone' : phone,
          'address':address,
          'book': book,
        });
        Navigator.of(context).pushReplacementNamed(UserDashboard.routeName);
        setState(() {
          isloading = false;
        });
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
      } catch (error) {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(title: const Text('Donation For Books'),backgroundColor: Colors.purple,),
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
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please fill this field';
                          //   }
                          //   if (value.length < 7) {
                          //     return 'Password should of atleast 8 characteres';
                          //   }
                          //   return null;
                          // },
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
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       _obscureText = !_obscureText;
                            //     });
                            //   },
                            //   icon: const Icon(Icons.remove_red_eye_outlined),
                            // ),
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
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please fill this field';
                          //   }
                          //   if (value.length < 7) {
                          //     return 'Password should of atleast 8 characteres';
                          //   }
                          //   return null;
                          // },
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
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       _obscureText = !_obscureText;
                            //     });
                            //   },
                            //   icon: const Icon(Icons.remove_red_eye_outlined),
                            // ),
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
                            "Number Of Books",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => book = newValue!,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please fill this field';
                          //   }
                          //   if (value.length < 7) {
                          //     return 'Password should of atleast 8 characteres';
                          //   }
                          //   return null;
                          // },
                          key: const ValueKey('e'),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.book,
                            ),
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       _obscureText = !_obscureText;
                            //     });
                            //   },
                            //   icon: const Icon(Icons.remove_red_eye_outlined),
                            // ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter no. of books here",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}