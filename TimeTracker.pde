/**
 * Assignment: Generic Code
 * Author: Mr. Petres
 * Description: Implements a time tracker which has the resolution in millis
 */

class TimeTracker {
  int last; // this variable keeps the last system time when we mark()-ed

  // constructor
  TimeTracker() {
    mark();
  }

  // sets the internal marker to the current millis
  void mark() {
    last = millis();
  }

  // returns the elapsed time between the last mark and the current millis
  int getElapsed() {
    int curr = millis();
    //println("TimeTracker elapsed:"+(curr-last));
    return (curr-last);
  }
}
