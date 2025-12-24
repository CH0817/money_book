import 'dart:developer';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    Decimal todayTotalCost = Decimal.parse('0.00');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('自用記帳本'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month),
              tooltip: '開啟行事曆',
              onPressed: () {
                // FIXME 顯示月曆供選擇
              },
            ),
            // 如果需要更多按鈕，可以直接往後加，它們會自動對齊右側
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            // FIXME 增加事件
            NavigationDestination(icon: Icon(Icons.home), label: '首頁'),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outlined),
              label: '新增',
            ),
            NavigationDestination(icon: Icon(Icons.settings), label: '設定'),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                // FIXME 改文字
                child: Text('選單標頭', style: TextStyle(color: Colors.white)),
              ),
              // FIXME 調整選單內容
              ListTile(
                leading: Icon(Icons.home),
                title: Text('首頁'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('設定'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity, // 強制寬度填滿螢幕
            height: double.infinity, // 強制高度填滿螢幕
            child: Column(
              children: [
                Container(
                  height: 80,
                  color: Colors.grey[400],
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.chevron_left, size: 70.0),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            // FIXME 點了返回當日
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '總共花費 ',
                                  style: TextStyle(fontSize: 16),
                                  children: <TextSpan>[
                                    // FIXME 當日收支
                                    TextSpan(
                                      text: todayTotalCost.toStringAsFixed(2),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 元',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.chevron_right, size: 70.0),
                      ),
                    ],
                  ),
                ),
                // 如果想讓某個元件把剩下的空間推開，在這裡用 Expanded
                // FIXME 收支清單
                Expanded(child: Center(child: Text("我佔據了中間所有空間"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
