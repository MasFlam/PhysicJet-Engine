class Polygon extends EngineObject {
  
  Segment[] sides;
  
  Polygon(float mass, boolean complete, Segment... segments){
    super(segments[0].pos, mass);
    if(complete){
      Segment temp = new Segment(segments[segments.length-1].pB, segments[0].pA, 0);
      sides = (Segment[]) concat(segments, new Segment[]{ temp });
    } else {
      sides = segments;
    }
  }
  
  void show(){
    for(int i = 0; i < sides.length; i++){
      sides[i].show();
    }
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
  
  boolean collides(Circle c){ //Poly-crcl
    return c.collides(this);
  }
  
  boolean collides(Segment s){ //Poly-sgmt
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(s)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Rectangle r){ //Poly-rect
    Segment[] sidesP = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesP.length; j++){
        if(sides[i].collides(sidesP[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean collides(Polygon p){ //Poly-poly
    Segment[] sidesP = p.sides;
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesP.length; j++){
        if(sides[i].collides(sidesP[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean collides(Point p){ //Poly-point
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(p)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(PVector v){ //Poly-point
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(v)){
        return true;
      }
    }
    return false;
  }
  
}