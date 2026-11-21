class TodoModel {
  final String name;
  final DateTime createdAt;

  new({required this.name, required this.createdAt});

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt)';
}
