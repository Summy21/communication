import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  static MainModel of(BuildContext context) =>
      ScopedModel.of<MainModel>(context);
}
