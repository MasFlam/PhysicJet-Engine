class Segment {
  
  PVector pA;
  PVector pB;
  
  Segment(PVector start, PVector end){
    pA = start;
    pB = end;
  }
  
  Segment(float x1, float y1, PVector end){
    pA = new PVector(x1, y1);
    pB = end;
  }
  
  Segment(PVector start, float x2, float y2){
    pA = start;
    pB = new PVector(x2, y2);
  }
  
  Segment(float x1, float y1, float x2, float y2){
    pA = new PVector(x1, y1);
    pB = new PVector(x2, y2);
  }
  
  void show(){
    stroke(255);
    strokeWeight(1);
    line(pA.x, pA.y, pB.x, pB.y);
  }
  
  float length(){
    return dist(pA.x, pA.y, pB.x, pB.y);
  }
  
  boolean intersects(Segment s){ // Line-line
    
    //This ingenious vector-based solution is from the answer of Jason Cohen from Stack Overflow to the question #563198:
    
    PVector e = PVector.sub(pB, pA);
    PVector f = PVector.sub(s.pB, s.pA);
    PVector p = new PVector(-e.y, e.x);
    PVector tmp = PVector.sub(pA, s.pA);
    float tmp2 = tmp.x*p.x + tmp.y*p.y;
    float tmp3 = f.x*p.x + f.y*p.y;
    if(tmp3 == 0){
      return false; // Collinear of parallel
    } else {
      float h = tmp2 / tmp3;
      if(h >= 0 && h <= 1){
        return true;
      } else {
        return false;
      }
    }
  }
  
  boolean intersects(Rectangle r){ //Line-rect
    Segment[] sides = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(Polygon p){ //Line-poly
    Segment[] sides = p.sides;
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(Point p){ //Line-point
    float l = this.length();
    float dSq1 = distSq(pA.x, pA.y, p.pos.x, p.pos.y);
    float dSq2 = distSq(pB.x, pB.y, p.pos.x, p.pos.y);
    return l == (dSq1 + dSq2);
  }
}