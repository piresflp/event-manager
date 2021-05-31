import 'package:Even7/pages/EventDetails/EventDetailsPage.dart';
import 'package:flutter/material.dart';

class EventContent extends StatelessWidget {
  final String id;
  final int numero;
  final String dia;
  final String hora;
  final String nome;

  const EventContent({
    Key? key,
    this.id = "",
    this.numero = 0,
    this.dia = "",
    this.hora = "",
    this.nome = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(numero.toString(),
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF0D1333).withOpacity(.5),
                fontWeight: FontWeight.bold,
              )),
          SizedBox(width: 20),
          Container(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "$dia - $hora\n",
                  style: TextStyle(
                      color: Color(0xFF0D1333).withOpacity(.5), fontSize: 18)),
              TextSpan(
                  text: nome,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0D1333),
                      fontWeight: FontWeight.w600,
                      height: 1.5))
            ])),
          ),
          Spacer(),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventDetailsPage(id)));
            },
            child: new Container(
              margin: EdgeInsets.only(left: 8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF49CC96)),
              child: Icon(Icons.search, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
