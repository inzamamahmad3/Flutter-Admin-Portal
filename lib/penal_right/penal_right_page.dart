import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/penal_right/penal_graph.dart';

class Product {
  String name;
  bool enable;
  Product({required this.enable, required this.name});
}

class PenalRightPage extends StatefulWidget {
  const PenalRightPage({Key? key}) : super(key: key);

  @override
  _PenalRightPageState createState() => _PenalRightPageState();
}

class _PenalRightPageState extends State<PenalRightPage> {
  List<Product> products = [
    Product(enable: true, name: "Led Submercibel lights"),
    Product(enable: true, name: "MacBoook"),
    Product(enable: true, name: "Led Screens"),
    Product(enable: true, name: "Bluetooth Speaker"),
    Product(enable: true, name: "Led Lights"),
    Product(enable: true, name: "Iphone"),
    Product(enable: true, name: "Charger"),
    Product(enable: true, name: "names"),
    Product(enable: true, name: "Lamp"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            const LineChartSample1(),
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
                  children: List.generate(
                    products.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        products[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      value: products[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          products[index].enable = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
