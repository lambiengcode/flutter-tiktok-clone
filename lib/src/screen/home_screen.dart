import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok_ui/src/screen/pages/add_video_page.dart';
import 'package:flutter_tiktok_ui/src/screen/pages/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageController = 0;

  List<Widget> _pages = [HomePage(), Container(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: sizingInformation.localWidgetSize.height * 0.088,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 0;
                      });
                    },
                    child: _navBarItem(
                      title: "Home",
                      icon: Icons.home,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 1;
                      });
                    },
                    child: _navBarItem(
                      title: "Discover",
                      icon: Icons.search,
                    ),
                  ),
                ),
                _buildAddButton(sizingInformation),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 2;
                      });
                    },
                    child: _navBarItem(
                      title: "Inbox",
                      icon: Icons.message,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 3;
                      });
                    },
                    child: _navBarItem(
                      title: "Me",
                      icon: Icons.person,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: _pages[_pageController],
        );
      },
    );
  }

  Widget _navBarItem({String title, IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        SizedBox(height: 4.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.0,
          ),
        )
      ],
    );
  }

  Widget _buildAddButton(sizingInformation) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddVideoPage(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 16.0),
          width: 64,
          height: sizingInformation.localWidgetSize.height * 0.07,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 22,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 22,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.red),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 52,
                  height: sizingInformation.localWidgetSize.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
