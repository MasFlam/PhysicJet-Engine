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
  
  boolean intersects(Segment s){
    ////Calculate angle between this & x axis
    //pushMatrix();
    //translate(pA.x, pA.y);
    //float theta = atan(pB.y / pB.x);
    //popMatrix();
    ////Calculate angle between s & x axis
    //pushMatrix();
    //translate(s.pA.x, s.pA.y);
    //float thetaS = atan(s.pB.y / s.pB.x);
    //popMatrix();
    ////Check if angle is the same - segments are parallel or collinear
    //if(theta == thetaS){
    //  return true;
    //} else {
    //  //Rotate by theta - make this segment parallel with x axis
    //  pushMatrix();
    //  translate(pA.x, pA.y);
    //  float r = sqrt(pow(pB.x, 2) + pow(pB.y, 2));
    //  popMatrix();
      
    //  Point intersectionPoint = new Point(0, pA.y);
    //}
    
    //This ingenious vector-based solution is fro the answer of Jason Cohen from Stack Overflow to the question #563198:
    
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
}