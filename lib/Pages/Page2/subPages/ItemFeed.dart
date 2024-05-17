
import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/Page2/subPages/Widget/items.dart';

class Itemfeed extends StatefulWidget {
  final String category;
  final String image;

  const Itemfeed({super.key,required this.category, required this.image,});

  @override
  State<Itemfeed> createState() => _ItemfeedState();
}

class _ItemfeedState extends State<Itemfeed> {

  final List<List<String>> items = [
    ["Baked salmon with fennel & tomatoes",
      "https://www.themealdb.com/images/media/meals/1548772327.jpg",
      "52959"],
    [
      "Cajun spiced fish tacos",
      "https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg",
      "52819"],
    ["Fish Soup (Ukha)",
      "https://www.themealdb.com/images/media/meals/7n8su21699013057.jpg",
      "53079"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23,23,23,1),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            String thisTitle = widget.category;
            return [
              SliverAppBar(
                expandedHeight: 150.0, // Height of the app bar when expanded
                pinned: true, // Pins the app bar to the top
                floating: true, // Makes the app bar float over content
                forceElevated: innerBoxIsScrolled, // Controls shadow based on scroll
                backgroundColor: const Color.fromRGBO(22,22,22,1),
                iconTheme: const IconThemeData(color: Color.fromRGBO(237,136,48,1) ,size : 30,),// App bar color
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(thisTitle,style: const  TextStyle(color: Colors.white , fontWeight: FontWeight.bold),), // Title displayed on app bar
                  collapseMode: CollapseMode.none, // Pins the title when collapsed
      
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
            itemCount: items.length,
                itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){

                        },
                        child: Items(image: items[index][1] ,name: items[index][0] ,code: items[index][2] ,)
                    );
                }
            ),
          )
      
      ),
    );
}
}
