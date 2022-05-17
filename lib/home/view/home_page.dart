import 'package:drift/drift.dart' as drift;
import 'package:excel_api/excel_api.dart';
import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:excel_native/home/view/charts/bar_chart.dart';
import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ExcelApi excel = context.read<ExcelApi>();
    MyDatabase localDb = context.read<MyDatabase>();
    // final DataTableSource _data = MyData();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: SimpleBarChart.withSampleData(),
          ),
          Center(
            child: Text("Welcome ${context.read<AppBloc>().state.user.email}"),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(withData: true);
                    if (result != null) {
                      // final fileName = result.files.first.name;
                      final fileBytes = result.files.first.bytes;
                      // print(fileName);
                      // context.read<ExcelApi>().bytes = fileBytes;
                      // var l = context.read<ExcelApi>().readRowsToExcelRows();
                      // print(l);
                      context
                          .read<HomeBloc>()
                          .add(LoadExcelHomeEvent(excelBytes: fileBytes));
                    } else {
                      // discarder file picker
                    }
                  },
                  child: const Text("Load from Excel"),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    context.read<HomeBloc>().add(const UnloadExcelHomeEvent());
                  },
                  child: const Text("Unload excel"),
                ),
              ],
            ),
          )),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(const InsertFromExcelToLocalHomeEvent());
                },
                child: const Text("Save data to local DB")),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<HomeBloc>().add(const LoadFromDBHomeEvent());
                },
                child: const Text("Load data from local DB")),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                context.read<HomeBloc>().add(const SaveToExcelHomeEvent());
              },
              child: const Text("Save to excel"),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              onPressed: () {
                context.read<HomeBloc>().add(const WatchFromDBHomeEvent());
              },
              child: const Text("Watch From DB"),
            ),
          ),
          Center(
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              switch (state.homeExcelStatus) {
                case HomeExcelStatus.empty:
                  return const Text("No excel file loaded");
                case HomeExcelStatus.loaded:
                  return Text(
                      "Loaded excel file successfully, there are ${state.excelRows!.length.toString()} rows");
                default:
                  return const Text("Could not load excel file.");
              }
            }),
          ),
          Center(
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              switch (state.homeLocalStatus) {
                case HomeLocalStatus.idle:
                  return const Text("No database changes detected");
                case HomeLocalStatus.inserting:
                  return const Text("Inserting data...");
                default:
                  return const Text(
                      "Could not save excel data to local database.");
              }
            }),
          ),
          BlocBuilder<HomeBloc, HomeState>(
              // buildWhen: (previous, current) =>
              //     previous.excelRowsFromDB!.length !=
              //     current.excelRowsFromDB!.length,
              builder: (context, state) {
            switch (state.excelRowsFromDB!.length) {
              case 0:
                return const Text("No data in database");
              default:
                print("found data");
                var d = MyData.fromRowList(rowList: state.excelRowsFromDB!);
                print(state.excelRowsFromDB!);
                print(d.rowCount);
                // MyData.rowList = state.excelRowsFromDB!;
                return Row(
                  children: [
                    Card(
                      elevation: 16,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 532,
                            width: 600,
                            // child: DonutAutoLabelChart.withSampleData(),
                            child: DonutAutoLabelChartAgeStats(
                              state.seriesList!,
                              animate: false,
                            ),
                          ),
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.refresh),
                              label: const Text("Refresh values"))
                        ],
                      ),
                    ),
                    Expanded(
                      child: PaginatedDataTable(
                        actions: [
                          ElevatedButton(
                              onPressed: () {}, child: const Icon(Icons.add)),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.refresh)),
                        ],
                        source: d,
                        header: const Text('Local data:'),
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('FName')),
                          DataColumn(label: Text('lName')),
                          DataColumn(label: Text('Location')),
                          DataColumn(label: Text('Phone')),
                          DataColumn(label: Text('Age')),
                        ],
                        // columnSpacing: 100,
                        // horizontalMargin: 10,
                        rowsPerPage: 8,
                        showCheckboxColumn: true,
                        showFirstLastButtons: true,
                      ),
                    ),
                  ],
                );
            }
          }),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  // final List<ExcelRow> rowList;
  // void setData(List<ExcelRow> l) {
  //   rowList = l;
  // }

  // List<ExcelRow> get dataRowdsList => rowList;
  final List<Map<String, dynamic>> data;
  // final List<Map<String, dynamic>> _data = List.generate(
  //     rowList.length,
  //     (index) => {
  //           "id": rowList[index].mp[0],
  //           "fname": rowList[index].mp[1],
  //           "lname": rowList[index].mp[2],
  //           "location": rowList[index].mp[3],
  //           "phone": rowList[index].mp[4],
  //           "age": rowList[index].mp[5],
  //         });
  factory MyData.fromRowList({required List<ExcelRow> rowList}) {
    List<Map<String, dynamic>> _data = List.generate(
        rowList.length,
        (index) => {
              "id": rowList[index].mp[0],
              "fname": rowList[index].mp[1],
              "lname": rowList[index].mp[2],
              "location": rowList[index].mp[3],
              "phone": rowList[index].mp[4],
              "age": rowList[index].mp[5],
            });
    return MyData(data: _data);
  }
  MyData({required this.data});
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]['id'].toString())),
      DataCell(Text(data[index]["fname"])),
      DataCell(Text(data[index]["lname"])),
      DataCell(Text(data[index]["location"])),
      DataCell(Text(data[index]["phone"])),
      DataCell(Text(data[index]["age"].toString())),
    ]);
  }
}
