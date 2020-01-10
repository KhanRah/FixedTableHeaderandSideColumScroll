import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{


  AnimationController _ColorAnimationController;
  Animation _colorTween,_textColorTween,_staffNameTween;



  ScrollController headersController;
  ScrollController calendarHeader;
  ScrollController staffController;
  SyncScrollController _syncScroller;



  @override
  void initState() {

    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.blue)
        .animate(_ColorAnimationController);
    _textColorTween = ColorTween(begin: Colors.transparent, end: Colors.redAccent)
        .animate(_ColorAnimationController);
    _staffNameTween = ColorTween(begin: Colors.transparent, end: Colors.black)
        .animate(_ColorAnimationController);


    super.initState();
    headersController=new ScrollController();
    staffController=new ScrollController();
    calendarHeader=new ScrollController();

    _syncScroller = new SyncScrollController([headersController , staffController,]);

//    calendarHeader.addListener(_scrollListener);
//    headersController.addListener(_scrollheaderListener);

  }

//  bool _scrollListener(ScrollNotification scrollInfo) {
//
//    print('pixel Position ${calendarHeader.position}');
//    if (scrollInfo.metrics.axis == Axis.vertical) {
//      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);
//      return true;
//    }
//  }
//  _scrollheaderListener() {
//    print('pixel Position ${headersController.offset}');
//    staffController.jumpTo(headersController.offset);
//  }

  bool _scrollListenerr(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
        NotificationListener(
          onNotification: _scrollListenerr,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.all(10.0),child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Store Name'),Text('Filter')],),),
                Stack(
                  children: <Widget>[
//                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Container(color:Colors.blue,height:30,child: Text('Month')),Text('Daily')],),
                    Container(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(
//                          padding:EdgeInsets.only(left:22.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.chevron_left),
                                      onPressed: () {

                                      },
//                            padding: EdgeInsets.all(10.0),
                                    ),
                                    InkWell(
                                      onTap: () {
//                                      show_date_picker(context);
                                      },
                                      child: Text(
                                        "${DateTime.now().toString()}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.chevron_right),
//                              padding: EdgeInsets.all(10.0),
                                        onPressed: () {

                                        }
                                        ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap:(){
//
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 6.0,bottom: 6.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                        border: new Border.all(
                                            color: Colors.grey[300]),
                                        shape: BoxShape.rectangle
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: (){print('This is iughdaufiuid');},
                                        child: Text('Today',
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Quicksand",
                                                fontSize: 12.0
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    AnimatedBuilder(animation: _ColorAnimationController, builder: (context,child)=>Container(
                      color: _colorTween.value,
                      child: Table(
                        columnWidths: {
                          0: FractionColumnWidth(0.1),
                          1: FractionColumnWidth(0.9)
                        },
                        children:<TableRow>[
                          TableRow(
                              children: [
                                Column(children: <Widget>[sideColumn(' ')],),
                                NotificationListener<ScrollNotification>(
                                   onNotification: (ScrollNotification scrollInfo) {
                                     _syncScroller.processNotification(scrollInfo, headersController);
                                    },
                                  child: SingleChildScrollView(
                                    controller: headersController,
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            staffNames('Khan',_textColorTween.value,_staffNameTween.value),
                                            staffNames('Hemanth',_textColorTween.value,_staffNameTween.value),
                                            staffNames('Ramesh',_textColorTween.value,_staffNameTween.value),
                                            staffNames('Mahesh',_textColorTween.value,_staffNameTween.value),
                                            staffNames('Karthik',_textColorTween.value,_staffNameTween.value)
                                            // table header items
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]
                          )
                        ] ,
                      ),
                    ))
                  ],
                ),
                Expanded(
                  child: Container(
                    child: NotificationListener(
                      onNotification: (ScrollNotification scrollInfo) {
//                        _syncScroller.processNotification(scrollInfo, calendarHeader);
                      },
                      child: CustomScrollView(
                        controller:calendarHeader ,
                        slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildListDelegate([
                            completeCalendar()
                          ]),
                        )
                      ],),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

   completeCalendar() {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.blueAccent,
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(0.1),
                        1: FractionColumnWidth(0.9)
                      },
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                sideColumn(' '),
                                sideColumn('0'),
                                sideColumn('1'),
                                sideColumn('2'),
                                sideColumn('3'),
                                sideColumn('4'),
                                sideColumn('5'),
                                sideColumn('6'),
                                sideColumn('7'),
                                sideColumn('8'),
                                sideColumn('9'),
                                sideColumn('10'),
                                sideColumn('11')
                              ],
                            ),
//                          child:
                              NotificationListener(
                                onNotification:  (ScrollNotification scrollInfo) {
                                  _syncScroller.processNotification(scrollInfo, staffController);
                                },
                                child: SingleChildScrollView(
                                  controller: staffController,
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          staffName(' '),
                                          staffName(' '),
                                          staffName(' '),
                                          staffName(' '),
                                          staffName(' ')
                                          // table header items
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          dataCells(),
                                          dataCells(),
                                          dataCells(),dataCells(),dataCells()
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
//                        ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
//                child:Padding(
//                  padding: const EdgeInsets.all(5.0),
                  child:
                  Container(
                    color: Colors.grey[200],
                    child: Table(
                      columnWidths: {
                        0: FractionColumnWidth(0.1),
                        1: FractionColumnWidth(0.9)
                      },
                      children:<TableRow>[
                        TableRow(
                            children: [
                              Column(children: <Widget>[sideColumn(' ')],),
                              NotificationListener<ScrollNotification>(
                                onNotification:  (ScrollNotification scrollInfo) {
                                  _syncScroller.processNotification(scrollInfo, headersController);
                                },
                                child: SingleChildScrollView(
                                  controller: headersController,
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          staffNames('Khan',Colors.redAccent,Colors.black),
                                          staffNames('Hemanth',Colors.redAccent,Colors.black),
                                          staffNames('Ramesh',Colors.redAccent,Colors.black),
                                          staffNames('Mahesh',Colors.redAccent,Colors.black),
                                          staffNames('Karthik',Colors.redAccent,Colors.black)
                                          // table header items
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]
                        )
                      ] ,
                    ),
                  ),
//                )
            ) ,
          ],
        ),
    );
  }

  Padding dataCells() {
    return Padding(
                   padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.greenAccent,
                                      height:75,width:100,child: Center(child: Text('10'))),
                                );
  }

  Padding staffName(String staffName) {
    return Padding(
                                padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                                child: Container(
                                  height: 75,
                                    width: 100,
//                                    color: Colors.amber,
                                    child: Center(child: Text(staffName))),
                              );
  }
  Padding staffNames(String staffName,Color colour,Color textcolor) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
      child: Container(
          height: 75,
          width: 100,
          color: colour,
          child: Center(child: Text(staffName,style: TextStyle(color:textcolor),))),
    );
  }

  Padding sideColumn(String number) {
    return Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                        child: Container(
                          height: 75,
                            child: Center(child: Text(number))),
                      );
  }
}
class SyncScrollController {
  List<ScrollController> _registeredScrollControllers = new List<ScrollController>();

  ScrollController _scrollingController;
  bool _scrollingActive = false;

  SyncScrollController(List<ScrollController> controllers) {
    controllers.forEach((controller) => registerScrollController(controller));
  }

  void registerScrollController(ScrollController controller) {
    _registeredScrollControllers.add(controller);
  }

  void processNotification(ScrollNotification notification, ScrollController sender) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = sender;
      _scrollingActive = true;
      return;
    }

    if (identical(sender, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return;
      }

      if (notification is ScrollUpdateNotification) {
        _registeredScrollControllers.forEach((controller) => {if (!identical(_scrollingController, controller)) controller..jumpTo(_scrollingController.offset)});
        return;
      }
    }
  }
}