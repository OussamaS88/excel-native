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
            onPressed: () {
              
            },
            child: const Text("Add")),
        BlocConsumer<DetailedCampBloc, DetailedCampState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.dcStatus) {
              case DCStatus.loading:
                return const CircularProgressIndicator();
              default:
                return Text("Loaded data: , ${state.campsList.length}");
            }
          },
        ),
      ],
    );
  }
}
