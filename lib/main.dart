import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
      history = firstNum.toString() + operation.toString();
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData.dark(),
      home: Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    history,
                    style: TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    textToDisplay,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: 'AC',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: 'C',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '<',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '/',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '9',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '8',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '7',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: 'x',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '6',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '5',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '4',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '-',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '3',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '2',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '1',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '+',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '+/-',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '0',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '00',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                      CalculatorButton(
                        text: '=',
                        textColor: Colors.white,
                        callback: btnOnClick,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function callback;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: TextButton(
        child: Text(
          this.text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
        onPressed: () => callback(text),
      ),
    );
  }
}
