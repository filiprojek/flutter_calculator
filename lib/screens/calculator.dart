import 'package:flutter/material.dart';
import '../widgets/one_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreen createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  String _displayValue = "0";

  @override
  Widget build(BuildContext context) {
    void onPressed(String? value) {
      if (value == null) {
        const snackdemo = SnackBar(
          content: Text(
            'Something went wrong!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        return;
      }

      print(value);

      if (_displayValue == "0") {
        setState(() {
          _displayValue = value;
        });
        return;
      }

      if (value == "del") {
        setState(() {
          _displayValue = _displayValue.substring(0, _displayValue.length - 1);
        });
        return;
      }

      if (value == "=") {
        List operators = ["+", "-", "/", "X"];
        List calcValue = [];
        int last = -1;
        for (int i = 0; i < _displayValue.length; i++) {
          print('found ' + _displayValue[i]);
          if (operators.asMap().containsValue(_displayValue[i])) {
            calcValue.add(_displayValue.substring(last + 1, i));
            calcValue.add(_displayValue[i]);
            last = i;
          }
        }

        calcValue.add(_displayValue.substring(last + 1, _displayValue.length));
        print(calcValue);
        return;
      }

      setState(() {
        _displayValue += value;
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      _displayValue,
                      style: TextStyle(fontSize: 32.0),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              //childAspectRatio: (1 / 1),
              children: [
                OneButton(value: "7", onPressed: onPressed),
                OneButton(value: "8", onPressed: onPressed),
                OneButton(value: "9", onPressed: onPressed),
                OneButton(value: "/", onPressed: onPressed),
                OneButton(
                  value: "del",
                  icon: Icons.arrow_back_rounded,
                  iconColor: Colors.red,
                  onPressed: onPressed,
                ),
                OneButton(value: "4", onPressed: onPressed),
                OneButton(value: "5", onPressed: onPressed),
                OneButton(value: "6", onPressed: onPressed),
                OneButton(value: "X", onPressed: onPressed),
                SizedBox(),
                OneButton(value: "1", onPressed: onPressed),
                OneButton(value: "2", onPressed: onPressed),
                OneButton(value: "3", onPressed: onPressed),
                OneButton(value: "-", onPressed: onPressed),
                SizedBox(),
                OneButton(value: ".", onPressed: onPressed),
                OneButton(value: "0", onPressed: onPressed),
                SizedBox(),
                OneButton(value: "+", onPressed: onPressed),
                OneButton(value: "=", onPressed: onPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
