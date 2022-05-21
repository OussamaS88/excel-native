import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/detailed_camp/detailed_camp.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camps"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  String? hasSavedValue = await showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) {
                      var t = TextEditingController();
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        title: const Text("Add location"),
                        content: TextFormField(
                          controller: t,
                          autofocus: true,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Location...",
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
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(null);
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
                    print("has value, $hasSavedValue");
                    BlocProvider.of<CampBloc>(context).add(
                      CreateLocationCampEvent(location: hasSavedValue),
                    );

                    print("added");
                    Future.delayed(const Duration(milliseconds: 500), () {
                      BlocProvider.of<CampBloc>(context)
                          .add(const GetAllLocationsCampEvent());
                    });
                    print("over");
                  }
                },
                label: const Text("Add")),
          ),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  context.read<AppBloc>().add(AppLogoutRequested());
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                )
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const LocationsGridView(),
          ],
        ),
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
                                            CampBloc cB =
                                                BlocProvider.of<CampBloc>(
                                                    context);
                                            String? savedValue =
                                                await showDialog<String>(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (_) {
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
                                                        if (t.text.length < 3) {
                                                          return;
                                                        }
                                                        // BlocProvider.of<
                                                        //             CampBloc>(
                                                        //         context)
                                                        //     .add(CreateRegionFromLocationCampEvent(
                                                        //         newRegion:
                                                        //             t.text,
                                                        //         location:
                                                        //             l[i]));

                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(t.text);
                                                        // BlocProvider.of<
                                                        //             CampBloc>(
                                                        //         context)
                                                        //     .add(
                                                        //         const GetAllLocationsCampEvent());
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
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(null);
                                                        t.dispose();
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
                                            if (savedValue == null ||
                                                savedValue.isEmpty) {
                                              return;
                                            } else {
                                              BlocProvider.of<CampBloc>(context)
                                                  .add(
                                                      CreateRegionFromLocationCampEvent(
                                                          newRegion: savedValue,
                                                          location: l[i]));
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500), () {
                                                BlocProvider.of<CampBloc>(
                                                        context)
                                                    .add(
                                                        const GetAllLocationsCampEvent());
                                              });
                                            }
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
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailedCampView(
                                                              region:
                                                                  k[lIndex])),
                                                );
                                              },
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
