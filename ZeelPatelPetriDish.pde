/**
 * Assignment: [Petri Dish]
 * Date: [May 29, 2018]
 * Author: [Zeel Patel]
 * Description: Petri dish which contains a maximun of 10 balls which bounce off the walls 
 *              each other
 */

// global variable section
//Ball_Sprite ball1, ball2, ball3, ball4, ball5, ball6, ball7, ball8, ball9, ball10;
Ball_Sprite[] Ball;
dish dish;
boolean paused=false;
int numBalls = 3;
int numClicks;
float speed = 0.2;
float countSpeed = 0.2;
int colRed; // the red value of the RGB 
int colGreen; // the green value of the RGB 
int colBlue; // the blue value of the RGB 

void setup() {
  size(800, 800);
  background(0);
  dish = new dish();
  addBalls(numBalls);
  StartStop.setSize(60, 60);
  StartStop.setPosition(30, 30);
  reset.setSize(60, 60);
  reset.setPosition(30, 110);
  ballUp.setSize(60, 60);
  ballUp.setPosition(30, 190);
  ballDown.setSize(60, 60);
  ballDown.setPosition(30, 270);
  increaseSpeed.setSize(60, 60);
  increaseSpeed.setPosition(30, 350);
  decreaseSpeed.setSize(60, 60);
  decreaseSpeed.setPosition(30, 430);
}

// called repeatedly to render the screen

void draw() {
  smooth();
  StartStop.draw();
  reset.draw();
  ballUp.draw();
  ballDown.draw();
  increaseSpeed.draw();
  decreaseSpeed.draw();
  dish.display();
  for (int i = 0; i < Ball.length; i++) {
    Ball[i].draw();
  }
}

void addBalls(int n) {
  Ball = new Ball_Sprite[n];
  for (int i = 0; i < Ball.length; i++) {
    Ball[i] = new Ball_Sprite();
    Ball[i].setBehavior(30, 0, 255, 0, (int)random(250, 600), (int)random(250, 600), (int)random(0, 360));
    Ball[i].setMovementVector(new Vector90(Ball[i].ballAngle, speed));
  }
}

void mouseClicked() {

  println(countSpeed);

  if (StartStop.isInside(mouseX, mouseY) && paused == true) {
    paused = false;
  } else if (StartStop.isInside(mouseX, mouseY) && paused == false) {
    paused=true;
  } 
  if (numClicks==2) {
    countSpeed=speed;
    paused=false;
    countSpeed=0;
  }
  if (reset.isInside(mouseX, mouseY)) {
    countSpeed = .2;
    addBalls(numBalls);
  }
  if (increaseSpeed.isInside(mouseX, mouseY)) {
    countSpeed = countSpeed + .05;
  }
  if (decreaseSpeed.isInside(mouseX, mouseY)) {
    countSpeed = countSpeed - .05;
  }
  if (countSpeed <= 0) {
    countSpeed = 0;
  }
   if (ballUp.isInside(mouseX, mouseY) && numBalls < 10) {
    numBalls++;
    addBalls(numBalls);
    println(numBalls);
  } 
  if (ballDown.isInside(mouseX, mouseY) && numBalls > 1) {
    numBalls--;
    addBalls(numBalls);
    println(numBalls);
  }
}
