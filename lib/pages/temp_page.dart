import 'package:flutter/material.dart';
import '../game.dart';


class TempPage extends StatefulWidget {
  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  final _controller = TextEditingController();
  final _game = Temp();

  // state variable
  var _feedbackText = '';
  var _showTestButton = false;

  void handleClickGuess() {
    setState(() {
      _showTestButton = !_showTestButton;
    });

    print('Button clicked!');
    print(_controller.text);
    var temp = double.tryParse(_controller.text);
    if (_controller.text == null){
      // เตือนให้ใส่ค่า
      print('Please enter a value to convert. !!! $_controller');
      setState(() {
        _feedbackText = 'Please enter a value to convert.';
      });
    } else if (temp == null) {
      // แจ้ง error
      print('Input Error !!! $_controller');
      setState(() {
        _feedbackText = 'Input Error !!!';
      });
    } else {
      var result = _game.cTof(temp);
      setState(() {
        //_feedbackText = 'Please enter a value to convert.';
        _feedbackText = '$temp Celsius = $result Fahrenheit';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midterm Exam'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Temperature Converter'),
            TextField(

              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a temperature value to convert',
              ),
            ),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Celsius to Fahrenheit'),
            ),
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Celsius to Kelvin'),
            ),
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Fahrenheit to Celsius'),
            ),
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Fahrenheit to Kelvin'),
            ),
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Kelvin to Celsius'),
            ),
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Kelvin to Fahrenheit'),
            ),
            Text(_feedbackText),
          ],
        ),
      ),
    );
  }
}