import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/Page2/subPages/Service/model.dart';
import 'package:mobydoby/Pages/Page2/subPages/Service/service.dart';
import 'package:mobydoby/Pages/Page2/subPages/Widget/items.dart';
import 'package:mobydoby/Pages/common/subPages/ItemsView.dart';


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
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          String thisTitle = widget.category;
          return [
            SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: const Color.fromRGBO(22, 22, 22, 1),
              iconTheme: const IconThemeData(
                color: Color.fromRGBO(237, 136, 48, 1),
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
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No items found'));
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
