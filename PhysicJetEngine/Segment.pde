class Segment extends EngineObject {
  
  PVector pA;
  PVector pB;
  
  Segment(PVector start, PVector end, float mass){
    super(start, mass);
    pA = start;
    pB = end;
  }
  
  Segment(float x1, float y1, PVector end, float mass){
    super(new PVector(x1, y1), mass);
    pA = new PVector(x1, y1);
    pB = end;
  }
  
  Segment(PVector start, float x2, float y2, float mass){
    super(start, mass);
    pA = start;
    pB = new PVector(x2, y2);
  }
  
  Segment(float x1, float y1, float x2, float y2, float mass){
    super(new PVector(x1, y1), mass);
    pA = new PVector(x1, y1);
    pB = new PVector(x2, y2);
  }
  
  void update(float drag){
    pA.add(vel);
    pB.add(vel);
    vel.add(acc);
    vel.mult(drag);
    acc.mult(0);
    pos = pA;
  }
  
  void show(){
    stroke(255);
    strokeWeight(1);
    line(pA.x, pA.y, pB.x, pB.y);
  }
  
  float length(){
    return dist(pA.x, pA.y, pB.x, pB.y);
  }
  
  boolean collides(EngineObject o){
    String type = o.getClass().toString();
    boolean output = false;
    switch(type){
      case "class PhysicJetEngine$Circle":
        output = collides((Circle) o);
      break;
      case "class PhysicJetEngine$Point":
        output = collides((Point) o);
      break;
      case "class PhysicJetEngine$Polygon":
        output = collides((Polygon) o);
      break;
      case "class PhysicJetEngine$Rectangle":
        output = collides((Rectangle) o);
      break;
      case "class PhysicJetEngine$Segment":
        output = collides((Segment) o);
      break;
    }
    return output;
  }
  
  boolean collides(Segment s){ //Sgmt-sgmt
    
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
  
  boolean collides(Rectangle r){ //Sgmt-rect
    Segment[] sides = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Polygon p){ //Sgmt-poly
    Segment[] sides = p.sides;
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Point p){ //Sgmt-point
    float l = this.length();
    float d1 = dist(pA.x, pA.y, p.pos.x, p.pos.y);
    float d2Sq = distSq(pB.x, pB.y, p.pos.x, p.pos.y);
    float d2SqWhenIntersects = pow((l - d1), 2);
    return d2Sq == d2SqWhenIntersects;
  }
  
  boolean collides(PVector v){ //Sgmt-point
    float l = this.length();
    float d1 = dist(pA.x, pA.y, v.x, v.y);
    float d2Sq = distSq(pB.x, pB.y, v.x, v.y);
    float d2SqWhenIntersects = pow((l - d1), 2);
    return d2Sq == d2SqWhenIntersects;
  }
  
  boolean collides(Circle crcl){ //Sgmt-crcl
    if((crcl.collides(pA) && !crcl.collides(pB)) || (!crcl.collides(pA) && crcl.collides(pB))){
      return true;
    } else if(crcl.collides(pA) && crcl.collides(pB)){
      return false;
    } else {
      Segment cs = new Segment(pA, crcl.pos, 0);
      PVector cv = new PVector(cs.pB.x - cs.pA.x, cs.pB.y - cs.pA.y);
      PVector bv = new PVector(pB.x - pA.x, pB.y - pA.y);
      
      float theta = PVector.angleBetween(cv, bv);
      float c = cs.length();
      float a = c * sin(theta);
      
      boolean condition1 = a <= crcl.r;
      
      
      PVector cv_inv = new PVector(cs.pA.x - cs.pB.x, cs.pA.y - cs.pB.y);
      Segment c2s = new Segment(pB, crcl.pos, 0);
      PVector c2v = new PVector(c2s.pA.x - c2s.pB.x, c2s.pA.y - c2s.pB.y);
      
      float angle1 = PVector.angleBetween(bv, cv_inv);
      float cos1 = cos(angle1);
      float angle2 = PVector.angleBetween(bv, c2v);
      float cos2 = cos(angle2);
      
      boolean condition2 = cos1 * cos2 < 0;
      
      
      //// Uncomment to display orange bv & cv
      ////
      //strokeWeight(1);
      //stroke(255, 128, 0);
      //line(pA.x, pA.y, pA.x + cv.x, pA.y + cv.y);
      //line(pA.x, pA.y, pA.x + bv.x, pA.y + bv.y);
      ////
      
      return condition1 && condition2;
    }
  }
}