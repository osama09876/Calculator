import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userinp = '0';
  String result = '0';
  String expression = '';

  calFunction(String btntxt) {
    setState(() {
      if (btntxt == 'C') {
        userinp = '0';
        result = '0';
      } else if (btntxt == '⌫') {
        userinp = userinp.substring(0, userinp.length - 1);
        if (userinp == '') {
          userinp = '0';
        }
        // userinp = userinp  btntxt;
      } else if (btntxt == '=') {
        expression = userinp;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('×', '*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (userinp == '0') {
          userinp = btntxt;
        } else {
          userinp = userinp + btntxt;
        }
      }
    });
  }

  Widget customBtn(String name, Color color) {
    return InkWell(
      onTap: () => calFunction(name),
      child: Container(
        height: 75,
        width: 75,
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2630),
      appBar: AppBar(
        backgroundColor: Color(0xFF1d2630),
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height * .1,
            width: double.infinity,
            child: Text(
              userinp,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.01,
          // ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height * .2,
            width: double.infinity,
            child: Text(
              result,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn('C', Color.fromARGB(255, 66, 65, 65)),
              SizedBox(
                width: 18,
              ),
              customBtn('÷', Color.fromARGB(255, 66, 65, 65)),
              SizedBox(
                width: 18,
              ),
              customBtn('×', Color.fromARGB(255, 66, 65, 65)),
              SizedBox(
                width: 18,
              ),
              customBtn('⌫', Colors.orange),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn('7', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('8', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('9', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('', Colors.orange),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn('4', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('5', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('6', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('-', Colors.orange),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn('1', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('2', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('3', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('+', Colors.orange),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn('%', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('0', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('.', Colors.black),
              SizedBox(
                width: 18,
              ),
              customBtn('=', Colors.orange),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
