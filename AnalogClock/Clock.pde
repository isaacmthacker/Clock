class Clock {
  int hours;
  int minutes;
  int seconds;
  float x;
  float y;
  float radius;
  color[] colors = {color(255), color(255, 0, 0), color(0, 255, 0), 
    color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), 
    color(0, 255, 255)};
  int lenCol = 7;
  int colIdx = 0;
  color c;
  Clock() {
    update();
    x = width/2.0;
    y = width/2.0;
    radius = width/2.0-10;
    c = colors[colIdx];
  }
  void update() {
    hours = hour();
    minutes = minute();
    seconds = second();
  }
  void drawTicks(float sizeOfTick, float step, float strokeSize) {
    strokeWeight(strokeSize);
    strokeCap(SQUARE);
    for (float angle = 0.0; angle < 2*PI; angle += step) {
      float x1 = x + radius*cos(angle);
      float y1 = y + radius*sin(angle);
      float x2 = x + (radius-sizeOfTick)*cos(angle);
      float y2 = y + (radius-sizeOfTick)*sin(angle);
      //fill(255, 0, 0);
      //ellipse(x1, y1, 10, 10);
      line(x1, y1, x2, y2);
    }
  }
  void ticks() {
    float smallTick = 20;
    float bigTick = 30;
    drawTicks(smallTick, 2*PI/60.0, 1);
    drawTicks(bigTick, 2*PI/12.0, 5);
  }
  void drawHelper(float size, float angle, float strokeSize) {
    strokeCap(ROUND);
    strokeWeight(strokeSize);
    line(x, y, x+size*cos(angle-PI/2.0), y+size*sin(angle-PI/2.0));
  }
  void drawHour() {
    float sizeOfHour = radius/2.0;
    //hours %= 12;
    float offset = (2*PI/12.0)*(minutes/60.0);
    float angle = (2*PI/12.0) * hours + offset;
    //println("angle " + angle);
    drawHelper(sizeOfHour, angle, 5);
  }
  void drawMin() {
    float sizeOfMin = radius-40;
    float offSet = (2*PI/60.0) * (seconds/60.0); 
    float angle = (2*PI/60.0) * minutes + offSet;
    drawHelper(sizeOfMin, angle, 5);
  }
  void drawSec() {
    float sizeOfSec = radius-40;
    float angle = 2*PI/60.0 * seconds;
    drawHelper(sizeOfSec, angle, 1);
  }
  void display() {
    update();
    stroke(c);
    noFill();
    ellipse(x, y, 2*radius, 2*radius);
    fill(c);
    ellipse(x, y, 4, 4);
    ticks();
    //print();
    drawHour();
    drawMin();
    drawSec();
    //line(0, height/2.0, width, height/2.0);
    //line(width/2.0, 0, width/2.0, height);
  }
  void changeColor() {
    colIdx += 1;
    colIdx %= lenCol;
    c = colors[colIdx];
  }
  void print() {
    println(hours, minutes, seconds);
  }
}