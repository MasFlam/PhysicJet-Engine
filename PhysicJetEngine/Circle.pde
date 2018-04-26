class Circle {
  
  float r;
  PVector pos;
  
  Circle(PVector position, float radius){
    pos = position;
    r = radius;
  }
  
  Circle(float x, float y, float radius){
    pos = new PVector(x, y);
    r = radius;
  }
  
  void show(){
    noFill();
    stroke(255);
    strokeWeight(1);
    ellipse(pos.x, pos.y, r, r);
  }
  
}