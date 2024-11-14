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