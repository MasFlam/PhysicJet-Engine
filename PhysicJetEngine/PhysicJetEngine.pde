Circle circleTest;
Point pointTest;
Segment segmentTest;

void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  circleTest = new Circle(50, 50, 15);
  pointTest = new Point(100, 50);
  segmentTest = new Segment(125, 50, 175, 50);
}

void draw(){
  background(0);
  circleTest.show();
  pointTest.show();
  segmentTest.show();
}