/**
 * Description: Implements a ball as a sprite 
 *              This class relies on TimeTracker and Vector90
 */
color c;
class Ball_Sprite {

  float x, y;              // current position
  int radius;            // size of the object
  int movedBy; // contains the number of pixels the object has moved

  // contains the number of pixels the object has moved

  TimeTracker tKeeper;   // keeps track of time since we last moved
  Vector90 moveVect;      // movement vector
  Physics phys;
  // constructor
  float diameter; // diameter of the ball
  int colRed=(int)random(0, 255); // the red value of the RGB 
  int colGreen=(int)random(0, 255); // the green value of the RGB 
  int colBlue=(int)random(0, 255); // the blue value of the RGB 
  float ballAngle;
  color c=color(colRed, colGreen, colBlue);



  void setBehavior(float diam, int colRd, int colGr, int colBlu, float xPos, float yPos, int setBallAngle) {
    x = xPos;
    y = yPos;
    diameter = diam;
    colRed = colRd;
    colGreen = colGr;
    colBlue = colBlu;
    ballAngle = setBallAngle;
  }

  Ball_Sprite() {
    tKeeper = new TimeTracker();
    phys = new Physics();
    radius = 25;
    movedBy = 0;
  }
  // sets the current position
  void setPosition(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }
  // sets the movement vector 
  void setMovementVector(Vector90 v) {
    moveVect=v;
    movedBy=0;
  }

  // this method calculates the next set of coordinates based on the 
  // movement vector in effect.
void render() {
    moveVect.setSpeed(countSpeed);
    fill(c);
    //println("Ball x:"+x+", y:"+y);
    ellipse(x, y, diameter, diameter);
    if (paused == false) {
      // movement is relative to the time which has passed since we last moved
      int millisElapsed = tKeeper.getElapsed();

      // recompute the x,y coordinates based on the movement vector
      int xDispl = moveVect.getHorizontalMove(millisElapsed);
      int yDispl = moveVect.getVerticalMove(millisElapsed);

      // compute the current move amount
      int currMoveBy = moveVect.getXYMove(xDispl, yDispl);
      movedBy += currMoveBy;

      x += xDispl;
      y += yDispl;
    }
    // mark the current time so that the next time we move, we know by how much
    tKeeper.mark();
  }

  void bounce() {
    phys.borderCollision(x, y, radius, moveVect.getDirection());
    if (dist(x, y, width / 2, height / 2) >= 250 - radius) {
      moveVect.setDirection(phys.dir());
      x = phys.pushbackX();
      y = phys.pushbackY();
    }
    float normalAngle, normalX, normalY;

    normalX = 400 - x;
    normalY = 400 - y;
    normalAngle = atan(normalY / normalX);
    for (int i = 0; i < Ball.length; i++) {
      if (dist(x, y, Ball[i].x, Ball[i].y) <= radius * 2 && x != Ball[i].x && y != Ball[i].y) {
        ballAngle = 180 + (2 * degrees(normalAngle)) - ballAngle;
        Ball[i].setMovementVector(new Vector90(Ball[i].ballAngle, speed));
      
      }
    }

    for (int i = 0; i < Ball.length; i++) {
      if (sqrt(sq(normalX) + sq(normalY)) >= 240-(diameter/2)) {
        ballAngle = 180 + (2 * degrees(normalAngle)) - ballAngle;
        Ball[i].setMovementVector(new Vector90(Ball[i].ballAngle, speed));
      }
    }
    
  }

    


  private void draw() {
    render();
    bounce();
  }
}
