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
    
    strokeWeight(1);
    stroke(255, 0, 0);
    line(pos.x, pos.y, pos.x + r, pos.y);
    
    strokeWeight(5);
    stroke(255);
    point(pos.x, pos.y);
    
  }
  
  boolean inside(Point p){ //Crcl-point
    return inside(p.pos.x, p.pos.y);
  }
  
  boolean inside(PVector v){ //Crcl-point
    return inside(v.x, v.y);
  }
  
  boolean inside(float x, float y){ //Crcl-point
    if(dist(x, y, this.pos.x, this.pos.y) <= this.r){
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersects(Circle crcl){ //Crcl-crcl
    if(dist(pos.x, pos.y, crcl.pos.x, crcl.pos.y) <= (this.r + crcl.r)){
      return true;
    } else {
      return false;
    }
  }
  
}