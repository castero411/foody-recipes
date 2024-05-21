import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {


  final String url;
  final String name;
  const MenuItem({super.key, required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
        height: 20,
        width: 20,
        color: const Color.fromRGBO(37,34,29, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: SizedBox(
                  width: 80,
                    height: 80,
                    child: CachedNetworkImage(
                      fit:BoxFit.cover,
                      imageUrl:url,
                    )
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                    child: Text(name,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                ),
              ),

            ],
        ),
        ),
      ),
    );
  }
}

