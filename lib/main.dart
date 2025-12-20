import 'package:decimal/decimal.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    // 在開發環境中啟用 DevicePreview
    DevicePreview(
      // 在釋出（Release）模式下禁用 DevicePreview
      enabled: !const bool.fromEnvironment('dart.vm.product'),
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    Decimal todayTotalCost = Decimal.parse('0.00');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('自用記帳本')),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_left, size: 70.0),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(formattedDate, textAlign: TextAlign.center),
                        Text("\$$todayTotalCost", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_right, size: 70.0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 8, child: ListView(children: [Text('a')])),
            Expanded(flex: 1, child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
