import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      height: MediaQuery.of(context).size.height * 0.70,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Message+',
            
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Portfolio+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            name: 'Ask+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 2,
          ),
          SlidingCard(
            name: 'Discover+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 3,
          ),
          SlidingCard(
            name: 'Connect+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 4,
          ),
          SlidingCard(
            name: 'Shop+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 5,
          ),
          SlidingCard(
            name: 'Date+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 6,
          ),
          SlidingCard(
            name: 'Mail+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 7,
          ),
          SlidingCard(
            name: 'Learn+',
            
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 8,
          ),          
          
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  //final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    //@required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.55,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 6),
            Expanded(
              child: CardContent(
                name: name,
                //date: date,
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
  final String name;
  //final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      //@required this.date,
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
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              "",
              //date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}