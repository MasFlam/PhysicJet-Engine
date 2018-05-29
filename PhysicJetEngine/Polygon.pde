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