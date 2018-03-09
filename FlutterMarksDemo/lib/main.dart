import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Marks",
      home: new MarksScreen(),
    );
  }
}
class MarksScreen extends StatefulWidget {
  @override
  State createState() => new MarksScreenState();
}


class MarksScreenState extends State<MarksScreen> {

  double physicsMarks = 0.0;
  double chemistryMarks = 0.0;
  double mathsMarks = 0.0;
  double ans = 0.0;

  final TextEditingController _textControllerPhy = new TextEditingController();
  final TextEditingController _textControllerChe = new TextEditingController();
  final TextEditingController _textControllerMat = new TextEditingController();

  Widget _buildTextComposer(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _textControllerPhy,
          keyboardType: TextInputType.number,
            decoration: new InputDecoration(
            hintText: 'Enter Physics Marks :',
          ),
        ),new TextField(
          controller: _textControllerChe,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Enter Chemistry Marks :',
          ),
        ),new TextField(
          controller: _textControllerMat,
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: 'Enter Maths Marks :',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            _setMarks(context);
            ans=0.0;
          },
          child: new Text('Calculate '),
        ),
      ],
    );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Marks Demo")
      ),
        body: new Builder(
          // Create an inner BuildContext so that the snackBar onPressed methods
          // can refer to the Scaffold with Scaffold.of().
            builder: _buildTextComposer
        )
    );
  }

  void _setMarks(BuildContext context) {
    if(_textControllerPhy.text.isEmpty || _textControllerChe.text.isEmpty || _textControllerMat.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('All fields required')));
    }else {
      physicsMarks = double.parse(_textControllerPhy.text);
      _textControllerPhy.clear();
      print(physicsMarks);

      chemistryMarks = double.parse(_textControllerChe.text);
      _textControllerChe.clear();
      print(chemistryMarks);

      mathsMarks = double.parse(_textControllerMat.text);
      _textControllerMat.clear();
      print(mathsMarks);

      ans = mathsMarks + physicsMarks + chemistryMarks;
      ans = ans * 100 / 300.00;
      debugPrint(" ans is " + ans.toString());
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Your Result is :'),
          content: new Text(ans.toStringAsFixed(2)+" %"),
        ),
      );
    }
  }
}