import 'package:news_clean_architecture/application/use_cases/add_bookmark_use_case.dart';
import 'package:news_clean_architecture/application/use_cases/get_bookmarks_use_case.dart';
import 'package:news_clean_architecture/application/use_cases/get_news_use_case.dart';
import 'package:news_clean_architecture/domain/interfaces/news_repository.dart';
import 'package:news_clean_architecture/infrastructure/repositories/in_memory_news_repository.dart';
import 'package:news_clean_architecture/presentation/cli/console_menu.dart';

void main() {
  // Dependency Injection - створення сховище і передача його в use cases
  NewsRepository repository = InMemoryNewsRepository();

  var getNews = GetNewsUseCase(repository);
  var addBookmark = AddBookmarkUseCase(repository);
  var getBookmarks = GetBookmarksUseCase(repository);

  var menu = ConsoleMenu(getNews, addBookmark, getBookmarks);
  menu.run();
}