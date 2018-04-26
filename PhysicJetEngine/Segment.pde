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
    //Calculate angle between this & x axis
    pushMatrix();
    translate(pA.x, pA.y);
    float theta = atan(pB.y / pB.x);
    popMatrix();
    //Calculate angle between s & x axis
    pushMatrix();
    translate(s.pA.x, s.pA.y);
    float thetaS = atan(s.pB.y / s.pB.x);
    popMatrix();
    //Check if angle is the same - segments are paralell or collinear
    if(theta == thetaS){
      return true;
    } else {
      //Rotate by theta - make this segment parallel with x axis
      rotate(theta);
      Point intersectionPoint = new Point(0, pA.y);
    }
    
    return true;
  }
}