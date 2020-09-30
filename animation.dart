import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var myanicon;
  var animation, animation1, animation2;
  Animation _myAnimation;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    _myAnimation = CurvedAnimation(parent: myanicon, curve: Curves.easeIn);

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.easeInOutSine)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });
    animation1 = CurvedAnimation(parent: myanicon, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {
          print(animation1.value);
        });
      });

    animation2 = CurvedAnimation(parent: myanicon, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {
          print(animation2.value);
        });
      });

    print(animation);

    myanicon.forward();
    print(myanicon);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
            elevation: 15 * animation1.value,
            child: GestureDetector(
              onTap: () {
                myanicon.forward(from: 0.5);
                print("clicked ..");
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //decoration: Color.fromRGBO(0, 255, 255, 2),
                width: 80 * animation1.value + 150,
                height: 1 * animation1.value + 50,
                color: Color.fromRGBO(255, 69, 0, 180),
                child: Center(
                  child: Text(
                    'A.P.J. ABDUL KALAM',
                    style: TextStyle(
                      fontSize: 20.0 * animation1.value + 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            elevation: 15 * animation.value,
            child: GestureDetector(
              onTap: () {
                myanicon.forward(from: 0.1);
                print("clicked ..");
              },
              child: Container(
                width: 290 * animation.value + 50,
                height: 180 * animation.value + 50,
                color: Color.fromRGBO(255, 69, 0, 80),
                child: Center(
                  child: Image.asset('assets/apj.jpg'),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            elevation: 15 * animation2.value,
            child: GestureDetector(
              onTap: () {
                myanicon.forward(from: 0.1);
                print("clicked ..");
              },
              child: Container(
               // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                width: 290 * animation2.value + 50,
                height: 100 * animation2.value + 50,
                color: Color.fromRGBO(255, 69, 0, 1000),
                child: Center(
                  child: Text(
                    '" You have to dream before your dreams can come true. "',
                    style: TextStyle(
                      fontSize: 20 .0 * animation2.value + 8.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
            child: FadeTransition(
          opacity: _myAnimation,
          child: Container(
            width: 400,
            height: 150,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 69, 0, 100),
                image: new DecorationImage(
                    image: new AssetImage(
                  'assets/dreams1.jpg',
                ))),
          ),
        )),
      ],
    );
  }
}
