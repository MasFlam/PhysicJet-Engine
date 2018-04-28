Circle circleTest;
Point pointTest;
Segment segmentTest;
Segment segmentCollisionTest;
Rectangle rectangleTest;
Polygon polygonTest;

void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  circleTest = new Circle(50, 50, 25);
  pointTest = new Point(100, 50);
  segmentTest = new Segment(125, 50, 175, 50);
  segmentCollisionTest = new Segment(125, 25, 175, 50);
  println(segmentTest.intersects(segmentCollisionTest));
  rectangleTest = new Rectangle(200, 25, 50, 50);
  polygonTest = new Polygon(true, new Segment(100, 100, 150, 120), new Segment(150, 120, 130, 150));
  
}

void draw(){
  background(0);
  circleTest.show();
  pointTest.show();
  segmentTest.show();
  segmentCollisionTest.show();
  rectangleTest.show();
  polygonTest.show();
}