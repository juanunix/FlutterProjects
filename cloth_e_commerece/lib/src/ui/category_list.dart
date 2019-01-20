import 'package:cloth_e_commerece/src/model/product_model.dart';
import 'package:cloth_e_commerece/src/ui/detail_page.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatefulWidget {
  final String catname;

  const CategoryListPage({Key key, this.catname}) : super(key: key);

  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<ProductModel> productList = new List<ProductModel>();
  @override
  void initState() {
    productList = ProductModel.getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          new Icon(Icons.notifications),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.catname,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 6.0 / 9.0),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 400.0,
                    child: Card(
                      elevation: 5.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            height: 170.0,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                  topLeft: new Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(0.0),
                                  bottomLeft: Radius.circular(0.0),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      productList[index].image,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 5.0, left: 5.0, right: 5.0),
                            width: MediaQuery.of(context).size.width / 2,
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
                                      width: 2.0,
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
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
