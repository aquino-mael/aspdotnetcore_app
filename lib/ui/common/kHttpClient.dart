import 'package:dio/dio.dart';

import '../../data/http/http.dart';
import '../../infra/http/http.dart';

HttpClient kHttpClient = HttpAdapter(
  Dio(BaseOptions(
    receiveDataWhenStatusError: true,
  )),
);
