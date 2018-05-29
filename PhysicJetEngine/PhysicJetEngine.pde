Engine world;
boolean temp = false;

void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  background(0);
  
  world = new Engine(new PVector(0, 0.5), 0.98);
  world.push(new Circle(200, 200, 40, 1.1), new Segment(100, 420, 440, 42, 0.7), new Point(320, 240, 1.8));
}

void mousePressed(){
  temp = true;
}

void draw(){
  background(0);
  if(temp) world.update();
  world.show();
}

float distSq(float x1, float y1, float x2, float y2){
  float a = x1 - x2;
  float b = y1 - y2;
  float cSq = pow(a, 2) + pow(b, 2);
  return cSq;
}