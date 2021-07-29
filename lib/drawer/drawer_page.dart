import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class ButtonInfo {
  String title;
  IconData icon;
  ButtonInfo({required this.icon, required this.title});
}

int currentIndex = 0;
List<ButtonInfo> buttonNames = [
  ButtonInfo(icon: Icons.home, title: "Home"),
  ButtonInfo(icon: Icons.settings, title: "Setting"),
  ButtonInfo(icon: Icons.notifications, title: "Notification"),
  ButtonInfo(icon: Icons.contact_phone_rounded, title: "Contacts"),
  ButtonInfo(icon: Icons.sell, title: "Sales"),
  ButtonInfo(icon: Icons.mark_email_read, title: "Marketing"),
  ButtonInfo(icon: Icons.verified_user, title: "Security"),
  ButtonInfo(icon: Icons.supervised_user_circle_rounded, title: "Users"),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                      ),
              ),
              ...List.generate(
                buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.orangeDark.withOpacity(0.9)
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          buttonNames[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            index == currentIndex;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
