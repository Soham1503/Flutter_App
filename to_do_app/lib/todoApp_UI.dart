import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:to_do_app/todoModal.dart";

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State createState() => _TodoAppstate();
}

class _TodoAppstate extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<TodoModal> todoCards = [];
  List colorList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];
  void submitData(bool doEdit, [TodoModal? todoObj]) async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      if (doEdit) {
        todoObj!.title = titleController.text;
        todoObj.description = descriptionController.text;
        todoObj.date = dateController.text;
      } else {
        todoCards.add(TodoModal(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text));
      }
      Navigator.of(context).pop();
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
      setState(() {});
    }
  }

  void showmyBottomSheet(isEdit, [TodoModal? todoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 12,
                right: 12,
                left: 12),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create To-do",
                    style: GoogleFonts.quicksand(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                          width: 1,
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                          width: 1,
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 139, 148, 1),
                              width: 1,
                            ),
                          )),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025));
                        String formattedDate =
                            DateFormat.yMMMd().format(pickedDate!);
                        dateController.text = formattedDate;
                        setState(
                          () {},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (isEdit) {
                                submitData(isEdit, todoObj);
                              } else {
                                submitData(isEdit);
                              }
                            },
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(0, 139, 148, 1)),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do List",
            style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700)),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: todoCards.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorList[index % colorList.length],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/logo.png"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      todoCards[index].title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      todoCards[index].description,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                todoCards[index].date,
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(132, 132, 132, 1),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  titleController.text = todoCards[index].title;
                                  descriptionController.text =
                                      todoCards[index].description;
                                  dateController.text = todoCards[index].date;
                                  showmyBottomSheet(true, todoCards[index]);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.edit_outlined,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  size: 30,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    titleController.clear();
                                    dateController.clear();
                                    descriptionController.clear();
                                    todoCards.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showmyBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }
}
