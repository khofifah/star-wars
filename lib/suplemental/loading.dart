import 'package:flutter/material.dart';
import 'package:starwars/content/style.dart';

class Loading extends StatelessWidget {
  Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Center(
      child: SizedBox(
        height: width * 0.1,
        width: width * 0.1,
        child: CircularProgressIndicator(
          strokeWidth: width * 0.005,
          valueColor: AlwaysStoppedAnimation<Color>(
            mainColor,
          ),
        ),
      ),
    );
  }
}
