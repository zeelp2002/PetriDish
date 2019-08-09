/**
 * Assignment: [Petri Dish]
 * Author: [Zeel Patel]
 * Date: [May 29, 2018]
 * Description: [Properties of the container.]
 */
 
 class dish {
  float xPos;
  float yPos; 
  color Color;
  float dishSize;

  dish () {
    xPos = width/2;
    yPos = height/2;
    Color=#FFFFFF;
    dishSize=500;
  }

  void display() {
    
    fill(Color);
    ellipse(xPos, yPos, dishSize, dishSize);
  }
}
