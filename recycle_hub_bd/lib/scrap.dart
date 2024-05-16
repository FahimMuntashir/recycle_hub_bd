import 'package:flutter/material.dart';
import 'package:recycle_hub_bd/books_page.dart';

class ScrapPage extends StatefulWidget {
  const ScrapPage({super.key});

  @override
  State<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends State<ScrapPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF545D68),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFF545D65),
            ),
          ),
          actions: <Widget>[],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 20.0),
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Scraps List",
              style: TextStyle(
                  // fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    'Papers',
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Newspaper',
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'E-Waste',
                    style: TextStyle(
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  BooksPage(),
                  BooksPage(),
                  BooksPage(),
                ]))
          ],
        ));
  }
}
