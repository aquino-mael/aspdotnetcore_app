import 'package:flutter/material.dart';

import 'data/service/authentication_service.dart';
import 'ui/common/common.dart';
import 'ui/widget/widget.dart';

void main() {
  runApp(
    AspDotNetCoreApp(
      authenticationService: AuthenticationService(
        client: kHttpClient,
        url: kUrl,
      ),
    )
  );
}
