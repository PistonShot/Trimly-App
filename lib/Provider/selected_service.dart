import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trimly/Provider/models/selected_service_data.dart';

class SelectedService with ChangeNotifier {
  SelectedServiceData service = SelectedServiceData.empty();

  update(SelectedServiceData service) {
    this.service = service;
    notifyListeners();
  }
}
