import 'package:communication_project/example_page.dart';
import 'package:communication_project/scope_model/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(CommunicationProyect());
}

class CommunicationProyect extends StatefulWidget {
  CommunicationProyect({Key key}) : super(key: key);

  @override
  _CommunicationProyectState createState() => _CommunicationProyectState();
}

class _CommunicationProyectState extends State<CommunicationProyect> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
        model: model,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => ExamplePage(),
          },
        ));
  }
}
