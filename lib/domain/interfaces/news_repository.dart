import '../entities/news_item.dart';

abstract class NewsRepository {
  List<NewsItem> getAll();
  List<NewsItem> getByCategory(String category);
  List<NewsItem> getBookmarked();
  void addBookmark(int id);
}