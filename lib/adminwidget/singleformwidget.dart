import 'package:eventmanagementapp/models/form.dart';
import 'package:flutter/material.dart';

class SingleForm extends StatefulWidget {
  final Function(FForm newData) onGetData;

  const SingleForm({super.key, required this.onGetData});

  @override
  State<SingleForm> createState() => _SingleFormState();
}

class _SingleFormState extends State<SingleForm> {
  var formdetails = FForm(
    formkey: '',
    responsedata: [],
    adminid: '',
    eventname: '',
  );

  List<List<String>> resp = [[]];
  List<Map<String,dynamic>> mapdata = [];
  // List<Map<String, String>> perForm = [{}];

  final List<String> _fields = [''];

  final List<GlobalKey<FormState>> _keys = [
    GlobalKey<FormState>(),
  ];

  // final List<List<TextEditingController>> _controllers = [
  //   [
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //     TextEditingController(),
  //   ],
  // ];

  // List get cont {
  //   List list = [];
  //   for (var i = 0; i < 5; i++) {
  //     list.add(TextEditingController());
  //   }
  //   return list;
  // }

  List newData = [];
  var a = [];

  void _addFormField() {}

  void _removeFormField(int index) {
    // _controllers.removeAt(index);
    // resp.removeAt(index);
    setState(() {
      _fields.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter fields:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 16.0),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        _fields.length,
                        (index) => Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Question ${index + 1}'),
                                  Form(
                                    key: _keys[index],
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          // controller: _controllers[index][i],
                                          decoration: const InputDecoration(
                                            labelText: 'Enter Question Here',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newData.add(newValue!);
                                            // perForm.add({'Question'});
                                            // formdetails = FForm(
                                            //   formkey: _keys[index]
                                            //       .currentState
                                            //       .toString(),
                                            //   responsedata: [['hi',]],
                                            //   stuid: 'stuid',
                                            //   adminid: 'adminid',
                                            //   eventname: 'event',
                                            // );
                                          },
                                        ),
                                        const Divider(),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Option 1',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newData.add(newValue!);
                                            // perForm.add({'Question'});
                                            // formdetails = FForm(
                                            //   formkey: _keys[index]
                                            //       .currentState
                                            //       .toString(),
                                            //   responsedata: [newData],
                                            //   stuid: 'stuid',
                                            //   adminid: 'adminid',
                                            //   eventname: 'event',
                                            // );
                                          },
                                        ),
                                        const Divider(),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Option 2',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            // perForm.add({'Question'});
                                            newData.add(newValue!);
                                            // formdetails = FForm(
                                            //   formkey: _keys[index]
                                            //       .currentState
                                            //       .toString(),
                                            //   responsedata: [[][2].add(newValue)],
                                            //   stuid: 'stuid',
                                            //   adminid: 'adminid',
                                            //   eventname: 'event',
                                            // );
                                          },
                                        ),
                                        const Divider(),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Option 3',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newData.add(newValue!);
                                            // perForm.add({'Question'});
                                            // formdetails = FForm(
                                            //   formkey: _keys[index]
                                            //       .currentState
                                            //       .toString(),
                                            //   responsedata: [[][3].add(newValue)],
                                            //   stuid: 'stuid',
                                            //   adminid: 'adminid',
                                            //   eventname: 'event',
                                            // );
                                          },
                                        ),
                                        const Divider(),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Option 4',
                                            border: OutlineInputBorder(),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter a value';
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            newData.add(newValue!);
                                            // perForm.add({'Question'});
                                            // formdetails = FForm(
                                            //   formkey: _keys[index]
                                            //       .currentState
                                            //       .toString(),
                                            //   responsedata: [[][4].add(newValue)],
                                            //   stuid: 'stuid',
                                            //   adminid: 'adminid',
                                            //   eventname: 'event',
                                            // );
                                          },
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextButton(
                                          onPressed: () {
                                            a = newData;
                                            // resp.add(newData);
                                            // print(index);
                                            // mapdata.add({
                                            //   index.toString(): [newData],
                                            // });
                                            formdetails = FForm(
                                              formkey: _keys[index]
                                                  .currentState
                                                  .toString(),
                                              responsedata: [newData],
                                              adminid: 'adminid',
                                              eventname: 'event',
                                            );
                                            // resp
                                            // mapdata.removeAt(index);
                                            // newData.clear();
                                            // resp.clear();
                                            // print(_controllers[index]);
                                            // _controllers[index].clear();
                                            // print('Hieeeeeeeee');
                                            // print(_controllers);
                                            if (_keys[index]
                                                .currentState!
                                                .validate()) {
                                              _keys[index].currentState?.save();
                                              print(formdetails.responsedata);
                                              widget.onGetData(formdetails);
                                              // Do something with the form data
                                              // for (List field
                                              //     in formdetails.responsedata) {
                                              //   print('object');
                                              //   print(field);
                                              // }
                                              setState(() {
                                                _fields.add('');
                                                _keys.add(
                                                    GlobalKey<FormState>());
                                              });
                                            }
                                          },
                                          child: const Text('Add'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _removeFormField(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // ElevatedButton(
        //   onPressed: _addFormField,
        //   child: const Text('Add'),
        // ),
      ],
    );
  }
}
