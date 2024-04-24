import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/page1/widgets/Widgets.dart';




class Page1 extends StatelessWidget {
  Page1({super.key});

  final List<List<String>> Menu = [
    ["https://www.themealdb.com//images//media//meals//sbx7n71587673021.jpg","Chick-Fil-A Sandwich"],
    ["https://www.themealdb.com//images//media//meals//qxytrx1511304021.jpg","Chicken Couscous"],
    ["https://www.themealdb.com//images//media//meals//qrqywr1503066605.jpg","Chicken Fajita Mac and Cheese"],
    ["https://www.themealdb.com//images//media//meals//kvbotn1581012881.jpg","Honey Balsamic Chicken"],
    ["https://www.themealdb.com//images//media//meals//ruwpww1511817242.jpg","Rappie Pie"],
    ["https://www.themealdb.com//images//media//meals//hglsbl1614346998.jpg","Piri-piri chicken and slaw"]
  ];

  get gridDelegate => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22,22,22,1),
        leading: Icon(Icons.ac_unit),
        title: Text("Welcome",style: TextStyle(color: Color.fromRGBO(150,147,140,1) , ),),
        iconTheme: IconThemeData(color: Color.fromRGBO(237,136,48,1),size : 40),

      ),
      backgroundColor: Color.fromRGBO(22,22,22,1),
      body: GridView.builder(

          itemCount: Menu.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){

            return MenuItem(Menu,index);

          }),

    );
  }
}
