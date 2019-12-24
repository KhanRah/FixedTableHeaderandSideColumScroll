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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  ScrollController headersController;
  ScrollController calendarHeader;
  ScrollController staffController;
  SyncScrollController _syncScroller;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headersController=new ScrollController();
    staffController=new ScrollController();
    calendarHeader=new ScrollController();

    _syncScroller = new SyncScrollController([headersController , staffController,]);

    calendarHeader.addListener(_scrollListener);
//    headersController.addListener(_scrollheaderListener);

  }

  _scrollListener() {
    print('pixel Position ${calendarHeader.offset}');
//    headersController.jumpTo(staffController.offset);
  }
  _scrollheaderListener() {
    print('pixel Position ${headersController.offset}');
    staffController.jumpTo(headersController.offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(10.0),child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Text('Store Name'),Text('Filter')],),),
              Expanded(
                child: Container(
                  padding:EdgeInsets.all(10.0),
                  child: NotificationListener(
//                    onNotification: (ScrollNotification scrollInfo) {
//                      _syncScroller.processNotification(scrollInfo, calendarHeader);
//                    },
                    child: CustomScrollView(
                      controller:calendarHeader ,
                      slivers: <Widget>[
                      SliverToBoxAdapter(child:Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Container(color:Colors.blue,height:30,child: Text('Month')),Text('Daily')],) ,),
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
        )
    );
  }

   completeCalendar() {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Stack(
          children: <Widget>[
            Container(
//              height: 1200,
              child: Column(
//              shrinkWrap: true,
//              padding: EdgeInsets.all(5.0),
                children: <Widget>[
                  Container(
                    color: Colors.redAccent,
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
                                          staffNames('Khan'),
                                          staffNames('Hemanth'),
                                          staffNames('Ramesh'),
                                          staffNames('Mahesh'),
                                          staffNames('Karthik')
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
  Padding staffNames(String staffName) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
      child: Container(
          height: 75,
          width: 100,
          color: Colors.pink,
          child: Center(child: Text(staffName))),
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