
void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  background(0);
  
  Segment s = new Segment(400, 256, 50, 300);
  Circle c = new Circle(217, 240, 67);
  s.show();
  c.show();
  println(s.intersects(c));
}

void draw(){
  //background(0);
}

float distSq(float x1, float y1, float x2, float y2){
  float a = x1 - x2;
  float b = y1 - y2;
  float cSq = pow(a, 2) + pow(b, 2);
  return cSq;
}