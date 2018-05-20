Circle c;
Segment s;

void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  background(0);
  
  s = new Segment(400, 256, 50, 300);
  c = new Circle(600, 230, 67);
}

void draw(){
  background(0);
  c.pos = new PVector(mouseX, mouseY);
  
  s.show();
  c.show();
  println(c.intersects(s));
}

float distSq(float x1, float y1, float x2, float y2){
  float a = x1 - x2;
  float b = y1 - y2;
  float cSq = pow(a, 2) + pow(b, 2);
  return cSq;
}