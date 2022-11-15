import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(history[index]),
            );
          }),
    );
  }
}
