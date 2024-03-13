class CategoryNewsModel {


int? totalArticles;
  List<Articles>? articles;

  CategoryNewsModel({this.totalArticles, this.articles});

  CategoryNewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['totalArticles'] = totalArticles;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source;

  Articles(
      {this.title,
      this.description,
      this.content,
      this.url,
      this.image,
      this.publishedAt,
      this.source});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    publishedAt = json['publishedAt'];
    source =
        json['source'] != null ?  Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['content'] = content;
    data['url'] = url;
    data['image'] = image;
    data['publishedAt'] = publishedAt;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    return data;
  }
}

class Source {
  String? name;
  String? url;

  Source({this.name, this.url});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}