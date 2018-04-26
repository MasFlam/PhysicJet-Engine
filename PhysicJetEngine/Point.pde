class Point {
  
  PVector pos;
  
  Point(PVector position){
    pos = position;
  }
  
  Point(float x, float y){
    pos = new PVector(x, y);
  }
  
  void show(){
    stroke(255);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
  
}