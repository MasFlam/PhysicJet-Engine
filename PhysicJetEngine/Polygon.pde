class Polygon {
  
  Segment[] sides;
  
  Polygon(boolean complete, Segment... segments){
    if(complete){
      Segment temp = new Segment(segments[segments.length-1].pB, segments[0].pA);
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
  
  boolean intersects(Segment s){ //Poly-sgmt
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(s)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(Rectangle r){ //Poly-rect
    Segment[] sidesP = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesP.length; j++){
        if(sides[i].intersects(sidesP[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean intersects(Polygon p){ //Poly-poly
    Segment[] sidesP = p.sides;
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesP.length; j++){
        if(sides[i].intersects(sidesP[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean intersects(Point p){ //Poly-point
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(p)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(PVector v){ //Poly-point
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(v)){
        return true;
      }
    }
    return false;
  }
  
}