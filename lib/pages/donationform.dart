import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/drawer.dart';
import '../pages/userdashboard.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  var name = '';
  var phone = '';
  var address = '';
  var amount = '';
  int amt = 0;
  void login() async {
    final isvalid = _formKey.currentState!.validate();

    if (isvalid) {
      _formKey.currentState?.save();
      setState(() {
        isloading = true;
      });
      try {
        amt = int.parse(amount);
        Razorpay razorpay = Razorpay();
        var options = {
          'key': 'rzp_test_Nvihc8F52KnOUP',
          'amount': amt * 100,
          'name': name,
          'description': 'Fine T-Shirt',
          'retry': {'enabled': true, 'max_count': 1},
          'send_sms_hash': true,
          'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
          'external': {
            'wallets': ['paytm']
          }
        };
        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
        razorpay.on(
            Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
        razorpay.on(
            Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
        razorpay.open(options);
        CollectionReference amountDonation =
            FirebaseFirestore.instance.collection('amountdonation');
        amountDonation.add({
          'name': name,
          'phone': phone,
          'address': address,
          'amount': amount,
        });
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Donated Successfully"),
          ),
        );
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

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(
        title: const Text('Monetory Donation'),
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
                            "Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff67727d),
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => amount = newValue!,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill this field';
                            }
                            return null;
                          },
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
                              Icons.currency_rupee_sharp,
                            ),
                            suffixIconColor: Colors.black,
                            hintText: "Enter amount here",
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
                  onTap: () {
                    login();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: isloading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Submit Now",
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
