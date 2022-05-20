import 'package:excel_native/family_data/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../detailed_camp.dart';

class DetailedCampPage extends StatelessWidget {
  const DetailedCampPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              context
                  .read<DetailedCampBloc>()
                  .add(const GetAllCampsFromRegionDetailedCampEvent());
            },
            child: const Text("Refresh")),
        ElevatedButton(
            onPressed: () async {
              String? hasSavedValue = await showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  var t = TextEditingController();
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    title: const Text("Add camp:"),
                    content: TextFormField(
                      controller: t,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Camp name...",
                        suffixIcon: IconButton(
                          onPressed: () {
                            t.text = '';
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (t.text.length < 3) {
                            return;
                          }
                          Navigator.of(context, rootNavigator: true)
                              .pop(t.text);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop(null);
                          t.dispose();
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("Discard"),
                      ),
                    ],
                  );
                },
              );
              if (hasSavedValue == null || hasSavedValue.isEmpty) {
                return;
              } else {
                BlocProvider.of<DetailedCampBloc>(context).add(
                    InsertCampsFromRegionDetailedCampEvent(
                        campName: hasSavedValue));
              }
            },
            child: const Text("Add")),
        BlocConsumer<DetailedCampBloc, DetailedCampState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.dcStatus) {
              case DCStatus.loading:
                return const CircularProgressIndicator();
              default:
                // return Text("Loaded data: , ${state.campsList.length}");
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.campsList.length,
                  itemBuilder: (context, index) {
                    var k = state.campsList;
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        hoverColor: Colors.blue,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FamilyDataView(camp: k[index])));
                        },
                        trailing: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text("Delete"),
                        ),
                        leading: Text("ID: ${k[index].id.toString()}",
                            textAlign: TextAlign.center),
                        title: Text(k[index].name),
                        subtitle:
                            Text("${k[index].region}, ${k[index].location}"),
                      ),
                    );
                  },
                ));
            }
          },
        ),
      ],
    );
  }
}
