Clock clock;

void setup() {
  size(500, 500);
  clock = new Clock();
}

void draw() {
  background(0);
  clock.display();
}

void mousePressed() {
  clock.changeColor();
}