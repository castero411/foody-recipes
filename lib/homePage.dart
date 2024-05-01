import 'package:flutter/material.dart';

import 'package:mobydoby/Pages/Page2/Page2.dart';
import 'package:mobydoby/Pages/Page3/Page3.dart';
import 'package:mobydoby/Pages/page1/Page1.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int currentState = 0;

  List <Widget> widgets = [
    page_1(),
    Page2(),
    Page3(),
  ];

   Color background =  Color.fromRGBO(22,22,22,1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(




      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: background,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,


        onTap: (index){
          setState(() {
            currentState=index;
          });

        },
        enableFeedback: false,
        currentIndex: currentState,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label : "",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label :"",


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label :"",


          ),

        ],
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(size: 30),

      ),
      body: IndexedStack(index: currentState,children: widgets,),
      backgroundColor: background

    );
  }
}
