import 'package:flutter/material.dart';
import 'package:web_dashboard/drawer/drawer_page.dart';
import 'package:web_dashboard/penal_left/penal_left_page.dart';
import 'package:web_dashboard/penal_right/penal_right_page.dart';
import 'responsive_layout.dart';
import 'package:web_dashboard/penal_center/penal_center_page.dart';
import 'app_bar/app_bar_widget.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : const AppBarwidget()),
        preferredSize: const Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        computer: Row(
          children: const [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PenalCenterPage()),
            Expanded(child: PenalRightPage())
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PenalCenterPage()),
            Expanded(child: PenalRightPage())
          ],
        ),
        phone: const Expanded(
          child: PenalCenterPage(),
        ),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PenalCenterPage()),
          ],
        ),
        tiny: Container(),
      ),
      drawer: const DrawerPage(),
    );
  }
}
