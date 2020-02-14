import 'package:moex/screens/home/expense/expenses_page.dart';
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
  final expensePage = ExpensesPage();
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
            icon: Icon(
              Icons.attach_money,
            ),
            title: Text(
              'Expenses',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            title: Text(
              'Dashboard',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
            ),
          ),
        ],
        backgroundColor: Colors.grey[100],
        border: Border(top: BorderSide(color: Colors.grey[200])),
        iconSize: 28.0,
        activeColor: Colors.lightBlue,
        inactiveColor: Colors.grey,
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
