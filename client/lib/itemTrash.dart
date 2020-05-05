import 'package:flutter/material.dart';


class ListItemTrash extends StatelessWidget {
  ListItemTrash(this.snapshot, this.columnProps);
  final snapshot;
  final columnProps;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => () {
                    print("TAP");
                  }()));
        },
        child: new Container(
          child: Text("111"),
        ));
  }
}
