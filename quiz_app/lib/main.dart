import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: QuizApp(), debugShowCheckedModeBanner: false);
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  int currentIndex = 0;
  int selectAnsIndex = -1;
  int totalScore = 0;
  List<Map> allQuestions = [
    {
      "Question": "What was the first Internet search engine?",
      "options": ["Yahoo", "Google", "Archie", "Lycos"],
      "correctAns": 2
    },
    {
      "Question": "Who developed the C programming language ?",
      "options": [
        "Ken Thompson",
        "Dennis Ritchie",
        "Rob Pike",
        "Bjarne Stroustrup"
      ],
      "correctAns": 1
    },
    {
      "Question": "What is the name of the first computer virus?",
      "options": ["Mydoom", "Trojan", "Rabbit", "Creeper"],
      "correctAns": 3
    },
    {
      "Question":
          "Which computer program converts assembly language to machine language ?",
      "options": ["Assembler", "Interpreter", "Compiler", "Comparator"],
      "correctAns": 0
    },
    {
      "Question": "What is the parent company of Google?",
      "options": ["Microsoft", "Apple", "Alphabet INC", "Google"],
      "correctAns": 2
    },
  ];
  WidgetStateProperty<Color?> checkAnswer(int ansIndex) {
    if (selectAnsIndex != -1) {
      if (allQuestions[currentIndex]["correctAns"] == ansIndex) {
        if (selectAnsIndex == allQuestions[currentIndex]["correctAns"]) {
          totalScore++;
        }
        return const WidgetStatePropertyAll(Colors.green);
      } else if (ansIndex == selectAnsIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionPage = true;
  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255))),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 34, 34, 59),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 233, 228),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 100),
                Text(
                  "Questions : ${currentIndex + 1} / ${allQuestions.length}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 100,
              width: 380,
              child: Text(
                allQuestions[currentIndex]["Question"],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 154, 3, 30),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 330,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if (selectAnsIndex == -1) {
                      selectAnsIndex = 0;
                      setState(() {});
                    }
                  },
                  child: Text("A.${allQuestions[currentIndex]["options"][0]}",
                      style: const TextStyle(fontSize: 25))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 330,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if (selectAnsIndex == -1) {
                      selectAnsIndex = 1;
                      setState(() {});
                    }
                  },
                  child: Text("B.${allQuestions[currentIndex]["options"][1]}",
                      style: const TextStyle(fontSize: 25))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 330,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if (selectAnsIndex == -1) {
                      selectAnsIndex = 2;
                      setState(() {});
                    }
                  },
                  child: Text("C.${allQuestions[currentIndex]["options"][2]}",
                      style: const TextStyle(fontSize: 25))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 330,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: () {
                    if (selectAnsIndex == -1) {
                      selectAnsIndex = 3;
                      setState(() {});
                    }
                  },
                  child: Text("D.${allQuestions[currentIndex]["options"][3]}",
                      style: const TextStyle(fontSize: 25))),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectAnsIndex != -1) {
              if (currentIndex < allQuestions.length - 1) {
                currentIndex++;
              } else {
                questionPage = false;
              }
              selectAnsIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: const Color.fromARGB(255, 34, 34, 59),
          child: const Icon(Icons.forward, color: Colors.white),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz Completed",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 34, 34, 59),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://media.istockphoto.com/id/1168757141/vector/gold-trophy-with-the-name-plate-of-the-winner-of-the-competition.jpg?s=612x612&w=0&k=20&c=ljsP4p0yuJnh4f5jE2VwXfjs96CC0x4zj8CHUoMo39E=",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Score : $totalScore / ${allQuestions.length}",
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  questionPage = true;
                  currentIndex = 0;
                  selectAnsIndex = -1;
                  totalScore = 0;
                  setState(() {});
                },
                child: const SizedBox(
                  height: 30,
                  width: 60,
                  child: Text("Reset",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
