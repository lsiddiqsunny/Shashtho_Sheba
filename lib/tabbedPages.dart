import 'package:flutter/material.dart';

import './homeTab.dart';
import './appointmentsTab.dart';
import './searchDoctorTab.dart';

class TabbedPages extends StatefulWidget {
  static const routeName = '/tabbedpages';

  @override
  _TabbedPagesState createState() => _TabbedPagesState();
}

class _TabbedPagesState extends State<TabbedPages>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Home',
      icon: Icon(Icons.home),
    ),
    Tab(text: 'Appointments', icon: Icon(Icons.view_list)),
    Tab(text: 'Search Doctor', icon: Icon(Icons.search)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: myTabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    minRadius: 45,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Guest',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          AppointmentsTab(),
          SearchDoctorTab(),
        ],
      ),
    );
  }
}
