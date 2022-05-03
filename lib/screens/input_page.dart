import 'package:flutter/material.dart';
import 'package:calculator/components/button.dart';
import 'dart:math';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _globalkey = GlobalKey<FormState>();
  String firstValue = "";
  String secondValue = "";
  String _history = "";
  String _expression = "";
  String _operation = "";

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
      firstValue = '';
      secondValue = '';
      _operation = '';
    });
  }

  void operationSign(String text) {
    setState(() {
      _operation = text;
      _history = "";
      firstValue = _expression;
      _expression = "";
    });
  }

  void evaluate(String text) {
    print("hello");
    if (_operation == "") {
      print('yellow');
    } else if (_operation == "+") {
      setState(() {
        secondValue = _expression;
        _expression =
            (double.parse(firstValue) + double.parse(secondValue)).toString();
        _history = _expression;
      });
    } else if (_operation == "-") {
      setState(() {
        secondValue = _expression;

        _expression =
            (double.parse(firstValue) - double.parse(secondValue)).toString();
        _history = _expression;
      });
    } else if (_operation == "/") {
      setState(() {
        secondValue = _expression;

        _expression =
            (double.parse(firstValue) / double.parse(secondValue)).toString();
        _history = _expression;
      });
    } else if (_operation == "*") {
      setState(() {
        secondValue = _expression;

        _expression =
            (double.parse(firstValue) * double.parse(secondValue)).toString();
        _history = _expression;
      });
    } else if (_operation == "%") {
      setState(() {
        secondValue = _expression;

        _expression =
            (double.parse(firstValue).remainder(double.parse(secondValue)))
                .toString();
        _history = _expression;
      });
    } else if (_operation == "^") {
      setState(() {
        secondValue = _expression;

        _expression =
            "${(pow(double.parse(firstValue), double.parse(secondValue)))}";
        _history = _expression;
      });
    } else {
      print('error');
    }
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
      _history += text;
    });
    print(_expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF03080D),
      body: SafeArea(
        child: Form(
          key: _globalkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(161, 121, 121, 121),
                  border: Border.all(
                      color: Color.fromARGB(255, 88, 87, 87), width: 5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: const TextStyle(
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: <Widget>[
                    CalcBtn(
                      text: 'AC',
                      callback: allClear,
                      fillColor: 0XFF9FBFDA,
                    ),
                    CalcBtn(
                      text: 'C',
                      callback: allClear,
                      fillColor: 0XFF9FBFDA,
                    ),
                    CalcBtn(
                      text: '^',
                      callback: operationSign,
                      fillColor: 0XFF9FBFDA,
                    ),
                    CalcBtn(
                      text: '%',
                      callback: operationSign,
                      fillColor: 0XFFF7B701,
                    ),
                    CalcBtn(
                      text: '7',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '8',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '9',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '/',
                      callback: operationSign,
                      fillColor: 0XFFF7B701,
                    ),
                    CalcBtn(
                      text: '4',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '5',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '6',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '*',
                      callback: operationSign,
                      fillColor: 0XFFF7B701,
                    ),
                    CalcBtn(
                      text: '1',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '2',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '3',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '+',
                      callback: operationSign,
                      fillColor: 0XFFF7B701,
                    ),
                    CalcBtn(
                      text: '0',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '3',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '.',
                      callback: numClick,
                    ),
                    CalcBtn(
                      text: '=',
                      callback: evaluate,
                      fillColor: 0XFFF7B701,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
