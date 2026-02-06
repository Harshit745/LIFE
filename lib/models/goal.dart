class Goal {
  final String id;
  final String title;
  final bool completed;

  Goal({
    required this.id,
    required this.title,
    this.completed = false,
  });
}
