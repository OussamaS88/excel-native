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
                context.read<CampBloc>().add(const GetAllCampsCampEvent());
              },
              child: const Text("Refresh")),
          ElevatedButton(
              onPressed: () {
                context.read<CampBloc>().add(const CreateCampCampEvent());
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
              },
              child: const Text("print")),
          BlocConsumer<CampBloc, CampState>(
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
                            print(l.length.toString() + "d");
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
                                        l[i].location + ":",
                                        style: TextStyle(
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
          ),
        ],
      ),
    );
  }
}
