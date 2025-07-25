class TodoModal {
  String title;
  String description;
  String date;

  TodoModal(
      {required this.title, required this.description, required this.date});
  Map<String, dynamic> todoMap() {
    return {'title': title, 'description': description, 'data': date};
  }
}
