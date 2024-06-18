import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/colors.dart';

class Item extends StatelessWidget {

  final String ItemName;
  final String Image;
  final void Function() onTap;
  const Item({super.key,required this.ItemName, required this.Image, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 300,
      height: 200,

      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [

            Padding(
              padding: EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  color: color_1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 100,),
                      child: Column(

                        children: [
                          Container(
                            width: 280,
                            child: Text(ItemName , style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),softWrap: true, textAlign: TextAlign.center,)),
                          const SizedBox( height: 60,),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),


            Center(
                heightFactor: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: CachedNetworkImage(
                    imageUrl: Image,
                    height: 150,
                  ),
                )

            ),


          ],
        ),
      ),
    );
  }
}
