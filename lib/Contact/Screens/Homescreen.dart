import 'package:medical_booking_app/Contact/Pages/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:medical_booking_app/providers/user.provider.dart';
import 'package:medical_booking_app/routes/routes.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if (!userProvider.checkLogin) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesWidget.routeLogin);
          },
          child: Text('Đăng nhập'),
        ),
      );

    } else {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Contact',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,)
            ),
            PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                iconColor: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                        child: Text("New group"),
                        value: "New group"),
                    PopupMenuItem(
                        child: Text("New broadcast"),
                        value: "New broadcast"),
                    PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web"),
                    PopupMenuItem(
                        child: Text("Startted messages"),
                        value: "Startted messages"),
                    PopupMenuItem(
                        child: Text("Settings"),
                        value: "Settings"),
                  ];
                }),
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ChatPage(),
            Text("Calls"),
          ],
        ),
      );
    }
  }
}

