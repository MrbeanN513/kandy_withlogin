import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kandy/details/tvdetails.dart';
import 'package:kandy/homescreen/Drawer.dart';

import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class HINDI_DUBBED extends StatefulWidget {
  HINDI_DUBBED({Key key}) : super(key: key);

  @override
  _HINDI_DUBBEDState createState() => _HINDI_DUBBEDState();
}

class _HINDI_DUBBEDState extends State<HINDI_DUBBED> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HINDI_DUBBEDpage(),
    );
  }
}

class HINDI_DUBBEDpage extends StatefulWidget {
  HINDI_DUBBEDpage({Key key}) : super(key: key);

  @override
  _HINDI_DUBBEDpageState createState() => _HINDI_DUBBEDpageState();
}

class _HINDI_DUBBEDpageState extends State<HINDI_DUBBEDpage> {
  Future _data;
  Future getHINDI_DUBBED() async {
    var firestore = Firestore.instance;
    QuerySnapshot gh = await firestore.collection('movies').getDocuments();
    return gh.documents;
  }

  navigatetotvdetails(DocumentSnapshot tv) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Tvdetails(tv: tv)));
  }

  @override
  void initState() {
    super.initState();
    _data = getHINDI_DUBBED();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                      child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.redAccent[700]),
                  )));
            else {
              return Scaffold(
                drawer: Drawers(),
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.cast_connected,
                          color: Colors.white,
                        ),
                        onPressed: null),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null)
                  ],
                  centerTitle: true,
                  title: SizedBox(
                      height: 50.0,
                      child: Image.asset('images/Netflix-logo.png')),
                  backgroundColor: Colors.black,
                ),
                backgroundColor: Colors.black,
                body: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 900,
                                height: 160,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['aa']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['a'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['bb']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['b'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['cc']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['c'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['dd']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['d'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['ee']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['e'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () => launch(
                                            snapshot.data[index].data['ff']),
                                        child: Container(
                                          child: Image.network(
                                            snapshot.data[index].data['f'],
                                            fit: BoxFit.fill,
                                          ),
                                          width: 100.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
