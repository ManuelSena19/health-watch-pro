import 'package:flutter/material.dart';
import 'package:health_watch_pro/config/date_time.dart';
import 'package:health_watch_pro/config/sizing_config.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<DateTime> _now;
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    _now = Stream<DateTime>.periodic(const Duration(seconds: 1), (i) {
      return DateTime.now();
    });
    dateFormat = DateFormat('dd MMMM yyyy');
    timeFormat = DateFormat('hh:mm a');
  }

  @override
  Widget build(BuildContext context) {
    Color green = const Color.fromRGBO(1, 167, 104, 1);
    Color greenAccent = const Color.fromRGBO(1, 167, 104, 70);
    Color yellow = const Color.fromRGBO(254, 214, 0, 1);
    Color yellowAccent = const Color.fromRGBO(254, 214, 0, 70);
    Color blue = const Color.fromRGBO(3, 169, 245, 1);
    Color blueAccent = const Color.fromRGBO(3, 169, 245, 70);
    Color red = const Color.fromRGBO(240, 72, 62, 1);
    Color redAccent = const Color.fromRGBO(240, 72, 62, 70);
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                        StreamBuilder(
                          stream: _now,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              DateTime? now = snapshot.data;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        getTimeOfDayAsset(),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        introText(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${dateFormat.format(now!)}   ${timeFormat.format(now)}',
                                    style: const TextStyle(fontSize: 12),
                                  )
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        SizedBox(width: horizontalConverterLarge(20, context)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'A quick data overview of the inventory',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: null,
                            child: Container(
                              width: horizontalConverterLarge(192, context),
                              height: verticalConverterLarge(46, context),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Download Report',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: verticalConverterLarge(26, context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              color: green,
                              accentColor: greenAccent,
                              iconData: Icons.health_and_safety_outlined,
                              title: 'Good',
                              subtitle: 'Inventory Status',
                              buttonText: 'View Detailed Report',
                            ),
                            DashboardCard(
                              color: yellow,
                              accentColor: yellowAccent,
                              iconData: Icons.currency_exchange_outlined,
                              title: 'GH¢ 12,300',
                              subtitle: 'Revenue',
                              buttonText: 'View Detailed Report',
                            ),
                            DashboardCard(
                              color: blue,
                              accentColor: blueAccent,
                              iconData: Icons.medical_information_outlined,
                              title: '298',
                              subtitle: 'Medicines Available',
                              buttonText: 'View Inventory',
                            ),
                            DashboardCard(
                              color: red,
                              accentColor: redAccent,
                              iconData: Icons.warning_amber_outlined,
                              title: '01',
                              subtitle: 'Medicine Shortage',
                              buttonText: 'Resolve Now',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {super.key,
      required this.color,
      required this.iconData,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.accentColor});

  final Color color;
  final Color accentColor;
  final IconData iconData;
  final String title;
  final String subtitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontalConverterLarge(212, context),
      height: verticalConverterLarge(152, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: verticalConverterLarge(20, context)),
          Icon(
            iconData,
            size: 40,
            color: color,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Container(
            height: verticalConverterLarge(27, context),
            width: horizontalConverterLarge(212, context),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
