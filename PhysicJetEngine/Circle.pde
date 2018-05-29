class Circle extends EngineObject {
  
  float r;
  
  Circle(PVector position, float radius, float mass){
    super(position, mass);
    r = radius;
  }
  
  Circle(float x, float y, float radius, float mass){
    super(new PVector(x, y), mass);
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
  
  boolean collides(Point p){ //Crcl-point
    return collides(p.pos.x, p.pos.y);
  }
  
  boolean collides(PVector v){ //Crcl-point
    return collides(v.x, v.y);
  }
  
  boolean collides(float x, float y){ //Crcl-point
    if(dist(x, y, this.pos.x, this.pos.y) <= this.r){
      return true;
    } else {
      return false;
    }
  }
  
  boolean collides(Circle crcl){ //Crcl-crcl
    if(dist(pos.x, pos.y, crcl.pos.x, crcl.pos.y) <= (this.r + crcl.r)){
      return true;
    } else {
      return false;
    }
  }
  
  boolean collides(Segment s){
    return s.collides(this);
  }
  
}