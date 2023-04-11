class CreatePackageRequest {
  String? name;
  String? description;
  int? size;
  int? weight;
  int? width;
  int? height;
  String? pickupLat;
  String? pickupLon;
  String? pickupAddress;
  String? dropoffLat;
  String? dropoffLon;
  String? dropoffAddress;
  String? scheduledDate;
  String? scheduledTime;
  bool? isScheduled;
  String? price;
  String? distance;
  String? duration;
  String? month;
  String? year;

  CreatePackageRequest(
      {this.name,
      this.description,
      this.size,
      this.weight,
      this.width,
      this.height,
      this.pickupLat,
      this.pickupLon,
      this.pickupAddress,
      this.dropoffLat,
      this.dropoffLon,
      this.dropoffAddress,
      this.scheduledDate,
      this.scheduledTime,
      this.isScheduled,
      this.price,
      this.distance,
      this.duration,
      this.month,
      this.year});

  CreatePackageRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    size = json['size'];
    weight = json['weight'];
    width = json['width'];
    height = json['height'];
    pickupLat = json['pickup_lat'];
    pickupLon = json['pickup_lon'];
    pickupAddress = json['pickup_address'];
    dropoffLat = json['dropoff_lat'];
    dropoffLon = json['dropoff_lon'];
    dropoffAddress = json['dropoff_address'];
    scheduledDate = json['scheduled_date'];
    scheduledTime = json['scheduled_time'];
    isScheduled = json['isScheduled'];
    price = json['price'];
    distance = json['distance'];
    duration = json['duration'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['size'] = this.size;
    data['weight'] = this.weight;
    data['width'] = this.width;
    data['height'] = this.height;
    data['pickup_lat'] = this.pickupLat;
    data['pickup_lon'] = this.pickupLon;
    data['pickup_address'] = this.pickupAddress;
    data['dropoff_lat'] = this.dropoffLat;
    data['dropoff_lon'] = this.dropoffLon;
    data['dropoff_address'] = this.dropoffAddress;
    data['scheduled_date'] = this.scheduledDate;
    data['scheduled_time'] = this.scheduledTime;
    data['isScheduled'] = this.isScheduled;
    data['price'] = this.price;
    data['distance'] = this.distance;
    data['duration'] = this.duration;
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}
