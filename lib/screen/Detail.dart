import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starwars/content/helper.dart';
import 'package:starwars/suplemental/content_card.dart';
import 'package:starwars/suplemental/loading.dart';

import '../content/style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLoading = true;
  List _data = [];
  String _title = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getData());
  }

  void _getData() async {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    setState(() {
      _title = args.title;
    });
    _hitData(args.data).then((value) async {
      setState(() {
        _data = value;
        _isLoading = false;
      });
    });
  }

  Future<List> _hitData(data) async {
    List resData = [];
    data.forEach((e) async {
      var res = await Dio().get(e);
      var data = res.data;
      setState(() {
        resData.add(data);
      });
    });
    return resData;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
          automaticallyImplyLeading: true,
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
                        title: e['name'],
                      );
                    }).toList(),
                  ),
                ),
        ),
      ),
    );
  }
}
