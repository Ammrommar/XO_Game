import 'package:flutter/material.dart';
import 'package:xo_gamme/game_screen.dart';

class registerScreen extends StatelessWidget {
  static const String routeName = 'Register_Screen';

  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  String Player1Name = '';
  String Player2Name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Welcome To XO Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xff79C4C0),
            image: DecorationImage(image: AssetImage('assets/images/2.jpg'))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                controller: player1Controller,
                onChanged: (text) {
                  Player1Name = text;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.orange, width: 2)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Player1 Name',
                    hintStyle: TextStyle(
                      color: Color(0xff79C4C0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                controller: player2Controller,
                onChanged: (text) {
                  Player2Name = text;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.orange, width: 2)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Player2 Name',
                    hintStyle: TextStyle(
                        color: Color(0xff79C4C0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(256, 60)),
              onPressed: () {
                if (player1Controller.text.isNotEmpty &&
                    player2Controller.text.isNotEmpty) {
                  Navigator.pushNamed(context, GameScreen.routeName,
                      arguments: BoardArgs(
                          player1Name: Player1Name, Player2Name: Player2Name));
                  player1Controller.clear();
                  player2Controller.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Enter The Two Players Name',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 16,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ));
                }
              },
              child: Text(
                "Let's Play",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class BoardArgs {
  String player1Name;
  String Player2Name;
  BoardArgs({required this.player1Name, required this.Player2Name});
}
