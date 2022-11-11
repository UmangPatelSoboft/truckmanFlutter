import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Scaffoldkey = GlobalKey<ScaffoldState>();

  List<String> DrawerName = [
    "Home",
    "Search",
    "Create Trips",
    "Add",
    "Trips",
    "Notifications",
    "Setting",
    "Logout"
  ];
  List<IconData> DrawerIcon = [
    Icons.home,
    Icons.search,
    Icons.trip_origin,
    Icons.add,
    Icons.fire_truck,
    Icons.notifications,
    Icons.settings,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(),
      drawer: Drawer(
        elevation: 5,
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          AssetImage('assets/images/AppIcon.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Jeniffer Winget",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Align(alignment: Alignment(10, 10)),
                              Text(
                                "+91 123412349",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "jenny@gmail.com",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          // background (button) color
                        ), // foreground (text) color
                        onPressed: () => print('pressed'),
                        child: Text('Edit Profile '),
                      )
                    ],
                  ),
                ],
              ),
              ListView.builder(
                itemCount: DrawerName.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return commondrawername(
                      icon: DrawerIcon[index], text: DrawerName[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget commondrawername({String? text, required IconData icon}) {
    return Container(
      child: ExpansionTile(
          trailing: SizedBox.shrink(),
          title: Text(text ?? ''),
          leading: Icon(icon),
          childrenPadding: EdgeInsets.only(left: 100)),
    );
  }
}
