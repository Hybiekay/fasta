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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['size'] = size;
    data['weight'] = weight;
    data['width'] = width;
    data['height'] = height;
    data['pickup_lat'] = pickupLat;
    data['pickup_lon'] = pickupLon;
    data['pickup_address'] = pickupAddress;
    data['dropoff_lat'] = dropoffLat;
    data['dropoff_lon'] = dropoffLon;
    data['dropoff_address'] = dropoffAddress;
    data['scheduled_date'] = scheduledDate;
    data['scheduled_time'] = scheduledTime;
    data['isScheduled'] = isScheduled;
    data['price'] = price;
    data['distance'] = distance;
    data['duration'] = duration;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}
