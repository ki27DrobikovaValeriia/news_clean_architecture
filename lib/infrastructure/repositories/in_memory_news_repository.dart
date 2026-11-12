import '../../domain/entities/news_item.dart';
import '../../domain/interfaces/news_repository.dart';

// сховище новин у пам'яті (реалізація інтерфейсу з Domain)
class InMemoryNewsRepository implements NewsRepository {
  final List<NewsItem> _news = [
    NewsItem(1, 'Збірна України виграла важливий матч', 'Спорт', '10 хв тому'),
    NewsItem(2, 'Вийшов новий смартфон з потужною камерою', 'Технології', '1 год тому'),
    NewsItem(3, 'Відомий футболіст підписав новий контракт', 'Спорт', '2 год тому'),
    NewsItem(4, 'Штучний інтелект навчився писати код', 'Технології', '3 год тому'),
    NewsItem(5, 'Чемпіонат з баскетболу стартує на вихідних', 'Спорт', '5 год тому'),
  ];

  final List<int> _bookmarkedIds = [];

  @override
  List<NewsItem> getAll() {
    return _news;
  }

  @override
  List<NewsItem> getByCategory(String category) {
    List<NewsItem> result = [];
    for (NewsItem item in _news) {
      if (item.category == category) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  List<NewsItem> getBookmarked() {
    List<NewsItem> result = [];
    for (NewsItem item in _news) {
      if (_bookmarkedIds.contains(item.id)) {
        result.add(item);
      }
    }
    return result;
  }

  @override
  void addBookmark(int id) {
    if (!_bookmarkedIds.contains(id)) {
      _bookmarkedIds.add(id);
    }
  }
}