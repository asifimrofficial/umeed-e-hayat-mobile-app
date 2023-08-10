import 'package:blood_donation_app/src/features/donor/screens/searchDonor.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import '../src/features/donation/screens/DonationRequestScreen.dart';
import '../src/features/user/screens/profileScreen.dart';
import '../src/features/home/HomeScreen.dart';
import '../src/features/donation/screens/createRequestScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  int _selectedindex = 0;
  
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchDonorScreen(),
    const CreateReuqest(),
    UserProfile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: _widgetOptions.elementAt(_selectedindex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              activeColor: Colors.red,
              duration: Duration(milliseconds: 400),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              gap: 20,
              tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Colors.red,
                textColor: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.2),
              ),
               GButton(
                icon: Icons.search,
                text: 'Search',
                iconColor: Colors.red,
                textColor: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.2),
              ),
              GButton(
                icon: Icons.add_circle_outline,
                text: 'Request',
                iconColor: Colors.red,
                textColor: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.2),
              ),
             
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: Colors.red,
                textColor: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.2),
              ),
            
            ],
            onTabChange: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
            ),
          ),
        ),
      )
    );
  }
}