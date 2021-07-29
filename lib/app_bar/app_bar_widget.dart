import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/responsive_layout.dart';

List<String> buttonNames = ["overview", "Revenue", "Sales", "Control"];
int currentSelectedButton = 0;

class AppBarwidget extends StatefulWidget {
  const AppBarwidget({Key? key}) : super(key: key);

  @override
  _AppBarwidgetState createState() => _AppBarwidgetState();
}

class _AppBarwidgetState extends State<AppBarwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purplelight,
      child: Row(
        children: [
          if (!ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                child: Image.asset("images/icon.png"),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30,
              color: Colors.white,
              icon: const Icon(Icons.menu),
            ),
          const SizedBox(
            width: Constants.kPadding,
          ),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    currentSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        buttonNames[index],
                        style: TextStyle(
                          color: currentSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Constants.kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: currentSelectedButton == index
                              ? const LinearGradient(colors: [
                                  Constants.redDark,
                                  Constants.orangeDark
                                ])
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    buttonNames[currentSelectedButton],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Constants.redDark, Constants.orangeDark],
                      ),
                    ),
                  )
                ],
              ),
            ),
          const Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30,
                child: Image.asset("images/cherry.png"),
              ),
            ),
        ],
      ),
    );
  }
}
