import 'package:cloth_e_commerece/src/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetailPage extends StatefulWidget {
  final ProductModel productModel;

  const DetailPage({this.productModel});

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var images = [
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400050/75838319-male-model-in-a-suit-posing-in-front-of-a-wooden-wall.jpg",
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1612/alexyakimvski161200041/68190850-male-model-in-a-suit-posing-next-to-a-grey-wall.jpg",
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400015/75821282-male-model-in-a-suit-posing-indoors-.jpg",
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400027/75830900-male-model-posing-.jpg",
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400020/75830892-male-model-in-a-suit-posing-.jpg",
    "https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400013/75752720-male-model-in-a-suit-posing-indoors.jpg",
  ];

  bool isFav = true;
  bool isreadMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: Icon(Icons.notifications),
              padding: EdgeInsets.only(top: 15.0),
            ),
            Positioned(
              top: 15.0,
              right: 3.0,
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            )
          ])
        ],
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          productHeader(),
          productName(),
          productDetail(),
          productSize()
        ],
      ),
    );
  }

  SliverToBoxAdapter productName() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Text(
          widget.productModel.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
    );
  }

  SliverPadding productSize() {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text(
            'Select Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 30.0,
                height: 30.0,
                color: Colors.grey,
                child: Text('S'),
                alignment: Alignment.center,
              ),
              Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 30.0,
                height: 30.0,
                color: Colors.deepOrange,
                child: Text('M'),
                alignment: Alignment.center,
              ),
              Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 30.0,
                height: 30.0,
                color: Colors.grey,
                child: Text('L'),
                alignment: Alignment.center,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Select Color',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 30.0,
                height: 30.0,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.only(right: 5.0),
                width: 30.0,
                height: 30.0,
                color: Colors.black,
              ),
              Container(
                width: 30.0,
                height: 30.0,
                color: Colors.blue,
              ),
            ],
          ),
        ]),
      ),
    );
  }

  SliverPadding productDetail() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(
              '${widget.productModel.details}',
              maxLines: isreadMore ? null : 3,
              overflow: isreadMore ? TextOverflow.fade : TextOverflow.ellipsis,
            ),
            InkWell(
              child: isreadMore
                  ? Text(
                      'Read Less',
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      'Read More',
                      style: TextStyle(color: Colors.blue),
                    ),
              onTap: () {
                setState(() {
                  isreadMore = !isreadMore;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter productHeader() {
    return SliverToBoxAdapter(
      child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 180.0,
                    child: Swiper(
                      itemHeight: 180.0,
                      containerHeight: 180.0,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          images[index],
                          fit: BoxFit.cover,
                        );
                      },
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      autoplay: true,
                      itemCount: images.length,
                      pagination: new SwiperPagination(),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 5.0,
                    child: IconButton(
                      icon: isFav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: isFav ? Colors.red : Colors.grey,
                      onPressed: () {
                        setState(() {});
                        isFav = !isFav;
                      },
                    ),
                  )
                ],
              ),
              Card(
                elevation: 5.0,
                child: ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 18.0,
                      ),
                      Text('${widget.productModel.price}'),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        '${widget.productModel.discountPrice}',
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Container(
                        width: 40.0,
                        height: 20.0,
                        color: Colors.orangeAccent,
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.productModel.rating}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('${widget.productModel.reviews} Reviews'),
                    ],
                  ),
                  trailing: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {},
                    child: Text(
                      'Buy now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
