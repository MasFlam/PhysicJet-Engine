class Point {
  
  PVector pos;
  
  Point(PVector position){
    pos = position;
  }
  
  Point(float x, float y){
    pos = new PVector(x, y);
  }
  
  void show(){
    stroke(255);
    strokeWeight(2);
    point(pos.x, pos.y);
  }
  
  boolean intersects(Segment s){ //Point-sgmt
    float l = s.length();
    float d1 = dist(s.pA.x, s.pA.y, this.pos.x, this.pos.y);
    float d2Sq = distSq(s.pB.x, s.pB.y, this.pos.x, this.pos.y);
    float d2SqWhenIntersects = pow((l - d1), 2);
    return d2Sq == d2SqWhenIntersects;
  }
  
  boolean intersects(Rectangle r){ //Point-rect
    Segment[] sides = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(Polygon p){ //Point-poly
    Segment[] sides = p.sides;
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(this)){
        return true;
      }
    }
    return false;
  }
  
  boolean isIdentical(Point p){ //Point-point
    return p.pos.x == pos.x && p.pos.y == pos.y;
  }
  
  boolean isIdentical(PVector v){ //Point-point
    return v.x == pos.x && v.y == pos.y;
  }
  
  boolean inside(Circle crcl){ //Point-crcl
    if(dist(pos.x, pos.y, crcl.pos.x, crcl.pos.y) <= crcl.r){
      return true;
    } else {
      return false;
    }
  }
  
}