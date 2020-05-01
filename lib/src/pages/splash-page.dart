import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/pages/home-page.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: COLOR_BFA,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientStandard
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage())
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    LOGO,
                    height: 50,
                  ),
                
                  SizedBox(width: 10,),
                  Text(
                    "Multicaixa Express",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: FONT_MULTI,
                      fontSize: 34
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}