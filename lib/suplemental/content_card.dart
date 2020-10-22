import 'package:flutter/material.dart';
import 'package:starwars/content/helper.dart';
import 'package:starwars/content/style.dart';

class ContentCard extends StatelessWidget {
  final String title, desc;
  final List characters, planets, starships, vehicles, species;
  final bool isFilms;

  ContentCard({
    Key key,
    @required this.title,
    this.desc,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.isFilms = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ),
          isFilms == false
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: width,
                  child: Text(
                    desc,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
          isFilms == false
              ? Container()
              : Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: ScreenArguments('Characters', characters),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.people,
                                color: mainColor,
                              ),
                              Text(
                                'characters',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: ScreenArguments('Planets', planets),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.filter_hdr,
                                color: mainColor,
                              ),
                              Text(
                                'planets',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: ScreenArguments('Starships', starships),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.flight,
                                color: mainColor,
                              ),
                              Text(
                                'starships',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: ScreenArguments('Vehicles', vehicles),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.directions_bike,
                                color: mainColor,
                              ),
                              Text(
                                'vehicles',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: ScreenArguments('Species', species),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.pets,
                                color: mainColor,
                              ),
                              Text(
                                'species',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
