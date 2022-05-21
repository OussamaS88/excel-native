import 'package:flutter_bloc/flutter_bloc.dart';

import '../family_detail.dart';
import 'package:flutter/material.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:drift/drift.dart' as drift;

class FamilyDetailPage extends StatefulWidget {
  final Family family;
  const FamilyDetailPage({Key? key, required this.family}) : super(key: key);

  @override
  State<FamilyDetailPage> createState() => _FamilyDetailPageState();
}

class _FamilyDetailPageState extends State<FamilyDetailPage> {
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
    Family family = widget.family;
    tentController.text = family.tentId.toString();
    nameEngController.text = family.nameEng.toString();
    nameArController.text = family.nameAr.toString();
    phoneController.text = family.phoneNum.toString();
    wfpController.text = family.wfpAid.toString();
    unhcrController.text = family.unhcr.toString();
    peopleController.text = family.peopleCount.toString();
    womenController.text = family.womenCount.toString();
    childrenController.text = family.childrenCount.toString();
    elderlyController.text = family.elderlyCount.toString();
    medController.text = family.casesCount.toString();
    eduController.text = family.educationCount.toString();
    empController.text = family.employedCount.toString();
    unempController.text = family.unemployedCount.toString();
    note1Controller.text = family.notes1.toString();
    note2Controller.text = family.notes2.toString();
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              spacing: 4,
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
          ],
        ),
      ),
    );
  }
}
