import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:piczzie/model//service_locator.dart';
import 'package:flutter/cupertino.dart';

class BaseView<T extends Model> extends StatelessWidget {

  final ScopedModelDescendantBuilder<T> _builder;

  BaseView({ScopedModelDescendantBuilder<T> builder})
      : _builder = builder;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: locator<T>(),
        child: ScopedModelDescendant<T>(
            builder: _builder));
  }
}