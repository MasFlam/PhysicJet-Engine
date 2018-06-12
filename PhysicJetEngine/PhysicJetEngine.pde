Engine world;
boolean temp = false;

void setup(){
  size(640, 480);
  ellipseMode(RADIUS);
  background(0);
  
  world = new Engine(new PVector(0, 0.1), 0.98);
  world.push(new Circle(240, 100, 40, 1.1), new Circle(100, 70, 42, 0.7));//, new Point(320, 240, 1.8));
  world.push(new Rectangle(0, 0, width, height, 0).addFlag("static"));
  world.objects.get(0).applyForce(new PVector(-4, 0));
  //println(world.objects.get(0).collides(world.objects.get(1)));
}

void mousePressed(){
  temp = true;
  
  world.push(new Circle(mouseX, mouseY, random(35, 55), random(0.8, 1.1)));
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