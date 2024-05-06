import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/Page2/services/remote_service.dart';
import "package:mobydoby/Pages/common/Models/Categories.dart";

import '../page1/widgets/Widgets.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  Color Background = const  Color.fromRGBO(22,22,22,1);
  Color loadingColor = const Color.fromRGBO(130,129,127, 1);

  List<Categories>? categories;
  var isLoaded = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      appBar: AppBar(
        backgroundColor: Background,
        title:const Text("Search",style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: (){
                //todo : create a search engine
              },
              icon: const Icon(Icons.search,color: Color.fromRGBO(237,136,48,1) ,size : 30,)),

        ],

      ),

      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text("Categories",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

            SizedBox(height: 20,),

            FutureBuilder(
                future: RemoteServieces().getCategories(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Expanded(
                      child: GridView.builder(

                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return  InkWell(
                              onTap : (){

                              },
                              child: MenuItem(name:snapshot.data![index].strCategory,url:snapshot.data![index].strCategoryThumb,)
                            );
                          }
                      ),
                    );
                  }
                  else {
                    return Center(
                      heightFactor: 15,
                      child: TextButton(
                        child: Text("Refresh"), onPressed: () {
                        setState(() {

                        });
                      },

                      ),
                    );
                  }

                },
            ),
          ],
        ),
      ),
    );
  }
}

