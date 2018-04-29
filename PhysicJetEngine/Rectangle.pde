class Rectangle {
  
  PVector pos;
  float w, h;
  
  Rectangle(PVector position, float wdth, float hght){
    pos = position;
    w = wdth;
    h = hght;
  }
  
  Rectangle(float x, float y, float wdth, float hght){
    pos = new PVector(x, y);
    w = wdth;
    h = hght;
  }
  
  void show(){
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(pos.x, pos.y, w, h);
  }
  
  Segment[] getSidesAsSegmentArray(){
    Segment[] sides = new Segment[4];
    sides[0] = new Segment(pos, pos.x + w, pos.y);
    sides[1] = new Segment(pos.x + w, pos.y, pos.x + w, pos.y + h);
    sides[2] = new Segment(pos.x + w, pos.y + h, pos.x, pos.y + h);
    sides[3] = new Segment(pos.x, pos.y + h, pos);
    return sides;
  }
  
  boolean intersects(Segment s){ //Rect-sgmt
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(s)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(Rectangle r){ //Rect-rect
    Segment[] sides = this.getSidesAsSegmentArray();
    Segment[] sidesR = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesR.length; j++){
        if(sides[i].intersects(sidesR[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean intersects(Polygon p){ //Rect-poly
    Segment[] sides = this.getSidesAsSegmentArray();
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
  
  boolean intersects(Point p){ //Rect-point
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(p)){
        return true;
      }
    }
    return false;
  }
  
  boolean intersects(PVector v){ //Rect-point
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].intersects(v)){
        return true;
      }
    }
    return false;
  }
  
}