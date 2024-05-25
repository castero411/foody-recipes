import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/Page2/subPages/Service/model.dart';
import 'package:mobydoby/Pages/Page2/subPages/Service/service.dart';
import 'package:mobydoby/Pages/Page2/subPages/Widget/items.dart';
import 'package:mobydoby/Pages/common/subPages/ItemsView.dart';
import 'package:mobydoby/common/colors.dart';


class Itemfeed extends StatefulWidget {
  final String category;
  final String image;

  const Itemfeed({
    Key? key,
    required this.category,
    required this.image,
  }) : super(key: key);

  @override
  State<Itemfeed> createState() => _ItemfeedState();
}

class _ItemfeedState extends State<Itemfeed> {
  late Future<List<Meal>?> _futureMeals;

  @override
  void initState() {
    super.initState();
    _futureMeals = Service(categorie: widget.category).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          String thisTitle = widget.category;
          return [
            SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: background,
              iconTheme: IconThemeData(
                color:icon_color ,
                size: 30,
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  thisTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                collapseMode: CollapseMode.none,
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<Meal>?>(
            future: _futureMeals,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  itemCount: 10 ,
                  itemBuilder: (context, index) {
                    return const SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: const Text(
                        'Shimmer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    );
                  },
                );



              } else {
                var items = snapshot.data!;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ItemView(itemCode: item.idMeal, random: true,))
                        );
                      },
                      child: Items(
                        image: item.strMealThumb,
                        name: item.strMeal,
                        code: item.idMeal,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
