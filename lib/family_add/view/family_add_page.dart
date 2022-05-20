import 'package:flutter/material.dart';
import '../family_add.dart';

class FamilyAddPage extends StatefulWidget {
  const FamilyAddPage({Key? key}) : super(key: key);

  @override
  State<FamilyAddPage> createState() => _FamilyAddPageState();
}

class _FamilyAddPageState extends State<FamilyAddPage> {
  final nameEngController = TextEditingController();
  final nameArController = TextEditingController();
  final phoneController = TextEditingController();
  final wfpController = TextEditingController();
  final unhcrController = TextEditingController();
  final peopleController = TextEditingController();
  final womenController = TextEditingController();
  final childrenController = TextEditingController();
  final elderlyController = TextEditingController();
  final medController = TextEditingController();
  final eduController = TextEditingController();
  final empController = TextEditingController();
  final unempController = TextEditingController();
  final note1Controller = TextEditingController();
  final note2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              spacing: 16,
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Card(
                    elevation: 8.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameEngController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Name (eng)..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameArController,
                            decoration: const InputDecoration(
                              filled: true,
                              labelText: "Name (ar)...",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Phone..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: wfpController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "WFP AID (yes/no)..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: unhcrController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "UNHCR..."),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Card(
                    elevation: 8.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: peopleController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "People count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: womenController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Women count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: childrenController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Children count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: elderlyController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Elderly count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: medController,
                            decoration: const InputDecoration(
                                filled: true,
                                labelText: "Medical Case count..."),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: eduController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Educated count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: empController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Employed count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: unempController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Unemployed count..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: note1Controller,
                            decoration: const InputDecoration(
                                filled: true, labelText: "NOTE 1..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: note2Controller,
                            decoration: const InputDecoration(
                                filled: true, labelText: "NOTE 2..."),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40)),
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
