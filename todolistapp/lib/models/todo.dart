class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'To Fix Jersey Project Error', isDone: true),
      ToDo(id: '02', todoText: 'Finish ToDoList App', isDone: false),
      ToDo(id: '03', todoText: 'To Learn about HCME Project', isDone: false),
      ToDo(id: '04', todoText: 'Setting Up Required Tools', isDone: true),
      ToDo(id: '05', todoText: 'Make myself Comfortable', isDone: false),
      ToDo(id: '06', todoText: 'Workout and Focus', isDone: false),
    ];
  }
}
