class VehicleModel {
  String? status;
  Meta? meta;
  List<Data>? data;

  VehicleModel({this.status, this.meta, this.data});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;

    if (json['data'] != null) {
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['status'] = status;
    if (meta != null) {
      result['meta'] = meta!.toJson();
    }
    if (data != null) {
      result['data'] = data!.map((v) => v.toJson()).toList();
    }
    return result;
  }
}

class Meta {
  String? title;
  String? description;
  String? source;
  String? generated;
  int? count;

  Meta({this.title, this.description, this.source, this.generated, this.count});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    source = json['source'];
    generated = json['generated'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['title'] = title;
    result['description'] = description;
    result['source'] = source;
    result['generated'] = generated;
    result['count'] = count;
    return result;
  }
}

class Data {
  int? id;
  String? make;
  String? model;
  int? year;
  int? price;
  String? currency;
  String? image;
  String? description;
  Map<String, dynamic>? specs;

  Data({
    this.id,
    this.make,
    this.model,
    this.year,
    this.price,
    this.currency,
    this.image,
    this.description,
    this.specs,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    description = json['description'];
    specs = json['specs'] != null
        ? Map<String, dynamic>.from(json['specs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['make'] = make;
    result['model'] = model;
    result['year'] = year;
    result['price'] = price;
    result['currency'] = currency;
    result['image'] = image;
    result['description'] = description;
    if (specs != null) {
      result['specs'] = specs;
    }
    return result;
  }
}
