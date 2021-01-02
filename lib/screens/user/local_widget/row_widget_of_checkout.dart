import 'package:flutter/material.dart';

class RowWidgetOfCheckout extends StatelessWidget {
  final String title;
  final String value;

  const RowWidgetOfCheckout({Key key, this.title, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.grey)),
      trailing: Text(value,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.grey)),
    );
  }
}
