import 'package:flutter/material.dart';
import 'package:health_watch_pro/config/date_time.dart';
import 'package:health_watch_pro/config/sizing_config.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    DateFormat timeFormat = DateFormat('hh:mm a');
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SideMenu(),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 227, 235, 0),
              ),
              child: Column(
                children: [
                  Container(
                    height: verticalConverterLarge(60, context),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: horizontalConverterLarge(20, context)),
                        SizedBox(
                          width: horizontalConverterLarge(440, context),
                          child: SearchBar(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(0, 227, 235, 0),
                            ),
                            controller: SearchController(),
                            hintText: 'Search for anything here',
                            leading: const IconButton(
                              icon: Icon(Icons.search),
                              onPressed: null,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(introText()),
                            Text(
                                '${dateFormat.format(now)}      ${timeFormat.format(now)}')
                          ],
                        ),
                        SizedBox(width: horizontalConverterLarge(20, context)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontalConverterLarge(250, context),
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 46, 55, 1),
      ),
      child: Column(
        children: [
          Container(
            height: verticalConverterLarge(60, context),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 29, 36, 1),
            ),
            child: const Center(
              child: Text(
                'Health Watch Pro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: horizontalConverterLarge(30, context)),
          ListTile(
            leading: Image.asset('assets/user.jpg'),
            title: const Text(
              'Dr. Emmanuel Sena Doke',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Burma Camp Pharmacy',
              style: TextStyle(
                fontSize: 10,
                color: Colors.lightBlueAccent,
              ),
            ),
            trailing: const IconButton(
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ),
          SizedBox(height: horizontalConverterLarge(30, context)),
          const ListTile(
            leading: Icon(
              Icons.dashboard_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.inventory_2_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Inventory',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.auto_graph,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Reports',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Configuration',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.people_alt_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Contact Management',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Chats',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.help_center_outlined,
              color: Colors.white,
            ),
            onTap: null,
            title: Text(
              'Get Technical Help',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
