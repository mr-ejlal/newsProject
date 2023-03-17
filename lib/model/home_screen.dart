import 'dart:convert';

GetCategorytResponseModel getCategorytResponseModelFromJson(String str) =>
    GetCategorytResponseModel.fromJson(json.decode(str));

String getCategorytResponseModelToJson(GetCategorytResponseModel data) =>
    json.encode(data.toJson());

class GetCategorytResponseModel {
  GetCategorytResponseModel({
    this.status,
    this.blogsCategory,
  });

  bool? status;
  List<BlogsCategory>? blogsCategory;

  factory GetCategorytResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCategorytResponseModel(
        status: json["status"],
        blogsCategory: json["blogs_category"] == null
            ? []
            : List<BlogsCategory>.from(
                json["blogs_category"]!.map((x) => BlogsCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "blogs_category": blogsCategory == null
            ? []
            : List<dynamic>.from(blogsCategory!.map((x) => x.toJson())),
      };
}

class BlogsCategory {
  BlogsCategory({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory BlogsCategory.fromJson(Map<String, dynamic> json) => BlogsCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
// To parse this JSON data, do
//
// final getCategoryDatatResponseModel = getCategoryDatatResponseModelFromJson(jsonString);

GetCategoryDatatResponseModel getCategoryDatatResponseModelFromJson(
        String str) =>
    GetCategoryDatatResponseModel.fromJson(json.decode(str));

String getCategoryDatatResponseModelToJson(
        GetCategoryDatatResponseModel data) =>
    json.encode(data.toJson());

class GetCategoryDatatResponseModel {
  GetCategoryDatatResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory GetCategoryDatatResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryDatatResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.image,
    this.title,
    this.content,
    this.category,
  });

  int? id;
  String? createdAt;
  String? image;
  String? title;
  String? content;
  int? category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"],
        image: json["image"],
        title: json["title"],
        content: json["content"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "image": image,
        "title": title,
        "content": content,
        "category": category,
      };
}

class ModelForTabBar {
  String header;
  List<Result> result;
  ModelForTabBar({
    required this.header,
    required this.result,
  });
}
