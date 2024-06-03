import 'package:athang_expense_tracker/screens/account/account_screen.dart';
import 'package:athang_expense_tracker/screens/addAcount.dart';
import 'package:athang_expense_tracker/screens/addTrasnsction.dart';

import 'package:athang_expense_tracker/screens/summaryHome.dart';
import 'package:flutter/material.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  List<String> titles = ['Home', 'Account','Add Transction'];
  List<Widget> screens = [
    SummaryHome(), 
    AccountScreen(),
    AddTransaction(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/logo.png',
                            height:50, fit: BoxFit.contain),
           Text(titles[_selectedIndex], style: TextStyle(color: Colors.white,fontSize: 16),),
           Icon(Icons.search)
          ],
        )
        
      ),
      body: SingleChildScrollView(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrangeAccent,
        currentIndex: _selectedIndex,
        onTap: (val){
          setState(() {
            _selectedIndex = val;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Accounts'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add'),
          //BottomNavigationBarItem(icon: Icon(Icons.image),label: 'Acc'),
        ],
      ),
    );
  }
}