/**

 * Description: [Properties of the button and declaring the button position, colour and the text written on the buttons.]
 */
 
 Button StartStop=new Button();
Button reset= new Button();
Button ballUp= new Button();
Button ballDown =new Button();
Button increaseSpeed= new Button();
Button decreaseSpeed= new Button();
String startStop="Start/Stop";
String Reset="Reset";
String BallUp="+# of Balls";
String BallDown="-# of Balls";
String IncreaseSpeed="+Speed";
String DecreaseSpeed="-Speed";

class Button {
  int mXCoord, mYCoord;
  int mWidth, mHeight;
  color mBGColor;
  color mBorderColor;

  Button() {
    mXCoord = mYCoord = 0;
    mWidth = mHeight = 0;
    mBGColor = #FFFFFF;
    mBorderColor = #FA480D;
  }

  void setSize ( int w, int h) {
    mWidth = w;
    mHeight = h;
  }

  void setPosition ( int x, int y) {
    mXCoord = x;
    mYCoord = y;
  }

  boolean isInside ( int x, int y) {
    if ( x > mXCoord && x < (mXCoord + mWidth) ) {
      if ( y > mYCoord && mYCoord < (mYCoord + mHeight) ) {
        return true;
      }
    }
    return false;
  }
  private void drawBackground() {
    fill(mBGColor);
    stroke(mBGColor);
    rect(mXCoord, mYCoord, mWidth, mHeight);
  }

  private void drawBorder() {
    stroke(mBorderColor);
    noFill();
    rect(mXCoord, mYCoord, mWidth, mHeight);
  }

  private void drawLabel() {
    fill(255, 0, 0);
    text(startStop, 35, 50);
    text(Reset, 35, 130);
    text(BallUp, 35, 220);
    text(BallDown, 35, 300);
    text(IncreaseSpeed, 35, 370);
    text( "-Speed", 35, 440);
  }

  void draw() {
    drawBackground();
    drawBorder();
    drawLabel();

    fill(mBGColor);
    stroke(mBGColor);
    rect(mXCoord, mYCoord, mWidth, mHeight);
    stroke(mBorderColor);
    noFill();
    rect(mXCoord, mYCoord, mWidth, mHeight);
  }
  
}
