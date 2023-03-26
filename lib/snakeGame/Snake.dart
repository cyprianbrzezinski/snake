import 'dart:async';
import 'dart:math';

import 'package:snake/snakeGame/Snake_objects/blank_pixel.dart';
import 'package:snake/snakeGame/Snake_objects/food_pixel.dart';
import 'package:snake/snakeGame/Snake_objects/snake_position.dart';
import 'package:flutter/material.dart';

class Snake extends StatefulWidget {
  const Snake({super.key});

  @override
  State<Snake> createState() => _SnakeState();
}

enum snake_Direction {
  UP,
  DOWN,
  LEFT,
  RIGHT,
}

class _SnakeState extends State<Snake> {
  //grid dimensions
  int rowSize = 10;
  int totalNumberOfSquares = 100;

  bool gameHasStarted = false;

  //user score
  int currentScore = 0;

  //snake position
  List<int> snakePosition = [
    0,
    1,
    2,
  ];

  //food position
  int foodPosition = 85;

  //snake direction

  var currentDirection = snake_Direction.RIGHT;

  // start game easy
  void startGameEasy() {
    gameHasStarted = true;

    Timer.periodic(const Duration(milliseconds: 600), (timer) {
      setState(() {
        //snake is moving
        moveSnake();
        //end game
        if (gameOver()) {
          timer.cancel();
          //message when game is over

           showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    'Your score is: $currentScore',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      color: Colors.green,
                      child: const Text('New Game'),
                    ),
                    
                  ],
                );
              });
        }
      });
    });
  }

  // start game medium
  void startGameMedium() {
    gameHasStarted = true;

    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        //snake is moving
        moveSnake();
        //end game
        if (gameOver()) {
          timer.cancel();
          //message when game is over

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    'Your score is: $currentScore',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      color: Colors.green,
                      child: const Text('New Game'),
                    ),
                    
                  ],
                );
              });
        }
      });
    });
  }

  // start game Hard
  void startGameHard() {
    gameHasStarted = true;

    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        //snake is moving
        moveSnake();
        //end game
        if (gameOver()) {
          timer.cancel();
          //message when game is over

           showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    'Your score is: $currentScore',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      color: Colors.green,
                      child: const Text('New Game'),
                    ),
                    
                  ],
                );
              });
        }
      });
    });
  }

  // start game VeryHard
  void startGameVeryHard() {
    gameHasStarted = true;

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        //snake is moving
        moveSnake();
        //end game
        if (gameOver()) {
          timer.cancel();
          //message when game is over

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  title: const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    'Your score is: $currentScore',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        newGame();
                      },
                      color: Colors.green,
                      child: const Text('New Game'),
                    ),
                    
                  ],
                );
              });
        }
      });
    });
  }

  //new game
  void newGame() {
    setState(() {
      snakePosition = [
        0,
        1,
        2,
      ];
      foodPosition = 85;
      currentDirection = snake_Direction.RIGHT;
      gameHasStarted = false;
      currentScore = 0;
    });
  }

  //eat in random space
  void eatFood() {
    currentScore++;
    while (snakePosition.contains(foodPosition)) {
      foodPosition = Random().nextInt(totalNumberOfSquares);
    }
  }

//move snake
  void moveSnake() {
    switch (currentDirection) {
      case snake_Direction.RIGHT:
        {
          //add pixel snake and if snake is at the right wall
          if (snakePosition.last % rowSize == 9) {
            snakePosition.add(snakePosition.last + 1 - rowSize);
          } else {
            snakePosition.add(snakePosition.last + 1);
          }
        }
        break;
      case snake_Direction.LEFT:
        {
          //add pixel snake and if snake is at the left wall
          if (snakePosition.last % rowSize == 0) {
            snakePosition.add(snakePosition.last - 1 + rowSize);
          } else {
            snakePosition.add(snakePosition.last - 1);
          }
        }
        break;
      case snake_Direction.UP:
        {
          //add pixel snake and if snake is at the left wall
          if (snakePosition.last < rowSize) {
            snakePosition
                .add(snakePosition.last - rowSize + totalNumberOfSquares);
          } else {
            snakePosition.add(snakePosition.last - rowSize);
          }
        }
        break;
      case snake_Direction.DOWN:
        {
          //add pixel snake and if snake is at the left wall
          if (snakePosition.last + rowSize > totalNumberOfSquares) {
            snakePosition
                .add(snakePosition.last + rowSize - totalNumberOfSquares);
          } else {
            snakePosition.add(snakePosition.last + rowSize);
          }
        }
        break;
      default:
    }
    //snake is eating food
    if (snakePosition.last == foodPosition) {
      eatFood();
    } else {
      snakePosition.removeAt(0);
    }
  }

  //game over
  bool gameOver() {
    List<int> bodySnake = snakePosition.sublist(0, snakePosition.length - 1);
    if (bodySnake.contains(snakePosition.last)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            //score points
            Expanded(
                child: Center(
                  child: Text('Current Score: $currentScore',
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),

            //game grid
            Expanded(
                flex: 4,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 0 &&
                        currentDirection != snake_Direction.UP) {
                      currentDirection = snake_Direction.DOWN;
                    } else if (details.delta.dy < 0 &&
                        currentDirection != snake_Direction.DOWN) {
                      currentDirection = snake_Direction.UP;
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx > 0 &&
                        currentDirection != snake_Direction.LEFT) {
                      currentDirection = snake_Direction.RIGHT;
                    } else if (details.delta.dx < 0 &&
                        currentDirection != snake_Direction.RIGHT) {
                      currentDirection = snake_Direction.LEFT;
                    }
                  },
                  child: GridView.builder(
                      itemCount: totalNumberOfSquares,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowSize),
                      itemBuilder: (context, index) {
                        if (snakePosition.contains(index)) {
                          return const SnakePixel();
                        } else if (foodPosition == index) {
                          return const FoodPixel();
                        } else {
                          return const BlankPixels();
                        }
                      }),
                )),

            //play button
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      onPressed: gameHasStarted ? () {} : startGameEasy,
                      color: gameHasStarted ? Colors.grey : Colors.deepPurple,
                      child: const Text('EASY')),
                  MaterialButton(
                      onPressed: gameHasStarted ? () {} : startGameMedium,
                      color: gameHasStarted ? Colors.grey : Colors.deepPurple,
                      child: const Text('MEDIUM')),
                  MaterialButton(
                      onPressed: gameHasStarted ? () {} : startGameHard,
                      color: gameHasStarted ? Colors.grey : Colors.deepPurple,
                      child: const Text('HARD')),
                  MaterialButton(
                      onPressed: gameHasStarted ? () {} : startGameVeryHard,
                      color: gameHasStarted ? Colors.grey : Colors.deepPurple,
                      child: const Text('VERY HARD')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
