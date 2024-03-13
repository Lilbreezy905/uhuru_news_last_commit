// ignore_for_file: unused_local_variable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhuru_news/model/category_news_model.dart';
import 'package:uhuru_news/view/web_view.dart';
import 'package:uhuru_news/view_model/news_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String categoryName = "sports";
  List<String> categoriesList = [
    "sports",
    "technology",
    "business",
    "science",
    "entertainment",
    "health",
    "world",
    "nation"
  ];
  @override
  Widget build(BuildContext context) {
    // CategoryNewsModel categoryNewsModel = CategoryNewsModel();
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    const spink2 = SpinKitFadingCircle(
      color: Colors.amber,
      size: 50,
    );
    NewsViewModel newsViewModel = NewsViewModel();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      categoryName = categoriesList[index];
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            color: categoryName == categoriesList[index]
                                ? const Color.fromARGB(255, 131, 4, 42)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                              child: Text(
                            categoriesList[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          )),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: FutureBuilder<CategoryNewsModel>(
                  future: newsViewModel.fetchCategorieNewsApi(categoryName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitCircle(
                          color: Color.fromARGB(255, 121, 3, 13),
                          size: 50,
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        height: height * .18,
                                        width: width * .3,
                                        imageUrl: data.image == null
                                            ? "https://media.istockphoto.com/id/1455487939/fr/photo/lettre-u-majuscule-police-en-bois-blanc-sur-fond-rouge-rhodamine.jpg?s=1024x1024&w=is&k=20&c=jcP7UpQ3GT8-v1XN8kBlXx7i7UuqIzoABDQJPZ8BzB4="
                                            : data.image!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
