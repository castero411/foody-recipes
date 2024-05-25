import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/mainMenu/mianMenu.dart';
import 'package:mobydoby/homePage.dart';

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/food.jpg'),
                  fit: BoxFit.cover,
                )
              )
            ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(.92),
                  Colors.black.withOpacity(.29),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),//decoration for the image
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: Column(
                children: [
                  const Text("Recipes App",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                  const Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Text("browse recipes ",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 40,),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(141,191,153, 1)),
                    ),
                    child: const Text("browse",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w500),),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const homePage()),
                      );
                    } ,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
