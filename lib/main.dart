import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Uncomment lines 3 and 6 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class StrikeThroughDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return new _StrikeThroughPainter();
  }
}

class _StrikeThroughPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = new Paint()
      ..strokeWidth = 1.0
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final rect = offset & configuration.size;
    canvas.drawLine(new Offset(rect.left, rect.top + rect.height / 2),
        new Offset(rect.right, rect.top + rect.height / 2), paint);
    canvas.restore();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageSection = new Container(
        child: new Image.asset(
      'images/RidleyPearson.jpg',
      width: 600.0,
      height: 424.0,
      fit: BoxFit.cover,
    ));

    const appLRMargin = 20.0;
    const authorNameSize = 30.0;
    const defaultTextSize = 15.0;

    Widget titleSection = new Container(
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
                        'Ridley ',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: authorNameSize),
                      ),
                      new Text(
                        'Pearson',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: authorNameSize,
                            color: Colors.purple),
                      )
                    ])),
                new Text(
                    'Discover Kingdom Keeps secrets and check out the first few chapters of two new series. It\'s writing you\'ve never seen before -- anywhere.',
                    style: new TextStyle(fontSize: defaultTextSize)),
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

    Widget profileSection = new Container(
      child: new Stack(
          alignment: const Alignment(.6, 1.05),
          children: [imageSection, titleSection]),
    );

    Widget readPromptSection = new Container(
        padding:
            const EdgeInsets.symmetric(vertical: 40.0, horizontal: appLRMargin),
        child: new Column(children: [
          new Text('New Stories',
              style: new TextStyle(fontSize: 30.0, letterSpacing: 3.0)),
          new Container(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              foregroundDecoration: new StrikeThroughDecoration(),
              child: new Text('9 Pack Bundle - Until April 3rd',
                  style: new TextStyle(fontSize: defaultTextSize))),
          new CupertinoButton(
            child: new Container(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                child: new Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  child: new Text('READ WITH FRIENDS',
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w900)),
                ),
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(16.0),
                    ))),
            onPressed: () {},
          )
        ]));

    Widget packageSection = new Container(
        padding: const EdgeInsets.symmetric(horizontal: appLRMargin),
        child: new Text('9 Pack Bundle Includes',
            style: new TextStyle(
                color: Colors.orange, fontSize: defaultTextSize + 2.0)));

    Widget aboutSection = new Container(
        padding: const EdgeInsets.symmetric(horizontal: appLRMargin),
        child: new Text('About the Bundle',
            style: new TextStyle(
                color: Colors.orange, fontSize: defaultTextSize + 2.0)));

    return new MaterialApp(
      title: 'Ampersand Flutter',
      theme: new ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.white),
      home: new Scaffold(
        body: new ListView(
          children: [
            profileSection,
            readPromptSection,
            packageSection,
            aboutSection
          ],
        ),
      ),
    );
  }
}
