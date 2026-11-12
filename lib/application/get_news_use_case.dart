import '../../domain/entities/news_item.dart';
import '../../domain/interfaces/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  List<NewsItem> execute(String category) {
    if (category == 'Всі') {
      return repository.getAll();
    }
    return repository.getByCategory(category);
  }
}