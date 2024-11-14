# AWS Services

`aws_services` is a Dart package designed to simplify integrations with AWS services. Currently, the package supports **Amazon Simple Queue Service (SQS)**.

## Features

- AWS SQS
  - Send messages to SQS queues.
  
## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  aws_services: ^1.0.0
```

## Usage
Make sure your AWS credentials are properly configured before using the package. You can set them up using environment variables or AWS's standard configuration files.

```
import 'package:aws_services/aws_services.dart';

void main() async {
  const String awsAccessKeyId = 'YOUR_ACCESS_KEY';
  const String awsSecretAccessKey = 'YOUR_SECRET_ACCESS_KEY';
  const String awsSqsQueueUrl = 'YOUR_SQS_QUEUE_URL';

  final awsCredentials = AwsCredentials(accessKey: awsAccessKeyId, secretKey: awsSecretAccessKey);
  final awsClient = AwsClient(credentials: awsCredentials);

  final queue = awsClient.sqs.queue(awsSqsQueueUrl);
  await queue.sendMessage('YOUR_MESSAGE');
}
```