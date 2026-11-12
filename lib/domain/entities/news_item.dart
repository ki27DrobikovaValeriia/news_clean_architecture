class NewsItem {
  final int id;
  final String title;
  final String category;
  final String time;

  NewsItem(this.id, this.title, this.category, this.time);

  @override
  String toString() {
    return '[$id] $title ($category, $time)';
  }
}