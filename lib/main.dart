import 'package:calculadora_flutter/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  String _history = "";
  String _expression = "";

  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void allClear(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 14, 17, 21),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 150, 145, 145),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "AC",
                    callback: allClear,
                    textSize: 15,
                    bgcolor: 0xFF00BF45,
                  ),
                  CalcButton(
                    text: "C",
                    callback: clear,
                    textSize: 20,
                    bgcolor: 0xffE3303A,
                  ),
                  CalcButton(
                    text: "0",
                    
                    callback: numClick,
                    textSize: 23,
                  ),
                  CalcButton(
                   
                    text: "/",
                    callback: numClick,
                    textSize: 23,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "*",
                    callback: numClick,
                    textSize: 26,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numClick,
                    textSize: 26,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numClick,
                    textSize: 26,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "%",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluate,
                    textSize: 26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
