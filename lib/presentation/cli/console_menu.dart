import 'dart:io';
import '../../application/use_cases/add_bookmark_use_case.dart';
import '../../application/use_cases/get_bookmarks_use_case.dart';
import '../../application/use_cases/get_news_use_case.dart';
import '../../domain/entities/news_item.dart';

// консольне меню - тільки спілкування з користувачем
class ConsoleMenu {
  final GetNewsUseCase getNews;
  final AddBookmarkUseCase addBookmark;
  final GetBookmarksUseCase getBookmarks;

  ConsoleMenu(this.getNews, this.addBookmark, this.getBookmarks);

  void run() {
    print('Ласкаво просимо до застосунку новин!');
    bool working = true;

    while (working) {
      print('');
      print('=== Новини ===');
      print('1 - Усі новини');
      print('2 - Новини: Спорт');
      print('3 - Новини: Технології');
      print('4 - Додати в закладки');
      print('5 - Мої закладки');
      print('0 - Вихід');
      stdout.write('Ваш вибір: ');
      String? choice = stdin.readLineSync();

      if (choice == '1') {
        _show(getNews.execute('Всі'));
      } else if (choice == '2') {
        _show(getNews.execute('Спорт'));
      } else if (choice == '3') {
        _show(getNews.execute('Технології'));
      } else if (choice == '4') {
        stdout.write('Введіть номер новини: ');
        String? text = stdin.readLineSync();
        int? id = int.tryParse(text ?? '');
        if (id == null) {
          print('Некоректний номер');
        } else {
          addBookmark.execute(id);
          print('Додано в закладки');
        }
      } else if (choice == '5') {
        _show(getBookmarks.execute());
      } else if (choice == '0') {
        working = false;
      } else {
        print('Невідома команда');
      }
    }
  }

  void _show(List<NewsItem> items) {
    if (items.isEmpty) {
      print('Список порожній');
    }
    for (NewsItem item in items) {
      print(item);
    }
  }
}