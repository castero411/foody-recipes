import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/common/subPages/ItemsView.dart';
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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: GridView.builder(


            itemCount: Menu.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index){

              return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemView(itemCode: Menu[index][2],random: true,))// true for not random XD
                    );
                  },

                  child: MenuItem(name:Menu[index][1],url:Menu[index][0]));
            }),
      ),

    );
  }

  Future<void> _refresh()async{
    setState(() {

    });
    return Future.delayed(const Duration(seconds: 1));
  }
}
