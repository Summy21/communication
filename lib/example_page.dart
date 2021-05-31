import 'package:communication_project/communication_page.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  void initState() {
    textEditingController1.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Example page'),
        ),
        body: Column(
          children: [
            CommunicationComponent(
              value1: 'Nombre',
              background: Colors.green,
              controller: textEditingController1,
            ),
            CommunicationComponent(
              value1: 'Apellido',
              background: Colors.amberAccent,
              controller: textEditingController2,
              changeValue: true,
            ),
          ],
        ));
  }
}
