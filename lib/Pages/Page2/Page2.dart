import 'package:flutter/material.dart';
import 'package:mobydoby/Pages/Page2/services/remote_service.dart';
import 'package:mobydoby/Pages/Page2/subPages/ItemFeed.dart';
import 'package:mobydoby/common/colors.dart';
import 'package:mobydoby/Pages/mainMenu/widgets/Widgets.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: background,
            title: const  Text(
              "Search",
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //todo : create a search engine
                },
                icon: Icon(
                  Icons.search,
                  color: icon_color,
                  size: 30,
                ),
              ),
            ],
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 100, // Set as per your design

          ),
          const SliverPadding(
            padding: EdgeInsets.all(15.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    
                    child: Text(
                      "Categories",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: RemoteServieces().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Itemfeed(
                                category: snapshot.data![index].strCategory,
                                image: snapshot.data![index].strCategoryThumb,
                              ),
                            ),
                          );
                        },
                        child: MenuItem(
                          name: snapshot.data![index].strCategory,
                          url: snapshot.data![index].strCategoryThumb,
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                );
              } else {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("Refresh"),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
