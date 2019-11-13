import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Fonts',
      home: StarWarsData(),
    ));

class StarWarsData extends StatefulWidget {
  @override
  _StarWarsDataState createState() => _StarWarsDataState();
}

class _StarWarsDataState extends State<StarWarsData> {
  final String url = 'https://swapi.co/api/starships';
  List data;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
    });

    return 'Success!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Star Wars Starships',
          style: TextStyle(
            color: Colors.amberAccent,
            fontFamily: 'PatuaOne',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    color: Colors.black,
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text('Name: ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.lightBlue,
                                )),
                            Text(
                              data[index]['name'],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Card(
                    color: Colors.black,
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Model: ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.amberAccent,
                              ),
                            ),
                            Text(
                              data[index]['model'],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.amberAccent,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Card(
                    color: Colors.black,
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Starship Class: ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.amberAccent,
                              ),
                            ),
                            Text(
                              data[index]['starship_class'],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.amberAccent,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getSWData();
  }
}
