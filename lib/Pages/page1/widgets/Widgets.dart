import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final List <List<String>> Menu ;
  int index;
  MenuItem(this.Menu,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(


      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
          height: 20,
          width: 20,
          color: const Color.fromRGBO(37,34,29, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox(
                    width: 100,
                      child: CachedNetworkImage(
                        imageUrl: Menu[index][0],
                      )
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                      child: Text(Menu[index][1],style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                  ),
                ),

              ],
          ),
          ),
        ),
      ),
    );
  }
}

