class CatImage {
  String? id;
  int? width;
  int? height;
  String? url;

  CatImage({this.id, this.width, this.height, this.url});

  CatImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}
