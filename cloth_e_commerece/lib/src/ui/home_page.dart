import 'package:cloth_e_commerece/src/model/categories_model.dart';
import 'package:cloth_e_commerece/src/model/product_model.dart';
import 'package:cloth_e_commerece/src/ui/category_list.dart';
import 'package:cloth_e_commerece/src/ui/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const FBURL = "https://www.facebook.com/groups/392934177836346";
  static const GITHUBURL = "https://github.com/kanulp";
  static const TWITTERURL = "https://twitter.com/kanu_lp";

  List<CategoriesModel> catList = new List<CategoriesModel>();
  List<ProductModel> productList = new List<ProductModel>();
  @override
  void initState() {
    super.initState();
    catList = CategoriesModel.getCategoriesList();
    productList = ProductModel.getProductList();
    print(catList.length);
    print(productList.length);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[Icon(Icons.notifications)],
      ),
      drawer: buildDrawer(context),
      body: CustomScrollView(
        slivers: <Widget>[
          searchBar(),
          showTitle("Categories"),
          categoryList(),
          showTitle("Featured"),
          featuredList(),
          showTitle("Best Selling"),
          bestSellingList(),
        ],
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget showTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text(title), Text('See all')],
        ),
      ),
    );
  }

  SliverToBoxAdapter bestSellingList() {
    return SliverToBoxAdapter(
        child: Container(
      width: 120.0,
      height: 200.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 20.0),
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => DetailPage(
                          productModel: productList[index],
                        ))),
            child: Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 140.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(productList[index].image),
                            fit: BoxFit.cover)),
                    // color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    width: 120.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              size: 14.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(productList[index].price.toString()),
                          ],
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 14.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      productList[index].name,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  SliverToBoxAdapter featuredList() {
    return SliverToBoxAdapter(
        child: Container(
      width: 120.0,
      height: 200.0,
      margin: EdgeInsets.only(right: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => DetailPage(
                            productModel: productList[index],
                          )));
            },
            child: Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(
                left: 15.0,
                bottom: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 140.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(productList[index].image),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    width: 120.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              size: 14.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              productList[index].price.toString(),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite,
                          size: 14.0,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      productList[index].name,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  SliverToBoxAdapter categoryList() {
    return SliverToBoxAdapter(
        child: Container(
      height: 120.0,
      width: 120.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: catList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => CategoryListPage(
                              catname: catList[index].name,
                            )));
              },
              child: Card(
                elevation: 5.0,
                margin: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                            topLeft: new Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                            bottomRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(0.0),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(catList[index].image),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      catList[index].name,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }),
    ));
  }

  SliverToBoxAdapter searchBar() {
    return SliverToBoxAdapter(
      child: Container(
        height: 40.0,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: new Offset(0.0, 10.0),
                blurRadius: 12.0,
              ),
              BoxShadow(
                  color: Colors.black12,
                  offset: new Offset(0.0, -1.0),
                  blurRadius: 24.0,
                  spreadRadius: 1.0),
            ]),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Search Your Product'),
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('Twitter @kanu_lp'),
            accountName: Text('Karan Gajjar'),
            currentAccountPicture: Image.network(
                'https://pbs.twimg.com/profile_images/796056221241380864/A5uEVRLw_400x400.jpg'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Join Flutter FB Group'),
            onTap: () {
              Navigator.pop(context);
              _launchURL(FBURL);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Follow me on twitter @kanu_lp'),
            onTap: () {
              Navigator.pop(context);
              _launchURL(TWITTERURL);
            },
          ),
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('My Github @kanulp'),
            onTap: () {
              _launchURL(GITHUBURL);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

}
