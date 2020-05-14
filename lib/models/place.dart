import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  final double latitude;
  final double lonngitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.lonngitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.location,
  });
}
