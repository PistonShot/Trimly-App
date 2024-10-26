import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trimly/Provider/models/selected_service_data.dart';

final selectedServiceProvider = SelectedServiceData.empty();
