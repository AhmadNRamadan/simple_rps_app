import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_rps/choice_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _result;
  IconData _userChoice = Icons.question_mark;
  IconData _computerChoice = Icons.question_mark;
  int _userScore = 0;
  int _computerScore = 0;
  final List<IconData> _choices = [
    FontAwesomeIcons.handFist,
    FontAwesomeIcons.handScissors,
    FontAwesomeIcons.hand,
  ];
  void _checkResult() {
    if (_userChoice == _computerChoice) {
      _result = "It's a Tie 😐";
    } else if ((_userChoice == FontAwesomeIcons.handFist &&
            _computerChoice == FontAwesomeIcons.handScissors) ||
        (_userChoice == FontAwesomeIcons.handScissors &&
            _computerChoice == FontAwesomeIcons.hand)) {
      _result = "You Win 🥳";
      _userScore++;
    } else {
      _result = "You Lose 😢";
      _computerScore++;
    }
  }

  void Function()? _resetGame() {
    setState(() {
      _userChoice = Icons.question_mark;
      _computerChoice = Icons.question_mark;
      _result = null;
      _userScore = 0;
      _computerScore = 0;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SizedBox.expand(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 40,
          children: [
            Text(
              "Let's Play Rock Paper Scissors",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 22),
            ChoiceSection(player: "You:", choice: _userChoice),
            ChoiceSection(player: "Computer:", choice: _computerChoice),
            Row(
              spacing: 5,
              children: List<Widget>.generate(3, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _userChoice = _choices[index];
                        _computerChoice = _choices[Random().nextInt(3)];
                        _checkResult();
                      });
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyanAccent,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/rps$index.png",
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            _result == null
                ? SizedBox()
                : Text(
                  _result!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Score: $_userScore",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Computer Score: $_computerScore",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: _resetGame,
              icon: Icon(Icons.restart_alt_rounded, color: Colors.redAccent),
              iconSize: 55,
            ),
          ],
        ),
      ),
    );
  }
}
