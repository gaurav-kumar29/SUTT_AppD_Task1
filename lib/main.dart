import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tip Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tip Calcuator"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: 'Enter the Amount'
              ),
              controller: _textController,
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text("Next"),
              onPressed: () {
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new NextPage(value: _textController.text),
                );
                Navigator.of(context).push(route);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;


  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  var _textController1 = new TextEditingController();
  var _textController2 = new TextEditingController();
  var _textController3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tip Calculator"),
      ),
      body: new ListView(
        children: <Widget>[
          new Text("The Amount is:"),
          new Text("${widget.value}"),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: 'Enter the percentage of Tip'
              ),
              controller: _textController1,
              onChanged: (value) {
                calculate();
              },
            ),
          ),
          new Text("Tip Amount:"),
          AbsorbPointer(
            child: TextField(
              controller: _textController2,
              keyboardType: TextInputType.number,
            ),
          ),
          new Text("Total Amount:"),
          AbsorbPointer(
            child: TextField(
              controller: _textController3,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }


  void calculate() {
    final firstValue = double.parse(widget.value);
    final secondValue = double.parse(_textController1.text);
    _textController2.text = (firstValue * (secondValue/100)).toString();
    _textController3.text = ((firstValue * (secondValue/100))+firstValue).toString();
  }

}

