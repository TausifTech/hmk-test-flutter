import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hmk_test/MainScreens/sliding_cards_details.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            itemName: 'Mr. Toot',
            details: 'More spicy more toot',
            assetName: '13.jpg',
            offset: pageOffset,
            price: 250,
          ),
          SlidingCard(
            itemName: 'Drama Queen',
            details: 'Spicy queen',
            assetName: '11.jpeg',
            price: 250,
            offset: pageOffset - 1,
          ),
          SlidingCard(
            itemName: 'Basic Boy',
            details: 'Kids Love',
            assetName: '13.jpg',
            price: 200,
            offset: pageOffset - 2,
          ),
          SlidingCard(
            itemName: 'Extra Drama',
            details: 'For Ultra Premiums',
            assetName: 'burgersaltreel.jpg',
            price: 280,
            offset: pageOffset - 3,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String itemName;
  final dynamic price;
  final String details;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.itemName,
    @required this.price,
    @required this.details,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        color: Colors.amberAccent,
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/images/$assetName',
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                itemName: itemName,
                details: details,
                image: assetName,
                price: price,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String itemName;
  final String details;
  final String image;
  final dynamic price;
  final double offset;

  const CardContent(
      {Key key,
      @required this.itemName,
      @required this.image,
      @required this.price,
      @required this.details,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(
              itemName,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              details,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              SizedBox(
                width: 1,
              ),
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardDetails(
                                image: image,
                                itemName: itemName,
                                price: price,
                              )),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Order',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Color(0xFF162A49),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white, width: 2.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(39, 105, 171, 1),
                          Color.fromRGBO(4, 9, 35, 1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[800].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(3, 7), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  price.toString() + " tk",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
