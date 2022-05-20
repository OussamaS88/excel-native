import 'package:excel_native/services/auth/drift_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../camp.dart';

class CampPage extends StatefulWidget {
  const CampPage({Key? key}) : super(key: key);

  @override
  State<CampPage> createState() => _CampPageState();
}

class _CampPageState extends State<CampPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<CampBloc>().add(const GetAllLocationsCampEvent());
              },
              child: const Text("Refresh")),
          ElevatedButton(
              onPressed: () {
                // context.read<CampBloc>().add(const CreateCampCampEvent());
                context.read<CampBloc>().add(const CreateLocationCampEvent());
              },
              child: const Text("Add")),
          ElevatedButton(
              onPressed: () {
                context.read<CampBloc>().add(const DebugCampEvent());
              },
              child: const Text("Debug")),
          ElevatedButton(
              onPressed: () {
                print(context.read<CampBloc>().state);
                print(context.read<CampBloc>().state.campsList);
                print(context.read<CampBloc>().state.locationsList);
                print(context.read<CampBloc>().state.regionsWithLocations);
              },
              child: const Text("print")),
          ElevatedButton(
              onPressed: () {
                context
                    .read<CampBloc>()
                    .add(const GetAllCampsWithLocationsCampEvent());
              },
              child: const Text("try")),
          const LocationsGridView(),
        ],
      ),
    );
  }
}

class LocationsGridView extends StatelessWidget {
  const LocationsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CampBloc, CampState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.campStatus) {
          case CampStatus.loading:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          default:
            if (state.locationsList!.isEmpty) {
              return const Text("No locations found");
            }
            return Row(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 64),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300),
                    itemCount: state.locationsList!.length,
                    itemBuilder: (context, i) {
                      var l = state.locationsList!;
                      // print("${l.length}d");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ListTile(
                                  title: Text(
                                    "${l[i].location}:",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  trailing: Wrap(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) {
                                                var t = TextEditingController();
                                                return AlertDialog(
                                                  actionsAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  title: Text(
                                                      "Add region for ${l[i].location}"),
                                                  content: TextFormField(
                                                    controller: t,
                                                    autofocus: true,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      hintText: "Region...",
                                                      suffixIcon: IconButton(
                                                        onPressed: () {
                                                          t.text = '';
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton.icon(
                                                      onPressed: () {
                                                        context
                                                            .read<CampBloc>()
                                                            .add(
                                                                CreateRegionFromLocationCampEvent(
                                                                    location:
                                                                        l[i]));
                                                      },
                                                      icon:
                                                          const Icon(Icons.add),
                                                      label: const Text("Add"),
                                                    ),
                                                    ElevatedButton.icon(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  Colors.red),
                                                      onPressed: () {
                                                        t.dispose();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      label:
                                                          const Text("Discard"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.add)),
                                      IconButton(
                                          onPressed: () {
                                            context.read<CampBloc>().add(
                                                const GetAllLocationsCampEvent());
                                          },
                                          icon: const Icon(Icons.refresh)),
                                    ],
                                  ),
                                ),
                              ),
                              BlocBuilder<CampBloc, CampState>(
                                builder: (context, state) {
                                  // if (state.campsWithLocations == {}) {
                                  //   return const Text("no data");
                                  // }
                                  // List<Camp> k =
                                  //     state.campsWithLocations![l[i]] ?? [];
                                  // if (state.campsWithLocations![l[i]] == []) {
                                  //   return const Text("no data");
                                  // }
                                  if (state.regionsWithLocations == {}) {
                                    return const Text("no data");
                                  }
                                  List<Region> k =
                                      state.regionsWithLocations![l[i]] ?? [];
                                  if (state.regionsWithLocations![l[i]] == []) {
                                    return const Text("no data");
                                  }
                                  // return Text(k.length.toString());
                                  return Expanded(
                                    child: ListView.builder(
                                        itemCount: k.length,
                                        itemBuilder: (context, lIndex) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text(k[lIndex].region),
                                            ),
                                          );
                                        }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}

class CampsGridView extends StatelessWidget {
  const CampsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CampBloc, CampState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.campStatus) {
          case CampStatus.loading:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          default:
            if (state.campsList!.isEmpty) {
              return const Text("No data found");
            }
            return Row(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 64),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300),
                    itemCount: state.campsList!.length,
                    itemBuilder: (context, i) {
                      var l = state.campsList!;
                      // print(l.length.toString() + "d");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "${l[i].location}:",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Text(l[i].campId.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
