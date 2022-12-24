class PropertyModel {
  String? name;
  String? description;
  int? roomnumber;
  String? state;
  int? price;
  String? local;
  double? lan;
  double? lat;
  String? photo;
  int? bathroom;
  int? bedroom;
  String? propertyType;

  PropertyModel({
    this.name,
    this.description,
    this.roomnumber,
    this.state,
    this.price,
    this.local,
    this.lan,
    this.lat,
    this.photo,
    this.bathroom,
    this.bedroom,
    this.propertyType,
  });

  PropertyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    roomnumber = json['roomnumber'];
    state = json['state'];
    price = json['price'];
    local = json['local'];
    lan = json['lan'];
    lat = json['lat'];
    photo = json['photo'];
    bathroom = json['bathroom'];
    bedroom = json['bedroom'];
    propertyType = json['propertyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['roomnumber'] = this.roomnumber.toString();
    data['state'] = this.state;
    data['price'] = this.price.toString();
    data['local'] = this.local;
    data['lan'] = this.lan.toString();
    data['lat'] = this.lat.toString();
    data['photo'] = this.photo;
    data['bathroomnumber'] = this.bathroom.toString();
    data['bedroomnumber'] = this.bedroom.toString();
    data['propartytype'] = this.propertyType;
    return data;
  }
}
