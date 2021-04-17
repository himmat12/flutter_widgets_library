import 'package:flutter/material.dart';

class DynamicWrappedWidget extends StatefulWidget {
  @override
  _DynamicWrappedWidgetState createState() => _DynamicWrappedWidgetState();
}

class _DynamicWrappedWidgetState extends State<DynamicWrappedWidget> {
  final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Wrapped Widgets"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // input field
            TextField(
              controller: _input,
              onEditingComplete: () {
                if (_input.text.isNotEmpty) {
                  setState(() {
                    intrests.add(_input.text);
                    _input.clear();
                  });
                }

                print(intrests);
              },
              decoration: InputDecoration(
                hintText: "enter your intrests",
              ),
            ),
            SizedBox(height: 20),

            // inrests
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(14),
              ),
              child: intrests.length == 0
                  ? Text(
                      "no data",
                      style: TextStyle(color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    )
                  : Wrap(
                      runSpacing: 6,
                      spacing: 6,
                      children: List.from(intrests.map((e) => chipBuilder(
                            onTap: () {
                              setState(() {
                                intrests.remove(e);
                              });
                            },
                            title: e,
                          ))),
                    ),
            ),

            // empty list btn
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      intrests.clear();
                    });
                  },
                  child: Text(
                    "Empty List",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// intrests
List<String> intrests = [];

// chips helper
Widget chipBuilder({String title, Function onTap}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue.shade400,
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.clear,
            color: Colors.blue.shade50,
            size: 20,
          ),
        ),
        SizedBox(width: 4),
        Text(
          title ?? "data",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
