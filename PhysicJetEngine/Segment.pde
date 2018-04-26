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
}