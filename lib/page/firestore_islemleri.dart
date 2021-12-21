import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

int randomNumber = random.nextInt(100);

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
var list = ['a', 'b', 'c', 'd'];
final r = new Random();
var i = r.nextInt(list.length);

//var element = getRandomElement(list);
//
var list1 = [1, 2, 3, 4, 5, 6];
/*
 var rng = new Random();
    var list3=[1,2,3,4,56,7];
    for (var k = 0; k < 10; k++) {
      //print(rng.nextInt(100));
      list3[k] = rng.nextInt(100);
    }*/

class FirestoreIslemleri extends StatefulWidget {
  @override
  _FirestoreIslemleriState createState() => _FirestoreIslemleriState();
}

class _FirestoreIslemleriState extends State<FirestoreIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Islemleri"),
      ),
    
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            RaisedButton(
              child: Text("Add Data"),
              color: Colors.lime,
              onPressed: _veriEkle,
            ),
            Spacer(),
            RaisedButton(
              child: Text("Another Button if you are interested"),
              color: Colors.pink,
              // Within the `FirstRoute` widget
// Within the SecondRoute widget
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimatedBalloon()));
              },
            ),
            Spacer(),
             RaisedButton(
              child: Text("One more"),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimatedBalloon()));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _veriEkle() {
    Map<String, dynamic> user1 = Map();
    //yenidata['1'] = getRandomElement(list);
    //yenidata['2'] = list;
    //yenidata['3'] = list[2];

    for (var mk = 0; mk < 3; mk++) {
      
      final random = new Random();
      var liste=[1,2,3,4,5,6,7,8,9];
      var i = random.nextInt(liste.length);
      //user1[mk.toString()]=liste[i];
      user1[mk.toString()] = List.generate(4, (m) => randomNumber);
mk++;
      //user1['m'] = List.generate(96, (randomNumber) => randomNumber);
      randomNumber = random.nextInt(70);
    
    }
    for (var x = 0; x < 3; x++) {
      int a = 1;
     // user1[x.toString()] = List.generate(9, (a) => randomNumber);
      a++;
      x++;
    }
   
    //user1['1'] = List.generate(9, (index) => randomNumber);
    //user1['2'] = List.filled(5, 7);
    //user1['3'] = randomNumber;

    _firestore
        .collection("users")
        .doc("user1")
        .set(user1, SetOptions(merge: true))
        .then((v) => debugPrint("user1 eklendi"));

    _firestore
        .collection("users")
        .doc("another_map")
        .set({'name': 'mel', 'sex': 'male'}).whenComplete(
            () => debugPrint("baskabirmap eklendi"));

    _firestore
        .collection("users")
        .doc("map2")
        .set({'department': 'ce', 'grade': 'a+'}).whenComplete(
            () => debugPrint("co-users eklendi"));

    _firestore.collection("co-users").add({'faculty': 'ed', 'code of country': 90});
  }
}

/*
T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}
*/

class ss extends StatelessWidget {
  const ss({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sss')),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AnimatedBalloon()));
        },
        child: Text("hosgeldiniz"),
      )),
    );
  }
}

class ss2 extends StatelessWidget {
  const ss2({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giris Sayfasi')),
      body: Center(
          child: RaisedButton(
        onPressed: () {},
        child: Text("** hosgeldiniz **"),
      )),
    );
  }
}

//---******

class AnimatedBalloon extends StatefulWidget {
  const AnimatedBalloon({Key? key}) : super(key: key);

  @override
  _AnimatedBalloonState createState() => _AnimatedBalloonState();
}

class _AnimatedBalloonState extends State<AnimatedBalloon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  late double _balloonHeight;
  late double _balloonWidth;
  late double _balloonBottomLocation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _balloonHeight = MediaQuery.of(context).size.height / 2;
    _balloonWidth = MediaQuery.of(context).size.height / 3;
    _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.75, curve: Curves.elasticInOut),
      ),
    );

    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
            left: _animationGrowSize.value * 0.25,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        child: Image.asset(
          'assets/images/flo.png',
          height: _balloonHeight,
          width: _balloonWidth,
        ),
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
