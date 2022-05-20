import 'package:drift/drift.dart' as drift;
import 'package:excel_native/family_data/family_data.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../family_add.dart';

class FamilyAddPage extends StatefulWidget {
  const FamilyAddPage({Key? key}) : super(key: key);

  @override
  State<FamilyAddPage> createState() => _FamilyAddPageState();
}

class _FamilyAddPageState extends State<FamilyAddPage> {
  @override
  void dispose() {
    tentController.dispose();
    nameEngController.dispose();
    nameArController.dispose();
    phoneController.dispose();
    wfpController.dispose();
    unhcrController.dispose();
    peopleController.dispose();
    womenController.dispose();
    childrenController.dispose();
    elderlyController.dispose();
    medController.dispose();
    eduController.dispose();
    empController.dispose();
    unempController.dispose();
    note1Controller.dispose();
    note2Controller.dispose();
    super.dispose();
  }

  final tentController = TextEditingController();
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
    var c = context.read<FamilyDataBloc>().camp;
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
                  height: 450,
                  child: Card(
                    elevation: 8.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: tentController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Tent..."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameEngController,
                            decoration: const InputDecoration(
                              filled: true,
                              labelText: "Name (eng)...",
                            ),
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
                  height: 450,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: eduController,
                            decoration: const InputDecoration(
                                filled: true, labelText: "Educated count..."),
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
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () async {
                  await context
                      .read<MyDatabase>()
                      .familyDao
                      .insertFamily(
                          familysCompanion: FamilysCompanion(
                        campId: drift.Value(c.id),
                        location: drift.Value(c.location),
                        region: drift.Value(c.region),
                        tentId: drift.Value(int.parse(tentController.text)),
                        nameEng: drift.Value(nameEngController.text),
                        nameAr: drift.Value(nameArController.text),
                        wfpAid: drift.Value(wfpController.text),
                        unhcr: drift.Value(unhcrController.text),
                        peopleCount:
                            drift.Value(int.parse(peopleController.text)),
                        womenCount:
                            drift.Value(int.parse(womenController.text)),
                        childrenCount:
                            drift.Value(int.parse(childrenController.text)),
                        elderlyCount:
                            drift.Value(int.parse(elderlyController.text)),
                        casesCount: drift.Value(int.parse(medController.text)),
                        employedCount:
                            drift.Value(int.parse(empController.text)),
                        educationCount:
                            drift.Value(int.parse(eduController.text)),
                        unemployedCount:
                            drift.Value(int.parse(unempController.text)),
                        phoneNum: drift.Value(phoneController.text),
                        notes1: drift.Value(note1Controller.text),
                        notes2: drift.Value(note2Controller.text),
                      ))
                      .onError((error, stackTrace) => null)
                      .then((value) {
                    tentController.text = '';
                    nameEngController.text = '';
                    nameArController.text = '';
                    phoneController.text = '';
                    wfpController.text = '';
                    unhcrController.text = '';
                    peopleController.text = '';
                    womenController.text = '';
                    childrenController.text = '';
                    elderlyController.text = '';
                    medController.text = '';
                    eduController.text = '';
                    empController.text = '';
                    unempController.text = '';
                    note1Controller.text = '';
                    note2Controller.text = '';
                  });
                },
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
