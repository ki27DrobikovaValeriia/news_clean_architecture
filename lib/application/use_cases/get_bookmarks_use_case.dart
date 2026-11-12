import '../../domain/entities/news_item.dart';
import '../../domain/interfaces/news_repository.dart';

class GetBookmarksUseCase {
  final NewsRepository repository;

  GetBookmarksUseCase(this.repository);

  List<NewsItem> execute() {
    return repository.getBookmarked();
  }
}