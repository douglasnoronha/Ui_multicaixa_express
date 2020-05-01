import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/chart_percentagem.dart';
import 'package:ui_multicaixa/src/utils/function_global.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';
import '../../utils/consts.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  int index = 0;
  void onChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  int _indexTab = 0;
  void onTap(int index) {
    setState(() {
      _indexTab = index;
    });
  }

 

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
                        gradient: StringGlobal.currentIndex == 0 ? gradientStandard : null,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15))),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Dorivaldo dos Santos",
                            style: TextStyle(
                                fontFamily: FONT_NORMAL,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Icon(
                            Icons.notifications,
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
                      children: <Widget>[
                        Expanded(
                            child: PageView(
                          onPageChanged: onChanged,
                          children: <Widget>[
                            ChartPercetagem(
                              color: colorMain,
                              value: 40,
                              money: "300.000",
                            ),
                            ChartPercetagem(
                              color: colorMain,
                              value: 70,
                              money: "700.000",
                            ),
                            ChartPercetagem(
                              color: colorMain,
                              value: 20,
                              money: "150.000",
                            )
                          ],
                        )),
                        Container(
                          // height: 10,
                          margin: EdgeInsets.only(bottom: 10),
                          width: size.width,
                          color: Colors.transparent,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  3,
                                  (index) => SharedWidget.indicators(
                                      status: index == this.index,
                                      color: colorMain))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25),
            children: <Widget>[
              Text(
                "Transações",
                style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
              ),
              Container(
                height: 40,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onTap(index),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          height: 30,
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: _indexTab == index
                                  ? colorMain.withOpacity(.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          child: Text(
                            typeTransictions(index: index),
                            style: TextStyle(
                                fontFamily: FONT_NORMAL,
                                color:
                                    _indexTab == index ? colorMain : Colors.grey),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: <Widget>[
                  Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _indexTab == 0 ? 1 : 0,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: trancoes1
                            .map((item) => SharedWidget.itemTransaction(
                                size: size, transacao: item))
                            .toList(),
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _indexTab == 1 ? 1 : 0,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: trancoes1.reversed
                            .map((item) => SharedWidget.itemTransaction(
                                size: size, transacao: item))
                            .toList(),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      );
  }
}