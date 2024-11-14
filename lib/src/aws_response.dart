import 'dart:convert';

import 'package:flutter/foundation.dart';

/// AWS response object.
class AwsResponse {
  /// HTTP status code.
  final int statusCode;

  /// HTTP status text.
  final String statusText;

  /// HTTP headers.
  final Map<String, String> headers;
  final Stream<List<int>> _body;

  bool _bodyWasUsed = false;

  /// AWS response object.
  AwsResponse(this.statusCode, this.statusText, this.headers, Stream<List<int>> body) : _body = body;

  /// A very lousy way to validate some of the common status codes.
  /// https://http.cat/
  void validateStatus() {
    if (statusCode >= 200 && statusCode <= 207) return;
    // check for different type of errors
    // introduce transient exception for error handling
    throw Exception('Bad response code=$statusCode, statusText=$statusText, headers=$headers.');
  }

  /// Reads the entire response into a byte array.
  Future<List<int>> readAsBytes() async {
    assert(_bodyWasUsed == false);
    _bodyWasUsed = true;
    //final builder = BytesBuilder(copy: false);

    var list = await _body.first;
    var result = Uint8List.fromList(list);
    return result;
    // await _body.forEach(builder.add);
    // return builder.toBytes();
  }

  /// Reads the entire response into a single String.
  Future<String> readAsString({Encoding encoding = utf8}) async {
    return encoding.decode(await readAsBytes());
  }
}
