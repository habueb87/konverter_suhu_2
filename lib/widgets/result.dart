import 'package:flutter/material.dart';

class ResultKonversi extends StatelessWidget {
  const ResultKonversi({
    Key? key,
    required double result,
  })  : _result = result,
        super(key: key);

  final double _result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Hasil",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          "$_result",
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
