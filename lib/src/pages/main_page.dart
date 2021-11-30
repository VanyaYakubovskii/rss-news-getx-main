import 'package:flutter/material.dart';
import 'package:flutter_rss_lecture/src/api/news_api.dart';

import 'last_news_page.dart';
import 'last_news24_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectIndex = 0;
  late Widget bodyWidget;

  @override
  void initState() {
    super.initState();
    onItemTepped(0);
  }

  void onItemTepped(int index) {
    setState(() {
      selectIndex = index;
      bodyWidget = buildCurrentWidget(index);
    });
  }

  Widget buildCurrentWidget(int type) {
    switch (type) {
      case 0:
        return LastNewsPage(
          newsProvider: LentaLastNewsProvider(),
        );
      case 1:
        return LastNews24Page(
          newsProvider: LentaLastNews24Provider(),
        );
      default:
        throw ArgumentError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Новости с Lenta.ru',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        selectedItemColor: Colors.green[900],
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books), label: 'Карточки')
        ],
      ),
    );
  }
}
