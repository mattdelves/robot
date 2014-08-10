# A friendly Robot game

## The Law

1. A robot may not injure a human being or, through inaction, allow a human being to come to harm.
2. A robot must obey the orders given to it by human beings, except where such orders would conflict with the First Law.
3. A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.

## Purpose

To demonstrate and have fun with building a simple ruby application that moves around a board based upon simple instructions.

## Design

The main design I chose was to keep everything simple. Because the problem is well defined with regard to input and expected output, it is possible to write as little code as possible in order to solve the problem. By making sure that the code is tested, it is possible to know that any changes made due to refactoring or extending the requirements don't break things.

Throughout the fun example, I've made an effort to keep everything as simple as possible. By doing so the code remains readable and there is very little duplication and complexity amongst the code.

There are three main classes used which are Board, Robot and Play.

### Board

The board class is responsible for moving the Robot around and also for initial placement. The board will also validate the posibility of moving the robot. When executing the instruction, the board will return true or false depending on whether the move took place.

### Robot

The Robot class is the object which is moved around the board. It can be told to move, rotateLeft, rotateRight or outputLocation

### Compass

The Compass class is what determins the orientation of the robot. The basic compass has 4 points being NORTH, SOUTH, EAST and WEST. The use of a compass class allows for expansion to more points than what is currently used without needing to change the implementation of the robot.

### Play

The play is an executor class that takes a filename and a board.

The filename contains instructions for the robot with one instruction on each line.

The board is then used for telling the robot what its bounds are.

## Usage

The game is played by providing a simple set of instructions in a text file that the robot then obeys willingly.

To call the rake task with a file you can run

```
bundle exec rake play[examples/basic.txt]
```

if you wish to specify a board larger than 5x5 then run

```
bundle exec rake play[examples/complex.txt,10x10]
```

### Examples

There are three examples included with this project to test the functionality. These are:

* examples/basic.txt
* examples/intermediate.txt
* examples/complex.txt

As the naming suggests, they increase in complexity in each file. By doing a lot of semi-random instructions, we are able to make sure that the majority of locations on the board get moved through. These examples are compatible with all board dimensions from the default 5x5 to whatever is specified in the rake task.

### Commands

The commands that robot knows about are:

* PLACE X,Y,F
* MOVE
* LEFT
* RIGHT
* REPORT

#### Place

The PLACE command takes in an X and Y coordinate that start at 0,0 being the lower south west corner. There is also the F which is the direction the robot is facing. This can be either NORTH, SOUTH, EAST or WEST.

#### MOVE

This will move the robot one position forward in the direction it is facing. If it is beyond the bounds of the board, it will not move.

#### LEFT

This will move the robot 90 degrees clockwise.

#### RIGHT

This will move the robot 90 degrees counter-clockwise.

#### REPORT

This will output the position of the robot.

## Credits
どもありがとう Mr Roboto.
