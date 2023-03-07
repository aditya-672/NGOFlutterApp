import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventmanagementapp/adminwidget/singleformwidget.dart';
import 'package:eventmanagementapp/colors.dart';
import 'package:eventmanagementapp/models/form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});
  static const routeName = 'feedbackform';
  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  var adminname;

  void getemailData() async {
    final userId = FirebaseAuth.instance.currentUser;
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('admins');
    final userData = userCollection.doc(userId!.uid).get();
    userData.then((value) {
      var data = value.data();
      print(data);
      adminname = data;
      print(adminname['headname']);
      // String a = data!['headname'];
    });
    // print(a);
  }

  @override
  void initState() {
    getemailData();
    // TODO: implement initState
    super.initState();
  }

  bool cur1 = false;
  var _currentstep = 0;
  var questlen = 1;
  var formdet =
      FForm(formkey: '', responsedata: [], adminid: '', eventname: '');
  StepperType stepperType = StepperType.horizontal;
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  void _setData(FForm newData) {
    formdet = newData;
  }

  final TextEditingController eventname = TextEditingController();
  final TextEditingController noat = TextEditingController();

  String? get _errorText1 {
    // at any time, we can get the text from _controller.value.text
    final text = eventname.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorText2 {
    // at any time, we can get the text from _controller.value.text
    final text = noat.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepsType,
        child: const Icon(Icons.list),
      ),
      appBar: AppBar(
        title: const Text('Creating Feedback Form'),
      ),
      body: Center(
        child: Stepper(
          type: stepperType,
          physics: const ScrollPhysics(),
          steps: [
            Step(
              title: const Text('Form Info'),
              content: Column(
                children: [
                  TextField(
                    controller: eventname,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                      errorText: cur1 ? _errorText1 : null,
                    ),
                    style: const TextStyle(
                      color: mainFontColor,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: noat,
                    decoration: InputDecoration(
                      labelText: 'Number Of Attendees',
                      errorText: cur1 ? _errorText2 : null,
                    ),
                    style: const TextStyle(
                      color: mainFontColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              isActive: _currentstep >= 0,
              state:
                  _currentstep >= 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text('Create'),
              content: SingleChildScrollView(
                child: Column(
                  children: [SingleForm(onGetData: _setData)],
                ),
              ),
              isActive: _currentstep >= 0,
              state:
                  _currentstep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text('Review'),
              content: Column(
                children: const [
                  Text('Hello'),
                ],
              ),
              isActive: _currentstep >= 0,
              state:
                  _currentstep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
          currentStep: _currentstep,
          onStepTapped: (value) {
            setState(() {
              _currentstep = value;
            });
          },
          onStepContinue: () {
            if (_currentstep == 0) {
              print('0');
              setState(() {
                cur1 = true;
              });
              if (_errorText1 != null && _errorText2 != null) {
                return;
              }
            }
            if (_currentstep == 1) {
              print('Below are the form details');
              print(formdet.responsedata);
              CollectionReference forms =
                  FirebaseFirestore.instance.collection('forms');
              forms.add({
                'formkey': formdet.formkey,
                'eventname': eventname.text,
                'numberofattendees': noat.text,
                'responses': formdet.responsedata[0],
                'admin': adminname['headname'],
              });
            }
            _currentstep < 2 ? setState(() => _currentstep += 1) : null;
          },
          onStepCancel: () {
            _currentstep > 0 ? setState(() => _currentstep -= 1) : null;
          },
        ),
      ),
    );
  }
}
