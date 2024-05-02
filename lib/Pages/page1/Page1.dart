import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/common/subPages/ItemsView.dart';


import 'widgets/Widgets.dart';

class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {

  final List<List<String>> Menu = [
    ["https://www.themealdb.com//images//media//meals//sbx7n71587673021.jpg","Chick-Fil-A Sandwich"],
    ["https://www.themealdb.com//images//media//meals//qxytrx1511304021.jpg","Chicken Couscous"],
    ["https://www.themealdb.com//images//media//meals//qrqywr1503066605.jpg","Chicken Fajita Mac and Cheese"],
    ["https://www.themealdb.com//images//media//meals//kvbotn1581012881.jpg","Honey Balsamic Chicken"],
    ["https://www.themealdb.com//images//media//meals//ruwpww1511817242.jpg","Rappie Pie"],
    ["https://www.themealdb.com//images//media//meals//hglsbl1614346998.jpg","Piri-piri chicken and slaw"]
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(22,22,22,1),
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

        iconTheme: const IconThemeData(color: Color.fromRGBO(237,136,48,1),size : 30),

      ),
      backgroundColor:const  Color.fromRGBO(22,22,22,1),
      body: GridView.builder(


          itemCount: Menu.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){

            return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemView(Menu[index][1],Menu[index][0]))
                  );
                },

                child: MenuItem(name:Menu[index][1],url:Menu[index][0]));
          }),

    );
  }
}
