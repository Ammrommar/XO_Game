import 'package:flutter/material.dart';
import 'package:xo_gamme/Custom_Buttom.dart';
import 'package:xo_gamme/register_screen.dart';


class GameScreen extends StatefulWidget {
  static const String routeName = 'Game Screen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> gameBoard = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as BoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'XO Game',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name} (X)',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('$player1Score',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.Player2Name} (O)',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                    Text('$player2Score',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Custom_Button(
                    text: gameBoard[0], index: 0, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[1], index: 1, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[2], index: 2, onButtonClick: onClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Custom_Button(
                    text: gameBoard[3], index: 3, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[4], index: 4, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[5], index: 5, onButtonClick: onClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Custom_Button(
                    text: gameBoard[6], index: 6, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[7], index: 7, onButtonClick: onClick),
                Custom_Button(
                    text: gameBoard[8], index: 8, onButtonClick: onClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  void onClick(int index) {
    if (gameBoard[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      gameBoard[index] = 'X';
    } else {
      gameBoard[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      player1Score++;
      clearBoard();
    } else if (checkWinner('O')) {
      player2Score++;
      clearBoard();
    } else if (counter == 9) {
      clearBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (gameBoard[i] == symbol &&
          gameBoard[i + 1] == symbol &&
          gameBoard[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameBoard[i] == symbol &&
          gameBoard[i + 3] == symbol &&
          gameBoard[i + 6] == symbol) {
        return true;
      }
    }
    if (gameBoard[0] == symbol &&
        gameBoard[4] == symbol &&
        gameBoard[8] == symbol) {
      return true;
    }
    if (gameBoard[2] == symbol &&
        gameBoard[4] == symbol &&
        gameBoard[6] == symbol) {
      return true;
    }

    return false;
  }

  void clearBoard() {
    gameBoard = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }
}
