import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String name;
  final String image;
  final String code;
  const Items({super.key, required this.image, required this.name, required this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5,top:5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: const Color.fromRGBO(37,34,29, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible( // Wrap Row with Flexible for responsiveness
                      child: Center(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column( // Change to Column to display name and code
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white , fontWeight: FontWeight.normal, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}