import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:mobydoby/Pages/common/subPages/Services/remote_service.dart";

class ItemView extends StatelessWidget {


  final String itemCode ;
  final String itemName;
  final String itemImage;
  const ItemView({super.key, required this.itemName, required this.itemImage,required this.itemCode});

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
              icon:  Icon(Icons.arrow_back_ios_new,color: Color.fromRGBO(237,136,48,1),size : 30),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

        ),
        body: Padding(
          padding:  EdgeInsets.all(10),
          child: SingleChildScrollView(

            child: FutureBuilder(

              future: RemoteServices2(ItemNumber: itemCode).getCategories(),
              builder: (context,snapShot){
            if(snapShot.hasData){
                return Column(

                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(color: colo_1,width: 200,height: 200,
                          child: Padding(
                            padding:  EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: CachedNetworkImage(
                                width: 20,
                                height: 20,
                                imageUrl: itemImage,),
                            ),
                          ),
                        )
                    ),
                    _heightSize,
                    Text(itemName,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    _heightSize,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color:colo_1 ,
                        child: Column(
                          children: [
                            Container(
                              width: 1000,
                              padding:  EdgeInsets.only(top: 10,left: 10),
                              child:   Text("Ingredient",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                            ),
                            Container(
                              alignment:Alignment.centerLeft,
                              padding:  EdgeInsets.only(top:10,bottom: 20,left: 20),
                              child: Text("- Scale + ingredient_1 "
                                  "\n- Scale + "  +
                                  "\n- Scale + ingredient_3"
                                  "\n- Scale + ingredient_4"
                                  "\n- Scale + ingredient_5"
                                  "\n- Scale + ingredient_6"
                                  "\n- Scale + ingredient_8",
                                style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:20,bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color:colo_1 ,
                          child: Column(
                            children: [
                              Container(
                                width: 1000,
                                padding:  EdgeInsets.only(top: 10,left: 10),
                                child: const  Text("Instructions",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                              ),
                              Container(
                                alignment:Alignment.centerLeft,
                                padding: const EdgeInsets.only(top:10,bottom: 20,left: 20),
                                child:const  Text("- Scale + ingredient_1 "
                                    "\n- Scale + ingredient_2"
                                    "\n- Scale + ingredient_3"
                                    "\n- Scale + ingredient_4"
                                    "\n- Scale + ingredient_5"
                                    "\n- Scale + ingredient_6"
                                    "\n- Scale + ingredient_8",
                                  style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),
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
              return Center(
                  child: Text("error",textAlign: TextAlign.center,),
              );
            }
              },
            ),
          ),
        ),
    );
  }
}
