import 'package:flutter/material.dart';

class newbutton extends StatelessWidget {
  double width;
  double height;
  Function function;
  String text;
  Color color;
  Color colortext;
  Color colorRaduis;

  newbutton(
      {required this.function,
      required this.height,
      required this.text,
      required this.width,
      required this.color,
      required this.colortext,
      required this.colorRaduis});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: colorRaduis, width: 2),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 73, 180, 204).withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: color),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            text,
            style: TextStyle(color: colortext),
          ),
        ),
      ),
    );
  }
} //final Widget? suffixIcon;

class Mytextform extends StatelessWidget {
  Icon prefixe;
  final Icon? sufix;
  String lable;
  bool obscur;
  Function valedat;
  TextEditingController controllerr;
  TextInputType typ;
  Function? onchandges;

  Mytextform({
    required this.lable,
    required this.obscur,
    required this.prefixe,
    required this.valedat,
    required this.controllerr,
    required this.typ,
    this.sufix,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: TextFormField(
          keyboardType: typ,
          controller: controllerr,
          validator: (value) {
            return valedat(value);
          },
          onChanged: (value) {},
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              prefixIcon: prefixe,
              labelText: lable,
              suffixIcon: sufix != null
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : Container(
                      width: 0,
                    )),
          obscureText: obscur,
        ),
      ),
    );
  }
}

class textAdd extends StatelessWidget {
  Function valedat1;
  TextEditingController controller;
  String label1;
  TextInputType typ;

  textAdd(
      {required this.valedat1,
      required this.controller,
      required this.label1,
      required this.typ});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          keyboardType: typ,
          controller: controller,
          validator: (value) {
            return valedat1(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label1,
          ),
        ),
      ),
    );
  }
}
