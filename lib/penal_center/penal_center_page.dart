import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PenalCenterPage extends StatefulWidget {
  const PenalCenterPage({Key? key}) : super(key: key);

  @override
  _PenalCenterPageState createState() => _PenalCenterPageState();
}

class _PenalCenterPageState extends State<PenalCenterPage> {
  List<Person> person = [
    Person(name: "Ahtasham", color: Constants.orangeLight),
    Person(name: "Inzamam", color: Constants.blueLight),
    Person(name: "Ahmad", color: Constants.orangeDark),
    Person(name: "Ahsan", color: Constants.purpleDark),
    Person(name: "Zia", color: Constants.redDark),
    Person(name: "Yesra", color: Constants.redLight),
    Person(name: "Shakeela", color: Constants.purpleDark),
    Person(name: "Mehwish", color: Constants.redDark),
    Person(name: "Hijab", color: Constants.greenLight),
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
                      "Products Available",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "82% ofproducts Avail.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        "20,500",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //chart middle
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.kPadding,
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purplelight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    person.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        child: Text(
                          person[index].name.substring(0, 1),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: person[index].color,
                      ),
                      title: Text(
                        person[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
