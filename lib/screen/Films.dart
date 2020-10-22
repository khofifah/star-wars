import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starwars/content/helper.dart';
import 'package:starwars/suplemental/content_card.dart';
import 'package:starwars/suplemental/loading.dart';

import '../content/style.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  bool _isLoading;
  List _data;

  @override
  void initState() {
    _isLoading = true;
    _data = [];
    _getData();
    super.initState();
  }

  void _getData() async {
    setState(() {
      _isLoading = true;
    });
    var url = '$apiUrl/films';
    var detail = await Dio().get(url);
    var dataList = detail.data['results'];

    setState(() {
      _data = dataList;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Star Wars'),
          centerTitle: true,
        ),
        body: Container(
          color: bgColor,
          height: height,
          width: width,
          child: _isLoading == true
              ? Center(
                  child: Loading(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: _data.map((e) {
                      return ContentCard(
                        title: e['title'],
                        desc: e['director'],
                        characters: e['characters'],
                        planets: e['planets'],
                        species: e['species'],
                        starships: e['starships'],
                        vehicles: e['vehicles'],
                        isFilms: true,
                      );
                    }).toList(),
                  ),
                ),
        ),
      ),
    );
  }
}
