// ignore_for_file: unused_local_variable, unnecessary_const

import 'package:flutter/material.dart';
import 'package:uhuru_news/model/news_headline_model.dart';
import 'package:uhuru_news/view/category_screen.dart';
import 'package:uhuru_news/view/web_view.dart';
import 'package:uhuru_news/view_model/news_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var data = [];

enum FilterList {
  sport,
  technology,
  business,
  science,
  entertainment,
  health,
  politics,
  environment
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  FilterList? selectedMenu;
  String name = "Business";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    const spink2 = SpinKitFadingCircle(
      color: Colors.amber,
      size: 50,
    );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const CategoryScreen())));
          },
          child: const Expanded(child: Icon(Icons.menu)),
        ),
        title: const Text(
          "Uhuru news",
          style: TextStyle(
              color: Color.fromARGB(255, 6, 175, 43),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .45,
            width: width,
            child: FutureBuilder<NewsChannnelHeadlineModel>(
              future: newsViewModel.fetchNewsHeadlineApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCircle(
                      color: Colors.blue,
                      size: 50,
                    ),
                  );
                }

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.articles![index];
                      return InkWell(
                        onTap: () {
                          var image = data.image == null
                              ? "https://media.istockphoto.com/id/1455487939/fr/photo/lettre-u-majuscule-police-en-bois-blanc-sur-fond-rouge-rhodamine.jpg?s=1024x1024&w=is&k=20&c=jcP7UpQ3GT8-v1XN8kBlXx7i7UuqIzoABDQJPZ8BzB4="
                              : data.image!;
                          // print(image);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WebViewPage(
                                description: data.description!,
                                url: data.url!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .04),
                          child: SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * 0.02),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      height: height * 0.6,
                                      width: width * .9,
                                      imageUrl: data.image == null
                                          ? "https://media.istockphoto.com/id/1455487939/fr/photo/lettre-u-majuscule-police-en-bois-blanc-sur-fond-rouge-rhodamine.jpg?s=1024x1024&w=is&k=20&c=jcP7UpQ3GT8-v1XN8kBlXx7i7UuqIzoABDQJPZ8BzB4="
                                          : data.image!,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        child: spink2,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Card(
                                    elevation: 5,
                                    color: const Color.fromARGB(255, 1, 78, 83),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: height * .22,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * 0.7,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Text(
                                              data.title!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                      );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(23),
            child: FutureBuilder<NewsChannnelHeadlineModel>(
              future: newsViewModel.fetchHistoryApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCircle(
                      color: Colors.blue,
                      size: 50,
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.articles!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.articles![index];
                        var image = data.image == null
                            ? "https://media.istockphoto.com/id/1455487939/fr/photo/lettre-u-majuscule-police-en-bois-blanc-sur-fond-rouge-rhodamine.jpg?s=1024x1024&w=is&k=20&c=jcP7UpQ3GT8-v1XN8kBlXx7i7UuqIzoABDQJPZ8BzB4="
                            : data.image!;
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WebViewPage(
                                  description: data.description!,
                                  url: data.url!,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    height: height * .18,
                                    width: width * .3,
                                    imageUrl: image,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      child: spink2,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: height * .18,
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        data.title!,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black54),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
