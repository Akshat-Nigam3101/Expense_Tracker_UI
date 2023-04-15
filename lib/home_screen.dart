import 'package:flutter/material.dart';
//import 'package:video_conference/resources/auth_methods.dart';
//import 'package:video_conference/screens/history_meeting_screen.dart';
//import 'package:video_conference/screens/meeting_screen.dart';
//import 'package:video_conference/utils/colors.dart';
//import 'package:video_conference/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    //const HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      // body: pages[_page],
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

AuthMethods() {}

CustomButton({required String text, required Function() onPressed}) {}

MeetingScreen() {}
