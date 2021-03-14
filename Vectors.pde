/**
 * Description: Implements a directional vector 
 *              This class can be used with any "Sprite" to implement movement
 *              Direction is specified in degrees as follows:
 *                               270
 *                                |
 *                          180 --  -- 0
 *                                |
 *                                90
 */

class Vector90 {

  float dir;             // direction in degrees, 3 o'clock is 0 deg
  float mag;             // magnitude in pixels
  float speed;           // speed of movement, each millisecond

  // constructor
  Vector90(float d, float sp) {
    setDirection(d);
    setSpeed(sp);
  }

  // sets the speed, should be in pixels/ms
  void setSpeed(float sp) {
    speed=sp;
  }

  // sets the direction, given in degrees, 0 degrees is at 12 o'clock, angles are
  // expressed clockwise
  void setDirection(float d) {
    dir = d;
    //println("[Vector90::setDirection()] dir=" + dir + "deg");
  }
  void setMagnitude(float m) {
    mag = m;
  }

  // returns the direction in degrees.
  float getDirection() {
    return dir;
  }

  // returns the radians for the current direction setting
  protected float getDirectionRadians() {
    float rad = radians(getDirection());
    //println([Vector90::getDirectionRadians()] + " degrees is " + rad + " radians");
    return rad;
  }

  // computes the next set of coordinates during a move

  int getHorizontalMove(int time) {
    float vectDisplacement = time * speed;
    float displacement = cos(getDirectionRadians()) * vectDisplacement;
    return (int)displacement;
  }

  // computes the next set of coordinates during a move

  int getVerticalMove(int time) {
    float vectDisplacement = time * speed;
    float displacement = sin(getDirectionRadians()) * vectDisplacement;
    //println("[Vector90::getVerticalMove()]: " + displacement);
    return (int)displacement;
  }

  // computes the actual number of pixels moved from the movement size on the
  // x and y components
  int getXYMove( int x, int y) {
    return (int) sqrt( (x*x) + (y*y) );
  }
  // returns 'true' if "pix" is less than the current magnitude
}
