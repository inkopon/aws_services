// Copyright (c) 2016, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:http_client/console.dart';
import 'package:http_client/http_client.dart' as http;

import 'aws_credentials.dart';
import 'aws_sqs.dart';

/// AWS access facade that helps to initialize multiple services with common
/// settings (credentials and HTTP client).
class AwsClient {
  final AwsCredentials? _credentials;
  final http.Client _httpClient = ConsoleClient();

  AwsSqs? _sqs;

  ///
  AwsClient({AwsCredentials? credentials}) : _credentials = credentials {
    assert(_credentials != null);
  }

  /// Returns an SQS service, inheriting the properties of this instance.
  AwsSqs get sqs => _sqs ??= AwsSqs(credentials: _credentials, httpClient: _httpClient);

  // AwsSqs get sqs {
  //   log(_sqs?.toString() ?? 'sqs vazio');
  //   return _sqs ??= AwsSqs(credentials: _credentials, httpClient: _httpClient);
  // }
}
