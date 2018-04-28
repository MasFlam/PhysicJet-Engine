
void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
}

void draw(){
  background(0);
}

float distSq(float x1, float y1, float x2, float y2){
  float a = x1 - x2;
  float b = y1 - y2;
  float cSq = pow(a, 2) + pow(b, 2);
  return cSq;
}