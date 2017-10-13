Aws.config.update({
    region: 'us-east-1',
    credentials: Aws::Credentials.new('key', 'secret'),
    endpoint:'http://dynamodb:8000'
  })

Dynamoid.configure do |config|
    config.namespace = "dynamoid_app_development" # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
    config.endpoint = 'http://dynamodb:8000' # [Optional]. If provided, it communicates with the DB listening at the endpoint. This is useful for testing with [Amazon Local DB] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
end