import 'package:communication_project/example_page.dart';
import 'package:communication_project/scope_model/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Recibir la pagina',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CommunicationComponent(
        value1: 'Apellido',
        background: Colors.amberAccent,
        controller: textEditingController2,
        changeValue: true,
        affirmativeText: 'SI',
        negativeText: 'NO',
      ),
    );
  }
}

class CommunicationComponent extends StatefulWidget {
  final String value1;
  final Color background;
  final String negativeText;
  final String affirmativeText;
  final Function onTap;
  TextEditingController controller;
  final bool changeValue;

  CommunicationComponent(
      {this.value1,
      this.background,
      this.negativeText,
      this.affirmativeText,
      this.onTap,
      this.controller,
      this.changeValue = false,
      Key key})
      : super(key: key);

  @override
  _CommunicationComponentState createState() => _CommunicationComponentState();
}

class _CommunicationComponentState extends State<CommunicationComponent> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _assignController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              style: TextStyle(
                color: widget.background,
                fontSize: 17.0,
              ),
              decoration: InputDecoration(
                labelText: widget.value1,
                filled: false,
                labelStyle: TextStyle(
                  color: widget.background,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.background,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54)),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54)),
              ),
              controller: widget.controller,
              onChanged: (String value) {
                setState(() {
                  widget.controller.text = value;
                  if (widget.changeValue) {
                    widget.controller.text =
                        '${widget.controller.text} valor editado';
                  }
                  print('widget.controller.text:: ${widget.controller.text}');
                });
              },
            ),
          ),
        ),
        onTap: () async {
          print('controlador:: ${widget.controller}');
          print('controlador text:: ${widget.controller.text}');
          if (widget.controller.text != null && widget.controller.text != '') {
            _showDialog(widget.controller.text);
          }
        });
  }

  void _assignController() {
    if (widget.controller == null) {
      print('** 1 **');
      _textEditingController = TextEditingController();
      widget.controller = _textEditingController;
    } else {
      print('** 2 **');
      _textEditingController = widget.controller;
    }
    _textEditingController.addListener(() {
      var currentText = _textEditingController.text;
      print('currentText:: $currentText');
    });
  }

  void onTap() {
    if (widget.onTap != null) {
      widget.onTap();
    }
  }

  Future<void> _showDialog(String text) {
    final defaultTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).accentColor,
    );
    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text('Datos'),
        content: RichText(
          text: TextSpan(
            text: 'Obteniendo ${widget.value1}: ',
            style: TextStyle(color: Theme.of(context).textTheme.button.color),
            children: [
              TextSpan(
                text: widget.controller.text,
                style: defaultTextStyle,
              ),
            ],
          ),
        ),
        actions: _getActionButtons(widget.controller.text),
      ),
    );
  }

  List<Widget> _getActionButtons(String pastedText) {
    var resultList = <Widget>[];
    resultList.addAll([
      FlatButton(
        child: Text(widget.negativeText ?? 'Cancelar'),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
      FlatButton(
        child: Text(widget.affirmativeText ?? 'Aceptar'),
        onPressed: () {
          // _textEditingController.text = pastedText;
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    ]);
    return resultList;
  }
}
