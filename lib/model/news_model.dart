/// Main Response Model
class NewsModel {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<Article> newsArticles = [];
    if (json['articles'] != null) {
      newsArticles = (json['articles'] as List)
          .map((article) => Article.fromJson(article))
          .toList();
    }

    return NewsModel(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: newsArticles,
    );
  }
}

/// Article Model
class Article {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

/// Source Model
class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}
