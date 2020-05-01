import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';

class PagamentoTab extends StatefulWidget {
  @override
  _PagamentoTabState createState() => _PagamentoTabState();
}

class _PagamentoTabState extends State<PagamentoTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: size.height / 3,
          width: size.width,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
              color: colorMain,
              gradient:
                  StringGlobal.currentIndex == 0 ? gradientStandard : null,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pagamento",
                style: TextStyle(
                    fontFamily: FONT_BOLD, color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  style: TextStyle(fontFamily: FONT_NORMAL),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Pesquise opções de pagamento"),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SharedWidget.itemPagamento(
                img: ENERGIA,
                text: "Energia"
              ),

              SharedWidget.itemPagamento(
                img: AGUA,
                text: "Água"
              ),

              SharedWidget.itemPagamento(
                img: INTERNET,
                text: "Internet"
              ),

              SharedWidget.itemPagamento(
                img: OUTROS,
                text: "Outros"
              )
            ],
          ),
        ),

        Column(
          children: pagamentos.map(SharedWidget.cardPagaemtno).toList(),
        )
      ],
    );
  }
}
