import 'package:flutter/material.dart';
import 'package:flutter_widgets/dynamic_wraped_widgets/dynamic_wrapped_widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets Library"),
      ),
      body: ListView(
        children: [
          tileBldr(
            context,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DynamicWrappedWidget()));
            },
            title: "Dynamic Wrapped Widgets",
          ),
        ],
      ),
    );
  }
}

// tile helper
Widget tileBldr(BuildContext context, {String title, Function onTap}) =>
    ListTile(
      onTap: onTap,
      title: Text(title ?? "data title"),
    );
