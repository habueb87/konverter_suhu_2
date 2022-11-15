import 'package:flutter/material.dart';

class DropdownSuhu extends StatelessWidget {
  final List<String> jenisSuhu;
  final String selectedSuhu;
  final Function setSelectedSuhu;

  const DropdownSuhu({
    Key? key,
    required this.jenisSuhu,
    required this.setSelectedSuhu,
    required this.selectedSuhu
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      items: jenisSuhu.map((suhu) {
        return DropdownMenuItem(value: suhu, child: Text(suhu));
      }).toList(),
      value: selectedSuhu,
      onChanged: (value) {
        setSelectedSuhu(value.toString());
      },
    );
  }
}
