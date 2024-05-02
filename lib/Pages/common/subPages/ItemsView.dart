import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemView extends StatelessWidget {

  String itemName;
  String itemImage;
  ItemView(this.itemName,this.itemImage);



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
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(

            child: Column(

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Container(color: colo_1,width: 200,height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                const SizedBox(height: 40,),
                Container(),
                Text(itemName,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)

              ],
            ),
          ),
        ),
    );
  }
}
