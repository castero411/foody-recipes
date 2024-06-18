import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/common/subPages/ItemsView.dart';
import 'package:mobydoby/Pages/mainMenu/widgets/CarouselItem.dart';
import 'package:mobydoby/common/colors.dart';

import 'widgets/Widgets.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({super.key});

  @override
  State<mainMenu> createState() => _page_1State();
}

class _page_1State extends State<mainMenu> {

  final List<List<String>> Menu = [
    ["https://www.themealdb.com//images//media//meals//sbx7n71587673021.jpg","Chick-Fil-A Sandwich","53016"],
    ["https://www.themealdb.com//images//media//meals//qxytrx1511304021.jpg","Chicken Couscous","52850"],
    ["https://www.themealdb.com//images//media//meals//qrqywr1503066605.jpg","Chicken Fajita Mac and Cheese","52818"],
    ["https://www.themealdb.com//images//media//meals//kvbotn1581012881.jpg","Honey Balsamic Chicken","52993"],
    ["https://www.themealdb.com//images//media//meals//ruwpww1511817242.jpg","Rappie Pie","52933"],
    ["https://www.themealdb.com//images//media//meals//hglsbl1614346998.jpg","Piri-piri chicken and slaw","53039"]
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(top:10,left: 15),
          child: Text("Welcome",style: TextStyle(color: Colors.white ,fontSize: 25 ,fontWeight: FontWeight.bold),),
        ),

        leadingWidth: 200,
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.account_balance_wallet),

          ],
        ),

        iconTheme: IconThemeData(color: icon_color,size : 30),

      ),
      backgroundColor: background,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 50),
            child:  SizedBox(
              width: 380,
              child:
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pick Your Meal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),textAlign:TextAlign.left,),
                  Text("Discover Meals across the world",style: TextStyle(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 20),textAlign:TextAlign.left,),
                ],
              ),
            ),
          ),


          RefreshIndicator(
          onRefresh: _refresh,
          child: CarouselSlider.builder(
              itemCount: Menu.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Item(Image: Menu[itemIndex][0] ,
                    ItemName: Menu[itemIndex][1],
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ItemView(itemCode: Menu[itemIndex][2],random: true,))// true for not random XD
                        );
                      },),

              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: 2,
              )
          ),
        ),
      ]),

    );
  }

  Future<void> _refresh()async{
    setState(() {

    });
    return Future.delayed(const Duration(seconds: 1));
  }
}
