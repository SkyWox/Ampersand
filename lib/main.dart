import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Uncomment lines 3 and 6 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

const appLRMargin = 20.0;
const authorNameSize = 30.0;
const defaultTextSize = 15.0;

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 215.0;

  @override
  double get minExtent => maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return readPromptSection();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

Widget readPromptSection() {
  return new Container(
      //color: Colors.black,
      padding:
          const EdgeInsets.symmetric(vertical: 30.0, horizontal: appLRMargin),
      child: new Column(children: [
        new Text('New Stories',
            style: new TextStyle(fontSize: 30.0, letterSpacing: 3.0)),
        new Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Stack(alignment: const Alignment(0.0, -1.0), children: [
              new Divider(
                color: Colors.white,
              ),
              new Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: new BoxDecoration(color: Colors.black),
                  child: new Text('9 Pack Bundle - Until April 3rd',
                      style: new TextStyle(fontSize: defaultTextSize)))
            ])),
        new CupertinoButton(
          child: new Container(
              child: new Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  child: new Text('READ WITH FRIENDS',
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white))),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(16.0),
                  ))),
          onPressed: () {},
        )
      ]),
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        begin: const Alignment(0.0, 1.0),
        end: const Alignment(0.0, 0.8),
        colors: <Color>[const Color(0x00000000), const Color(0xff000000)],
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageSection(imageURL) {
      return new Container(
          child: new Image.asset(
        imageURL,
        width: 600.0,
        height: 424.0,
        fit: BoxFit.cover,
      ));
    }

    Widget titleSection(authorFirst, authorLast, summary) {
      return new Container(
        padding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: appLRMargin),
        child: new Row(
          children: [
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Row(children: [
                        new Text(
                          authorFirst.toString() + ' ',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: authorNameSize),
                        ),
                        new Text(
                          authorLast,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: authorNameSize,
                              color: Colors.purple),
                        )
                      ])),
                  new Text(summary,
                      style: new TextStyle(fontSize: defaultTextSize + 1.5)),
                ],
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: const Alignment(0.0, -0.2),
          end: const Alignment(0.0, -1.0),
          colors: <Color>[const Color(0xff000000), const Color(0x00000000)],
        )),
      );
    }

    Widget profileSection(imageURL, authorFirst, authorLast, summary) {
      return new Container(
        child: new Stack(alignment: const Alignment(.6, 1.05), children: [
          imageSection(imageURL),
          titleSection(authorFirst, authorLast, summary)
        ]),
      );
    }

    Widget packageImage(imageURL) {
      return new Container(
          decoration: new BoxDecoration(
              color:Colors.black,
              borderRadius: new BorderRadius.all(const Radius.circular(10.0))),
          child: new Image.asset(
            imageURL,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ));
    }

    Widget packageInfo(index, type, title) {
      const _lineSpacing = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0);
      return new Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                    padding: _lineSpacing,
                    child: new Text(
                      type,
                      style: new TextStyle(
                          color: Colors.white30, fontSize: defaultTextSize),
                    )),
                new Container(
                    padding: _lineSpacing,
                    child: 
                    new Text(index.toString() + '. '+title,
                          style: new TextStyle(
                              color: Colors.white, fontSize: defaultTextSize)),
                    ),
                new Container(
                    padding: _lineSpacing,
                    child: new Text(
                      'READ ->',
                      style: new TextStyle(
                          color: Colors.lightBlue[400],
                          fontSize: defaultTextSize),
                    ))
              ]));
    }

    Widget packageDetail(index, type, title, imageURL) {
      return new Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: new CupertinoButton(
              onPressed: () {},
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  packageImage(imageURL),
                  new Expanded(child:packageInfo(index, type, title)),
                ],
              )));
    }

    Widget packageSection(packageSummary) {
      return new Container(
          padding: const EdgeInsets.symmetric(horizontal: appLRMargin),
          child: 
           new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(packageSummary,
                        style: new TextStyle(
                            color: Colors.orange,
                            fontSize: defaultTextSize + 2.0)),
                packageDetail(1, 'DRAFT MANUSCRIPT', 'THE WOLF PACT',
                    'assets/images/RidleyPearson.jpg'),

                packageDetail(
                    2,
                    'CHARACTER NOTES',
                    'THE WOLF PACT Character Sketches',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(3, 'DRAFT MANUSCRIPT', 'HACKTIVISTS',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(
                    4,
                    'CHARACTER NOTES',
                    'HACKTIVISTS Character Sketches',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(
                    5,
                    'CHARACTER NOTES',
                    'How the Fairlies Came to Be',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(
                    6,
                    'CHARACTER NOTES',
                    'KK7 Spoiler: Why a Favorite Character Had to Die',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(
                    7,
                    'CHARACTER NOTES',
                    'Ridley\'s Research Checklist',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(8, 'ARCHIVES', 'Advice to Young Writers',
                    'assets/images/RidleyPearson.jpg'),
                packageDetail(9, 'DRAFT MANUSCRIPT', 'THE GRIFT SENSE',
                    'assets/images/RidleyPearson.jpg'),
              ]));
    }

    Widget aboutSection(aboutText) {
      return new Container(
          padding: const EdgeInsets.symmetric(horizontal: appLRMargin),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text('About the Bundle',
                    style: new TextStyle(
                        color: Colors.orange, fontSize: defaultTextSize + 2.0)),
                new Text(aboutText,
                    style: new TextStyle(fontSize: defaultTextSize))
              ]));
    }

    return new MaterialApp(
      title: 'Ampersand Flutter',
      theme: new ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.white),
      home: new Scaffold(
        body: new Container(
            color: Colors.black,
            child: new CustomScrollView(
              slivers: <Widget>[
                new SliverToBoxAdapter(
                    child: profileSection(
                        'assets/images/RidleyPearson.jpg',
                        'Ridley',
                        'Pearson',
                        'Discover Kingdom Keepers secrets and check out the first few chapters of two new series. It\'s writing you\'ve never seen before -- anywhere.')),
                new SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: new HeaderDelegate()),
                new SliverToBoxAdapter(
                    child: packageSection('9 Pack Bundle Includes')),
                new SliverToBoxAdapter(
                    child: aboutSection(
                        '\nThese stories are for pre-publication, and thus can only exist in our app for a limited time. After April 3, 2018, they go back in the vault, awaiting the next stage of life. For more detrails see our Terms of Service.\n\nIn addition to never-before-seen essays and personal thoughts from Ridley about the Kingdom Keepers series, get access to the first few chapters of two entirely new series.\n\nThe Hacktivists are a group of young computer experts who combine their skills to combat the social injustices around them. This new series is harrowing, funny, and overflowing with quirky new friendships.\n\nThe Wolf Pact is set at the country’s only wildlife forensics lab in Ashland, Oregon. There, a group of high school friends battle the targeted annihilation of local endangered species.\n\nJoin Ampersand now to go behind the scenes with Ridley Pearson and discover writing you won\'t find anywhere else!')),
              ],
            )),
      ),
    );
  }
}
