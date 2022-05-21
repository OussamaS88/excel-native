import 'package:excel_native/family_add/family_add.dart';
import 'package:excel_native/family_detail/family_detail.dart';
import 'package:excel_native/home/view/charts/pie_chart.dart';
import 'package:excel_native/services/auth/drift_db.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import '../family_data.dart';

class FamilyDataPage extends StatelessWidget {
  const FamilyDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (_) => context.read<FamilyDataBloc>(),
                              child: const FamilyAddView(),
                            )));
              },
              child: const Text("Add")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                context
                    .read<FamilyDataBloc>()
                    .add(const WatchAllFamilyFromCampFamilyDataEvent());
                context
                    .read<FamilyDataBloc>()
                    .add(const ExportToExcelFamilyDataEvent());
              },
              child: const Text("Export To Excel")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
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
                  // context
                  //     .read<HomeBloc>()
                  //     .add(LoadExcelHomeEvent(excelBytes: fileBytes));
                  context
                      .read<FamilyDataBloc>()
                      .add(LoadFromExcelFamilyDataEvent(excelBytes: fileBytes));
                } else {
                  // discarder file picker
                }
              },
              child: const Text("Load from Excel")),
          BlocBuilder<FamilyDataBloc, FamilyDataState>(
            builder: (context, state) {
              switch (state.familyExcelStatus) {
                case FamilyExcelStatus.unloaded:
                  return const Text("unloaded");
                case FamilyExcelStatus.loaded:
                  return Text("Loaded: ${state.excelRows.length} rows");
                default:
                  return const Text("error");
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                print(context.read<FamilyDataBloc>().state.excelRows);
              },
              child: const Text("print loaded data")),
          BlocConsumer<FamilyDataBloc, FamilyDataState>(
            listener: (context, state) {},
            builder: (context, state) {
              Map<String, double> dataMapBasic = {
                "Women": state.womenCount.toDouble(),
                "Children": state.childrenCount.toDouble(),
                "Ederly": state.elderlyCount.toDouble(),
              };
              Map<String, double> dataMapSecondary = {
                "Employed": state.empCount.toDouble(),
                "Unemployed": state.unempCount.toDouble(),
              };
              return GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 12,
                  maxCrossAxisExtent: 600,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                  mainAxisExtent: 480,
                ),
                children: [
                  Card(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Total families: ${state.familyList.length}",
                                style: const TextStyle(fontSize: 36)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("People:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.peopleCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Women:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.womenCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Children:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.childrenCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Elderly:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.elderlyCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Med Cases:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.casesCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("In Education:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.eduCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Employed:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.empCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Unemployed:",
                                      style: TextStyle(fontSize: 24)),
                                  Text("${state.unempCount}",
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: PieChart(
                        dataMap: dataMapBasic,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.bottom,
                            showLegendsInRow: true),
                        chartValuesOptions: const ChartValuesOptions(
                          decimalPlaces: 0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: PieChart(
                        dataMap: dataMapSecondary,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.bottom,
                            showLegendsInRow: true),
                        chartValuesOptions: const ChartValuesOptions(
                          decimalPlaces: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          BlocConsumer<FamilyDataBloc, FamilyDataState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.fdStatus) {
                case FDStatus.loading:
                  return const CircularProgressIndicator();
                default:
                  return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: state.familyList.length,
                      itemBuilder: (context, index) {
                        List<Family> l = state.familyList;
                        return Card(
                          elevation: 4,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BlocProvider(
                                            create: (_) =>
                                                context.read<FamilyDataBloc>(),
                                            child: FamilyDetailView(
                                                family: l[index]),
                                          )));
                            },
                            hoverColor: Colors.green,
                            selectedColor: Colors.green,
                            focusColor: Colors.green,
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID: ${l[index].id.toString()}",
                                ),
                                Text("Tent: ${l[index].tentId}"),
                              ],
                            ),
                            isThreeLine: true,

                            title: SizedBox(
                              height: 40,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: GridView(
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(l[index].nameEng),
                                        Text(l[index].nameAr),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "People count: ${l[index].peopleCount}"),
                                        Text("UNHCR: ${l[index].nameAr}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // SizedBox(
                            //   width: 100,
                            //   child: Row(
                            //     children: [
                            //       Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(l[index].nameEng),
                            //           Text(l[index].nameAr),
                            //         ],
                            //       ),
                            //       const SizedBox(
                            //         width: 200,
                            //       ),
                            //       Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(l[index].nameEng),
                            //           Text(l[index].nameAr),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            trailing: const Icon(Icons.arrow_right, size: 48),
                            // ElevatedButton.icon(
                            //   onPressed: () {},
                            //   icon: const Icon(Icons.arrow_right),
                            //   label: const Text("Details"),
                            // ),
                            subtitle: Text(l[index].phoneNum),
                            horizontalTitleGap: 16,
                            minLeadingWidth: 100,
                            // title: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           l[index].nameEng,
                            //         ),
                            //         Text(
                            //           l[index].nameAr,
                            //         ),
                            //       ],
                            //     ),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text("Phone: ${l[index].phoneNum}"),
                            //         Text("UNHCR: ${l[index].unhcr}"),
                            //         Text("WFP AID: ${l[index].wfpAid}"),
                            //       ],
                            //     ),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text("People: ${l[index].peopleCount}"),
                            //         Text("Women: ${l[index].womenCount}"),
                            //         Text("Children: ${l[index].childrenCount}"),
                            //       ],
                            //     ),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text("Elderly: ${l[index].elderlyCount}"),
                            //         Text(
                            //             "In Education: ${l[index].educationCount}"),
                            //         Text("Med Cases: ${l[index].casesCount}"),
                            //       ],
                            //     ),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           "Employed: ${l[index].employedCount}",
                            //         ),
                            //         Text(
                            //             "Unemployed: ${l[index].unemployedCount}"),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                          ),
                        );
                      },
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var d = MyData.fromRowList(rowList: []);
//     return PaginatedDataTable(
//       actions: [
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.refresh)),
//       ],
//       source: d,
//       header: const Text('Local data:'),
//       columns: const [
//         DataColumn(label: Text('ID')),
//         DataColumn(label: Text('tent')),
//         DataColumn(label: Text('ENG')),
//         DataColumn(label: Text('AR')),
//         DataColumn(label: Text('Phone')),
//         DataColumn(label: Text('WFP')),
//         DataColumn(label: Text('UNHCR')),
//         DataColumn(label: Text('Count')),
//         DataColumn(label: Text('Women')),
//         DataColumn(label: Text('Children')),
//         DataColumn(label: Text('Elderly')),
//         DataColumn(label: Text('Cases')),
//         DataColumn(label: Text('Ed')),
//         DataColumn(label: Text('Emp')),
//         DataColumn(label: Text('Unemp')),
//       ],
//       // columnSpacing: 100,
//       // horizontalMargin: 10,
//       rowsPerPage: 10,
//       showCheckboxColumn: true,
//       showFirstLastButtons: true,
//     );
//   }
// }

// class MyData extends DataTableSource {
//   final List<Map<String, dynamic>> data;
//   factory MyData.fromRowList({required List<Family> rowList}) {
//     List<Map<String, dynamic>> _data = List.generate(
//         rowList.length,
//         (index) => {
//               "id": rowList[index].id,
//               "tent": rowList[index].tentId,
//               "ENG": rowList[index].nameEng,
//               "AR": rowList[index].nameAr,
//               "Phone": rowList[index].phoneNum,
//               "WFP": rowList[index].wfpAid,
//               "UNHCR": rowList[index].unhcr,
//               "Count": rowList[index].peopleCount,
//               "Women": rowList[index].womenCount,
//               "Children": rowList[index].childrenCount,
//               "Elderly": rowList[index].elderlyCount,
//               "Cases": rowList[index].casesCount,
//               "Ed": rowList[index].educationCount,
//               "Emp": rowList[index].employedCount,
//               "Unemp": rowList[index].unemployedCount,
//             });
//     return MyData(data: _data);
//   }
//   MyData({required this.data});
//   @override
//   bool get isRowCountApproximate => false;
//   @override
//   int get rowCount => data.length;
//   @override
//   int get selectedRowCount => 0;
//   @override
//   DataRow getRow(int index) {
//     return DataRow(cells: [
//       DataCell(Text(data[index]['id'].toString())),
//       DataCell(Text(data[index]['tent'].toString())),
//       DataCell(Text(data[index]["ENG"])),
//       DataCell(Text(data[index]["AR"])),
//       DataCell(Text(data[index]["Phone"])),
//       DataCell(Text(data[index]["WFP"])),
//       DataCell(Text(data[index]["UNHCR"])),
//       DataCell(Text(data[index]["Count"].toString())),
//       DataCell(Text(data[index]["Women"].toString())),
//       DataCell(Text(data[index]["Children"].toString())),
//       DataCell(Text(data[index]["Elderly"].toString())),
//       DataCell(Text(data[index]["Cases"].toString())),
//       DataCell(Text(data[index]["Ed"].toString())),
//       DataCell(Text(data[index]["Emp"].toString())),
//       DataCell(Text(data[index]["Unemp"].toString())),
//     ]);
//   }
// }
