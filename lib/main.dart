import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const fontSize = 42.0;

const fontDotGothic16 = 'DotGothic16';
const fontNotoSansJP = 'NotoSansJP';
const fontKiwiMaru = 'KiwiMaru';
const fontDelaGothicOne = 'DelaGothicOne';

const fontList = [
  fontNotoSansJP,
  fontDotGothic16,
  fontKiwiMaru,
  fontDelaGothicOne
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: fontNotoSansJP),
      home: const MyHomePage(title: 'Flutter Custom Font Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedFontFamily = fontNotoSansJP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Flutterのカスタムフォントを試しています。Google Fontsをかんたんに取り込めるのはいいですね！',
                style: TextStyle(
                  fontFamily: selectedFontFamily,
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              // const DropDownButton(),
              DropdownButton(
                value: selectedFontFamily,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: fontSize,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    debugPrint(newValue);
                    selectedFontFamily = newValue!;
                    debugPrint(selectedFontFamily);
                  });
                },
                items: fontList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                // onChanged: (text) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
