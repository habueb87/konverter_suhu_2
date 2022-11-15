import 'package:flutter/material.dart';


class ButtonKonversi extends StatelessWidget {
  final Function konversi;

  const ButtonKonversi({
    Key? key,
     required this.konversi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => konversi(),
            child: const Text("Konversi Suhu"),
          ),
        ),
      ],
    );
  }
}
