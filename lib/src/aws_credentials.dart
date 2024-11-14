/// AWS credentials.
class AwsCredentials {
  /// AWS access key
  final String? accessKey;

  /// AWS secret key
  final String? secretKey;

  /// AWS temporary credentials session token
  final String? sessionToken;

  /// AWS credentials.
  AwsCredentials({required this.accessKey, required this.secretKey, this.sessionToken}) {
    assert(accessKey != null);
    assert(secretKey != null);
  }
}
