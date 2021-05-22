class Result {
  late List<Article> articles;

  Result({required this.articles});

  Result.fromJson(Map<String, dynamic> json) {
    articles = [];
    json['articles'].forEach((v) {
      articles.add(new Article.fromJson(v));
    });
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['articles'] = this.articles.map((v) => v.toJson()).toList();
  //   return data;
  // }
}

class Article {
  //int? id;
  String? date;
  String? modified;
  String? link;
  Guid? title;
  Content? excerpt;
  BetterFeaturedImage? betterFeaturedImage;

  Article({
    //this.id,
    this.date,
    this.excerpt,
    this.link,
    this.betterFeaturedImage,
    this.title,
    this.modified,
  });

  Article.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    date = json['date'] ?? DateTime.now();

    modified = json['modified'] ?? DateTime.now();

    link = json['link'] ?? "";
    title = new Guid.fromJson(json['title']);

    excerpt = Content.fromJson(json['excerpt']);

    betterFeaturedImage =
        new BetterFeaturedImage.fromJson(json['better_featured_image']);
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class Guid {
  late String rendered;

  Guid({required this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class BetterFeaturedImage {
  late int id;
  late String altText;
  late String caption;
  late String description;
  late String mediaType;

  late int post;
  late String sourceUrl;

  BetterFeaturedImage(
      {required this.id,
      required this.altText,
      required this.caption,
      required this.description,
      required this.mediaType,
      required this.post,
      required this.sourceUrl});

  BetterFeaturedImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    altText = json['alt_text'];
    caption = json['caption'];
    description = json['description'];
    mediaType = json['media_type'];
    //mediaDetails = MediaDetails.fromJson(json['media_details']);
    post = json['post'];
    sourceUrl = json['source_url'];
  }
}
