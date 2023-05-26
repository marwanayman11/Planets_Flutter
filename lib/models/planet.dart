class Planet {
  late int id;
  late int planetOrder;
  late String name;
  late String description;
  late BasicDetails basicDetails;
  late String source;

  late String wikiLink;
  late ImgSrc imgSrc;

  Planet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planetOrder = json['planetOrder'];
    name = json['name'];
    description = json['description'];
    source = json['source'];
    wikiLink = json['wikiLink'];
    basicDetails = BasicDetails.fromJson(json['basicDetails']);
    imgSrc = ImgSrc.fromJson(json['imgSrc']);
  }
}

class BasicDetails {
  late String mass;
  late String volume;

  BasicDetails.fromJson(Map<String, dynamic> json) {
    mass = json['mass'];
    volume = json['volume'];
  }
}

class ImgSrc {
  late String img;
  late String imgDescription;

  ImgSrc.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    imgDescription = json['imgDescription'];
  }
}
