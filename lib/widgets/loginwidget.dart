import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  bool _obscureText = true;
  var email = '';
  var password = '';

  void login() async {
    final isvalid = _formKey.currentState!.validate();

    if (isvalid) {
      _formKey.currentState?.save();
      setState(() {
        isloading = true;
      });
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        // ignore: use_build_context_synchronously
        // Navigator.of(context).pushReplacementNamed(UserDashboard.routeName);
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
                child: Center(
                  child: isloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
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
