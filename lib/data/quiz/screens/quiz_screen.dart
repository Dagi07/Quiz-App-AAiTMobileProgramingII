import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_proj/data/category/model/category.dart';
import 'package:quiz_proj/data/quiz/bloc/quiz_bloc.dart';
import 'package:quiz_proj/data/quiz/model/quiz_model.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';
  final Category selectedCategory;
  QuizScreen({
    Key? key,
    this.selectedCategory = const Category(name: "People"),
    // required this.selectedCategory,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String categoryName = selectedCategory.name;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Category - $categoryName",
            style: TextStyle(fontSize: 35),
          ),
          BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              print("state has ${state.props}");
              if (state is QuizInitial) {
                BlocProvider.of<QuizBloc>(context).add(
                    LoadQuizesFromGivenCategory(categoryName: categoryName));

                return Text("HI");
              } else if (state is QuizLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is QuizSuccess) {
                final List<Quiz> result = state.quizes;
                print("stat hasss $result");
                return Expanded(
                  child: ListView.builder(
                      cacheExtent: 122225,
                      itemCount: result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuizWidget(
                          currentQuiz: result[index],
                          incrementAnswerCount: () {},
                        );
                      }),
                );
              } else if (state is QuizFailure) {
                return Text("failure");
              } else {
                return Text("unknown error");
              }
            },
          ),
          // ElevatedButton(
          //   onPressed: answeredCount == 5
          //       ? () {
          //           Navigator.of(context).pushNamed("/leaderboard");
          //         }
          //       : null,
          //   child: Text("Finish"),
          // ),
        ],
      ),
    );
  }
}

class QuizWidget extends StatefulWidget {
  final Quiz currentQuiz;
  final Function incrementAnswerCount;
  const QuizWidget(
      {Key? key, required this.currentQuiz, required this.incrementAnswerCount})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.currentQuiz.question),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: customButtonStyle(
                index: 0,
                selectedIndex: selectedIndex,
                answer: widget.currentQuiz.answer),
            onPressed: selectedIndex == -1
                ? () {
                    setState(() {
                      selectedIndex = 0;
                      widget.incrementAnswerCount();
                    });
                  }
                : null,
            child: MyButton(choices: widget.currentQuiz.choices, index: 0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: customButtonStyle(
                index: 1,
                selectedIndex: selectedIndex,
                answer: widget.currentQuiz.answer),
            onPressed: selectedIndex == -1
                ? () {
                    setState(() {
                      selectedIndex = 1;
                      widget.incrementAnswerCount();
                    });
                  }
                : null,
            child: MyButton(choices: widget.currentQuiz.choices, index: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: customButtonStyle(
                index: 2,
                selectedIndex: selectedIndex,
                answer: widget.currentQuiz.answer),
            onPressed: selectedIndex == -1
                ? () {
                    setState(() {
                      selectedIndex = 2;
                      widget.incrementAnswerCount();
                    });
                  }
                : null,
            child: MyButton(choices: widget.currentQuiz.choices, index: 2),
          ),
        ),
        //TODO  change
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: customButtonStyle(
                index: 3,
                selectedIndex: selectedIndex,
                answer: widget.currentQuiz.answer),
            onPressed: selectedIndex == -1
                ? () {
                    setState(() {
                      selectedIndex = 3;
                      widget.incrementAnswerCount();
                    });
                  }
                : null,
            child: MyButton(choices: widget.currentQuiz.choices, index: 3),
          ),
        ),
      ],
    );
  }

  ButtonStyle customButtonStyle({
    required int index,
    required int selectedIndex,
    required int answer,
  }) {
    print("selected Index $selectedIndex $answer");
    var isCorrectChoice = false;
    if (selectedIndex != -1) {
      if (selectedIndex == index && selectedIndex == answer) {
        isCorrectChoice = true;
      }

      var isIncorrectChoice = false;
      if (selectedIndex == index && selectedIndex != answer) {
        isIncorrectChoice = true;
      }
      var customBackgroundColor = MaterialStateProperty.all<Color>(Colors.blue);

      if (isCorrectChoice) {
        print("match is found");
        customBackgroundColor = MaterialStateProperty.all<Color>(Colors.green);
      } else {
        print("match not found");
      }
      if (isIncorrectChoice) {
        customBackgroundColor = MaterialStateProperty.all<Color>(Colors.red);
      }
      return ButtonStyle(
        backgroundColor: customBackgroundColor,
      );
    } else {
      print("here");
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      );
    }
  }
}

class MyButton extends StatelessWidget {
  final List<String> choices;
  final int index;
  const MyButton({Key? key, required this.choices, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(choices[index]),
      ],
    );
  }
}
