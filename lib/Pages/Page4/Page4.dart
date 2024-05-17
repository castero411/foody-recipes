import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {

    var Background = const  Color.fromRGBO(22,22,22,1);

    return Scaffold(
      backgroundColor: Background,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(22,22,22,1),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(top:10,left: 15),
          child: Text("Settings",style: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.bold),),
        ),

        leadingWidth: 200,
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.settings),

          ],
        ),

        iconTheme: const IconThemeData(color: Color.fromRGBO(237,136,48,1),size : 30),

      ),
    );
  }
}
