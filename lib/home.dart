import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:event_app_ui/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/data_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  List<DataModel> dates = new List<DataModel>();
  String todayDateis = '12';
  @override
  void initState() {
    super.initState();
    dates = getDates();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0xff102733)),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Color(0xff102733)),
              ),
              Container(
                padding: EdgeInsets.only(top: 60, left: 24,right: 24,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/logo.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'UVE',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'NTO',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xfffccd00),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/img/notify.png',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/img/menu.png',
                          width: 25,
                          height: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Hello, Eslam !',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Let's explore what’s happening nearby",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.3),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                      'assets/img/1.jpg',
                                    ))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //=============Dates==========
                    Container(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            return DateTile(
                              date: dates[index].date,
                              weekDay: dates[index].weekDay,
                              isSelected: todayDateis == dates[index].date,
                            );
                          }),
                    ),

                    ///Events
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "All Events",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          EventTile(
                            imgAssetspath: 'assets/img/concert.png',
                            eventType: 'Concert',
                          ),
                          EventTile(
                            imgAssetspath: 'assets/img/sports.png',
                            eventType: 'Sports',
                          ),
                          EventTile(
                            imgAssetspath: 'assets/img/education.png',
                            eventType: 'Education',
                          ),
                        ],
                      ),
                    ),

                    ///PopularEvents
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Popular Events",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          PopularEvents(
                            Title: "Sport Meet in Galaxy Field",
                            Date: 'May 12,2020',
                            location: 'Mansoura,Egypt',
                            img: 'assets/img/second.png',
                          ),
                          PopularEvents(
                            Title: "Art & Meet in Street Plaza",
                            Date: 'May 12,2020',
                            location: 'Mansoura,Egypt',
                            img: 'assets/img/tileimg.png',
                          ),
                          PopularEvents(
                            Title: "Youth Music",
                            Date: 'May 12,2020',
                            location: 'Mansoura,Egypt',
                            img: 'assets/img/music_event.png',
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

        bottomNavigationBar: BottomNavyBar(
   containerHeight: 50.0,
          backgroundColor: Color(0xff102733),
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
//            _pageController.animateToPage(index,
//                duration: Duration(milliseconds: 100), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.search,),
                title: Text('search'),
                activeColor: Colors.purpleAccent
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.amber,
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.star_border,),
                title: Text('star'),
                activeColor: Colors.pink
            ),
          ],
        )

    );
  }
}

class DateTile extends StatelessWidget {
  String weekDay;
  String date;
  bool isSelected;
  DateTile({this.weekDay, this.date, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xfffccd00) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
                color: !isSelected ? Colors.white70 : Colors.black54),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            weekDay,
            style: TextStyle(
                color: !isSelected ? Colors.white70 : Colors.black54,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  String imgAssetspath;
  String eventType;

  EventTile({this.imgAssetspath, this.eventType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10),
      width: 130,
      height: 120,
      decoration: BoxDecoration(
          color: Color(0xff29404e), borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imgAssetspath,
            height: 35,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            eventType,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class PopularEvents extends StatelessWidget {
  String Title;
  String Date;
  String location;
  String img;

  PopularEvents({this.Title, this.Date, this.location, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xff29404e), borderRadius: BorderRadius.circular(15.0)),
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Icon(Icons.calendar_today,color: Colors.white70,size: 18,),
                  SizedBox(width: 5,),
                  Text(Date,
                      style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.white70,size: 20,),
                  SizedBox(width: 5,),
                  Text(location,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12),),
                ],
              )
            ],
          ),
          Spacer(),
          Image.asset(
            img,
            width: 100,
//            height: 100,
          )
        ],
      ),
    );
  }
}
