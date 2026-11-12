import '../../domain/interfaces/news_repository.dart';

class AddBookmarkUseCase {
  final NewsRepository repository;

  AddBookmarkUseCase(this.repository);

  void execute(int id) {
    repository.addBookmark(id);
  }
}