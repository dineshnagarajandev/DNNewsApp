import 'package:DNNewsApp/helper/constants.dart';
import 'package:DNNewsApp/helper/data.dart';
import 'package:DNNewsApp/models/article_model.dart';
import 'package:DNNewsApp/models/category_model.dart';
import 'package:DNNewsApp/models/news.dart';
import 'package:DNNewsApp/views/article_view.dart';
import 'package:DNNewsApp/views/country_list_view.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_icons/country_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<Article> newsList = new List<Article>();
  bool _loading = true;
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews(category: "top headlines");
    print("InitState");
  }

  getNews({category: String}) async {
    News news = News();
    await news.getNews(category: category);
    newsList = news.news;
    setState(() {
      _loading = false;
      print(AppConstants.selectedCountryCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    print("Share tapped");
                  },
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("county tapped");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryListView()));
                    },
                    child: Image.asset(
                      'icons/flags/png/in.png',
                      package: 'country_icons',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ))
          ],
          centerTitle: true,
          elevation: 0.0),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    // Categories
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == selectedCategoryIndex) {
                              return GestureDetector(
                                onTap: () {
                                  // selectedCategoryIndex = index;
                                },
                                child: CategoryTitle(categories[index].imageURL,
                                    categories[index].categoryName, true),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                    String catName = categories[index]
                                        .categoryName
                                        .toLowerCase();
                                    getNews(category: catName);
                                  });
                                },
                                child: CategoryTitle(categories[index].imageURL,
                                    categories[index].categoryName, false),
                              );
                            }
                          }),
                    ),

                    // News view
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                newsList[index].urlToImage,
                                newsList[index].title,
                                newsList[index].description,
                                newsList[index].url);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final imageURL, categoryName, selectedState;
  CategoryTitle(this.imageURL, this.categoryName, this.selectedState);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selectedState ? Colors.blue : Colors.white,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.black26),
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String blogImage, blogTitle, blogDescription, blogURL;
  BlogTile(this.blogImage, this.blogTitle, this.blogDescription, this.blogURL);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Entered article detail view");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogURL)));
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: blogImage)),
            SizedBox(
              height: 8,
            ),
            Text(
              blogTitle,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              blogDescription,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
