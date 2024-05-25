import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:mobydoby/Pages/Page2/Page2.dart';
import 'package:mobydoby/Pages/Page3/Page3.dart';
import 'package:mobydoby/Pages/mainMenu/mianMenu.dart';
import 'common/colors.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int currentState = 0;

  List <Widget> widgets = [
    const mainMenu(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(




      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          marginR: const EdgeInsets.symmetric(horizontal: 50, vertical:0),

          paddingR : const EdgeInsets.only(bottom: 5, top: 5),


          borderRadius : 30,

          currentIndex: currentState,
          backgroundColor: const Color.fromRGBO(141,191,153, 1),
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
           enableFloatingNavBar: true,
          selectedItemColor: icon_color ,

          onTap: (index){
              setState(() {
                currentState=index;
                      });
              },

        items: [

          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),

          DotNavigationBarItem(
            icon: const Icon(Icons.search),


          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.shuffle),

          ),

        ],
        ),
      ),
      body: IndexedStack(index: currentState,children: widgets,),
      backgroundColor: background

    );
  }
}
