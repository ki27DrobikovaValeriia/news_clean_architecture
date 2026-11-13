# News Clean Architecture

Консольний застосунок «Новини» на Dart: перегляд новин, фільтр за категорією та закладки.
Проєкт побудований за принципами Clean Architecture (лабораторна робота №5).

## Схема архітектури

```
+---------------------------------------------+
|  Presentation                               |
|  ConsoleMenu, bin/ (збирання через DI)      |
+----------------------+----------------------+
                       |
                       v
+---------------------------------------------+
|  Application                                |
|  GetNewsUseCase, AddBookmarkUseCase,        |
|  GetBookmarksUseCase                        |
+----------------------+----------------------+
                       |
                       v
+---------------------------------------------+
|  Domain                                     |
|  NewsItem, NewsRepository (інтерфейс)       |
+----------------------+----------------------+
                       ^
                       |
+---------------------------------------------+
|  Infrastructure                             |
|  InMemoryNewsRepository                     |
+---------------------------------------------+
```

Стрілки показують напрямок залежностей: зовнішні шари залежать від внутрішніх.
Application працює лише з інтерфейсом `NewsRepository` з Domain, а Infrastructure його реалізує
(принцип інверсії залежностей).

## Структура проєкту

```
lib/domain/entities/news_item.dart
lib/domain/interfaces/news_repository.dart
lib/application/use_cases/
lib/infrastructure/repositories/in_memory_news_repository.dart
lib/presentation/cli/console_menu.dart
bin/news_clean_architecture.dart
```

## Збірка і запуск

1. Встановити Dart SDK (входить до складу Flutter).
2. Склонувати репозиторій: `git clone <адреса репозиторію>`
3. Перейти в папку проєкту та встановити залежності: `dart pub get`
4. Запустити застосунок: `dart run`

## Гілки

- `main` — стабільний код
- `develop` — інтеграційна гілка
- `feature/*` — гілки під окремі задачі (по одній на кожен шар)