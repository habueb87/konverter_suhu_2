import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:konverter_suhu_2/widgets/button.dart';
import 'package:konverter_suhu_2/widgets/dropdown.dart';
import 'package:konverter_suhu_2/widgets/history.dart';
import 'package:konverter_suhu_2/widgets/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Konverter Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 20;
  final _controllerCelcius = TextEditingController();
  double _inputCelcius = 0;
  double _result = 0;
  var jenisSuhu = ["Kelvin", "Reamur"];
  var selectedSuhu = "Kelvin";
  List<String> history = <String>[];

  setSelectedSuhu(String value) {
    setState(() {
      selectedSuhu = value.toString();
    });
  }

  konverterSuhu() {
    setState(() {
      if (_controllerCelcius.text.isNotEmpty) {
        _inputCelcius = double.parse(_controllerCelcius.text);
        if (selectedSuhu == "Kelvin") {
          _result = _inputCelcius + 273;
        }
        if (selectedSuhu == "Reamur") {
          _result = _inputCelcius * 0.8;
        }

        history.add("$selectedSuhu : $_result");
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controllerCelcius.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  _controllerCelcius.text = _currentSliderValue.toString();
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: ("Masukkan Suhu Dalam Celcius"), //hint text
              ),
              keyboardType: TextInputType.number,
              controller: _controllerCelcius,
            ),
            DropdownSuhu(
                jenisSuhu: jenisSuhu,
                selectedSuhu: selectedSuhu,
                setSelectedSuhu: setSelectedSuhu),
            ResultKonversi(
              result: _result,
            ),
            ButtonKonversi(konversi: konverterSuhu),
            const Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            History(history: history)
          ],
        ),
      ),
    );
  }
}
