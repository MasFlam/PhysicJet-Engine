class Point extends EngineObject {
  
  Point(PVector position, float mass){
    super(position, mass);
  }
  
  Point(float x, float y, float mass){
    super(new PVector(x, y), mass);
  }
  
  void show(){
    stroke(255);
    strokeWeight(2);
    point(pos.x, pos.y);
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
  
  boolean collides(Segment s){ //Point-sgmt
    float l = s.length();
    float d1 = dist(s.pA.x, s.pA.y, this.pos.x, this.pos.y);
    float d2Sq = distSq(s.pB.x, s.pB.y, this.pos.x, this.pos.y);
    float d2SqWhenIntersects = pow((l - d1), 2);
    return d2Sq == d2SqWhenIntersects;
  }
  
  boolean collides(Rectangle r){ //Point-rect
    Segment[] sides = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Polygon p){ //Point-poly
    Segment[] sides = p.sides;
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Point p){ //Point-point
    return p.pos.x == pos.x && p.pos.y == pos.y;
  }
  
  boolean collides(PVector v){ //Point-point
    return v.x == pos.x && v.y == pos.y;
  }
  
  boolean collides(Circle crcl){ //Point-crcl
    if(dist(pos.x, pos.y, crcl.pos.x, crcl.pos.y) <= crcl.r){
      return true;
    } else {
      return false;
    }
  }
  
}