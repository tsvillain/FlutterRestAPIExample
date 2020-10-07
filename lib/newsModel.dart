class NewsModel {
  String author;
  String title;
  String description;
  String url;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
  });

  NewsModel.fromMap(Map<String, dynamic> map) {
    this.author = map["author"];
    this.description = map["description"];
    this.title = map["title"];
    this.url = map["url"];
  }

  toJson() {
    return {
      "author": this.author,
      "description": this.description,
      "title": this.title,
      "url": this.url,
    };
  }
}

class Source {
  String id;
  String name;

  Source({
    this.id,
    this.name,
  });

  Source.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
  }
  toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
