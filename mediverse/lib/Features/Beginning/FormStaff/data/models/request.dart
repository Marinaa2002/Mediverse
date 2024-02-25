class Request {
  const Request({
    required this.id,
    required this.Type,
    required this.State,
    required this.Info,
  });

  final String id;
  final String Type;
  final String State;
  final Map<String, String> Info;
}
