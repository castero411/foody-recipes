import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:mobydoby/Pages/common/subPages/Services/remote_service.dart";

class ItemView extends StatelessWidget {


  final String itemCode ;
  final bool random;
  const ItemView({super.key,required this.itemCode,this.random = false});

  final SizedBox _heightSize = const SizedBox(height: 20,);



  @override
  Widget build(BuildContext context) {
    var background = const  Color.fromRGBO(22,22,22,1);
    Color loadingColor = const Color.fromRGBO(130,129,127, 1);
    var colo_1 = const Color.fromRGBO(37,34,29, 1);


    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
            backgroundColor: background,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,color: Color.fromRGBO(237,136,48,1),size : 30),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(

            child: FutureBuilder(

              future: RemoteServices2(ItemNumber: itemCode, random: random ).getCategories(),
              builder: (context,snapShot){
            if(snapShot.hasData){
                return Column(

                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(color: colo_1,width: 200,height: 200,
                          child: Padding(
                            padding: const  EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.network(snapShot.data!.meals['strMealThumb'])
                            ),
                          ),
                        )
                    ),
                    _heightSize,
                    Text(snapShot.data!.meals['strMeal'],style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    _heightSize,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color:colo_1 ,
                        child: Column(
                          children: [
                            Container(
                              width: 1000,
                              padding:  const EdgeInsets.only(top: 10,left: 10),
                              child:  const Text("Ingredient",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                            ),
                            Container(
                              alignment:Alignment.centerLeft,
                              padding: const EdgeInsets.only(top:10,bottom: 20,left: 20),
                              child: Text(  snapShot.data!.meals['strMeasure1'] + snapShot.data!.meals['strIngredient1'] +
                                  "\n" + snapShot.data!.meals['strMeasure2'] + snapShot.data!.meals['strIngredient2'] +
                                  "\n" + snapShot.data!.meals['strMeasure3'] + snapShot.data!.meals['strIngredient3']+
                                  "\n" + snapShot.data!.meals['strMeasure4'] + snapShot.data!.meals['strIngredient4'] +
                                  "\n" + snapShot.data!.meals['strMeasure5'] + snapShot.data!.meals['strIngredient5'] +
                                  "\n" + snapShot.data!.meals['strMeasure6'] + snapShot.data!.meals['strIngredient6'] +
                                  "\n" + snapShot.data!.meals['strMeasure7'] + snapShot.data!.meals['strIngredient7'] +
                                  "\n" + snapShot.data!.meals['strMeasure8'] + snapShot.data!.meals['strIngredient8'] +
                                  "\n" + snapShot.data!.meals['strMeasure9'] + snapShot.data!.meals['strIngredient9'] +
                                  "\n" + snapShot.data!.meals['strMeasure10'] + snapShot.data!.meals['strIngredient10'] +
                                  "\n" + snapShot.data!.meals['strMeasure11'] + snapShot.data!.meals['strIngredient11'] +
                                  "\n" + snapShot.data!.meals['strMeasure12'] + snapShot.data!.meals['strIngredient12'] ,
                                style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20,bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color:colo_1 ,
                          child: Column(
                            children: [
                              Container(
                                width: 1000,
                                padding: const EdgeInsets.only(top: 10,left: 10),
                                child: const  Text("Instructions",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                              ),

                              Container(
                                alignment:Alignment.centerLeft,
                                padding: const EdgeInsets.only(top:10,bottom: 20,left: 20),
                                child:  Text( snapShot.data!.meals['strInstructions']??"no instructions",
                                  style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );}
            else {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white,),

              );
            }
              },
            ),
          ),
        ),
    );
  }
}
