/**
 * Assignment: [Petri Dish]
 * Date: [May 29, 2018]
 * Author: [Zeel Patel]
 * Description: Uses physics to bounce the balls off one another
 */
 
 class Physics {
  float pushX, pushY, dir;
  float markX = 0, markY = 0;
   float h = abs(500);
  Physics() {
  }
  void borderCollision(float x, float y, int r, float d) {
    if (dist(x, y, width / 2, height / 2) >= 250 - r) {
      pushX = markX;
      pushY = markY;
      dir = atan(dist(x, y, width /2, height / 2)) - radians(90) - d;
    } else {
      markX = x;
      markY = y;
    }
  }
  void ballCollison(float x, float y, float oX, float oY, float r, float d) {
    if (dist(x, y, oX, oY) <= r * 2) {
      dir = atan(dist(x, y, oX, oY)) - radians(180) - d;
      dir = random(h * -1);
    }
  }
  float dir() {
  return dir;
  }
  float pushbackX() {
    return pushX;
  }
  float pushbackY() {
    return pushY;
  }
}
