import '../widgets/adminlogin.dart';
import '../widgets/adminsignup.dart';
import '../widgets/loginwidget.dart';
import '../widgets/signupwidget.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = 'login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  bool isAdmin = false;
  void showSignup() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isAdmin
                    ? isLogin
                        ? const AdminLogin()
                        : const AdminSignup()
                    : isLogin
                        ? const LoginWidget()
                        : const SignUpWidget(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                  child: TextButton(
                    onPressed: showSignup,
                    child: Text(
                      isLogin
                          ? "Don't have an account ? Sign Up"
                          : 'Already have an account ?',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                if (!isAdmin)
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAdmin = !isAdmin;
                            });
                          },
                          child: const Text(
                            "Admin",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
