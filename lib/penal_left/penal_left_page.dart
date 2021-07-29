import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/curved_chart.dart';
import 'package:web_dashboard/penal_left/circle_graph.dart';
import 'package:web_dashboard/responsive_layout.dart';

class Todo {
  String name;
  bool enable;
  Todo({required this.enable, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  List<Todo> toDo = [
    Todo(enable: true, name: "Ahtasham"),
    Todo(enable: true, name: "Inzamam"),
    Todo(enable: true, name: "Ushna"),
    Todo(enable: true, name: "Ali"),
    Todo(enable: true, name: "Mehwish"),
    Todo(enable: true, name: "Zaeem "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purplelight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      50,
                    ),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: Constants.purplelight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: double.infinity,
                      child: const ListTile(
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18% of products solved",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const LineChartSample2(),
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                    bottom: Constants.kPadding,
                  ),
                  child: Card(
                    color: Constants.purplelight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ...List.generate(
                          toDo.length,
                          (index) => CheckboxListTile(
                              title: Text(
                                toDo[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              value: toDo[index].enable,
                              onChanged: (newValue) {
                                setState(() {
                                  toDo[index].enable = newValue ?? true;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
