import 'package:moex/common/ui/shadow_icon.dart';
import 'package:moex/screens/home/expense/expense_page.dart';
import 'package:moex/screens/home/settings/settings_page.dart';
import 'package:moex/screens/home/stats/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final expensePage = ExpensePage();
  final dashboardPage = StatsPage();
  final settingsPage = SettingsPage();

  Widget _tabs;

  Widget _getBody(index) {
    switch (index) {
      case 0:
        return expensePage;
        break;
      case 1:
        return dashboardPage;
        break;
      case 2:
        return settingsPage;
        break;
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  Widget _createTabs(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ShadowIcon(
              Icons.attach_money,
              offsetX: 0.0,
              offsetY: 0.0,
              blur: 3.0,
              shadowColor: Colors.black.withOpacity(0.25),
            ),
            title: Text(
              'Expenses',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ShadowIcon(
              Icons.dashboard,
              offsetX: 0.0,
              offsetY: 0.0,
              blur: 3.0,
              shadowColor: Colors.black.withOpacity(0.25),
            ),
            title: Text(
              'Dashboard',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ShadowIcon(
              Icons.settings,
              offsetX: 0.0,
              offsetY: 0.0,
              blur: 3.0,
              shadowColor: Colors.black.withOpacity(0.25),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        border: null,
        iconSize: 28.0,
        activeColor: Colors.green[700],
        inactiveColor: const Color(0xFFa3a3a3),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFffffff),
              child: MaterialApp(
                home: Material(
                  type: MaterialType.transparency,
                  child: _getBody(index),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_tabs == null) {
      _tabs = _createTabs(context);
    }
    return _tabs;
  }
}
