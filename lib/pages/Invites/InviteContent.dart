import 'package:flutter/material.dart';

class InviteContent extends StatelessWidget {
  final String id;
  final int numero;
  final String dia;
  final String hora;
  final String nome;
  final Function acceptInvite;
  final Function denyInvite;

  const InviteContent({
    Key? key,
    required this.id,
    this.numero = 0,
    this.dia = "",
    this.hora = "",
    this.nome = "",
    required this.acceptInvite,
    required this.denyInvite,
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
          Container(
            margin: EdgeInsets.only(left: 8),
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFF49CC96)),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return acceptDialog(context);
                    });
              },
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return denyDialog(context);
                    });
              },
              child: Icon(Icons.cancel_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget acceptDialog(context) {
    return AlertDialog(
      title: Text("Aceitando convite"),
      content: Text("Tem certeza que deseja confirmar presença em $nome ?"),
      actions: <Widget>[
        // define os botões na base do dialogo
        ElevatedButton(
          child: Text("Sim"),
          onPressed: () {
            acceptInvite(id);
            Navigator.of(context).pop();
            makeToast("Convite aceito com sucesso!", context);
          },
        ),
        ElevatedButton(
          child: Text("Não"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget denyDialog(context) {
    return AlertDialog(
      title: Text("Recusando convite"),
      content: Text("Tem certeza que deseja recusar presença em $nome ?"),
      actions: <Widget>[
        // define os botões na base do dialogo
        ElevatedButton(
          child: Text("Sim"),
          onPressed: () {
            denyInvite(id);
            Navigator.of(context).pop();
            makeToast("Convite recusado com sucesso!", context);
          },
        ),
        ElevatedButton(
          child: Text("Não"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void makeToast(text, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
