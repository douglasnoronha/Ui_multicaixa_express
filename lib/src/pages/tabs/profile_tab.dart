import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      Container(
        height: size.height / 1.8,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height / 2.4,
                width: size.width,
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: colorMain,
                    gradient: StringGlobal.currentIndex == 0
                        ? gradientStandard
                        : null,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15))),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Perfil",
                        style: TextStyle(
                            fontFamily: FONT_NORMAL,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: size.height / 2.3,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          blurRadius: 14,
                          offset: Offset(0.0, 5.0))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: colorMain, width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(ME), fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Dorivaldo Vicente dos Santos",
                      style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "dorivaldodossantos2000@gmail.com",
                      style: TextStyle(
                        fontFamily: FONT_NORMAL,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            "assets/badge1.png",
                            height: 35,
                          ),
                          Image.asset(
                            "assets/badge2.png",
                            height: 35,
                          ),
                          Image.asset(
                            "assets/badge3.png",
                            height: 35,
                          ),
                          Image.asset(
                            "assets/badge4.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 25,
      ),
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Text("GERAL", style: TextStyle(
            fontFamily: FONT_BOLD,
            color: colorMain
          ),),
          SizedBox(
            height: 10,
          ),
          SharedWidget.itemProfile(
            size: size,
            title: "Definições do Perfil",
            description: "Atualiza o seu perfil.",
            icon: Icons.settings
          ),

          SharedWidget.itemProfile(
            size: size,
            title: "Privacidade",
            description: "Mudar Palavra-passe.",
            icon: Icons.lock
          ),

          SharedWidget.itemProfile(
            size: size,
            title: "Notificações",
            description: "Mudar suas definições de notifacação.",
            icon: Icons.notifications
          )
        ],
      )
    ]);
  }
}
