import 'package:flutter/material.dart';
import 'package:recycle_hub_bd/scrap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycle Hub BD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // late AnimationController _scaleController;
  // late Animatable<double> _scaleAnimation;

  // bool hide = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _scaleController = AnimationController(
  //       vsync: this, duration: const Duration(microseconds: 500));

  //   _scaleAnimation = Tween<double>(begin: 1.0, end: 30.0)
  //       .animate(_scaleController)
  //       .addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       Navigator.push(context,
  //           PageTransition(child: ScrapPage(), type: PageTransitionType.fade));
  //     }
  //   }) as Animatable<double>;
  // }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/cover.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.3),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Recycle Hub BD",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Revolutionizing Recycling, Reshaping Bangladesh",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScrapPage()));
                  setState(() {
                    // hide = true;
                  });
                  // _scaleController.forward();
                },
                // child: AnimatedBuilder(
                //   animation: _scaleController,
                //   builder: (context, child) => Transform.scale(
                // scale: _scaleAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Get Start",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  )),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
