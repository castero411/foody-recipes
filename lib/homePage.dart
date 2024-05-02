import 'package:dot_navigation_bar/dot_navigation_bar.dart';
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




      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          marginR: const EdgeInsets.symmetric(horizontal: 50, vertical:0),

          paddingR : const EdgeInsets.only(bottom: 5, top: 5),


          borderRadius : 30,

          currentIndex: currentState,
          backgroundColor: const Color.fromRGBO(141,191,153, 1),
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
           enableFloatingNavBar: true,
          selectedItemColor: Color.fromRGBO(233,141,54, 1),

          onTap: (index){
      setState(() {
      currentState=index;
      });

      },
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.search),


          ),
          DotNavigationBarItem(
            icon: Icon(Icons.settings),

          ),

        ],
        ),
      ),
      body: IndexedStack(index: currentState,children: widgets,),
      backgroundColor: background

    );
  }
}
