class Rectangle extends EngineObject {
  
  float w, h;
  
  Rectangle(PVector position, float wdth, float hght, float mass){
    super(position, mass);
    w = wdth;
    h = hght;
  }
  
  Rectangle(float x, float y, float wdth, float hght, float mass){
    super(new PVector(x, y), mass);
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
    sides[0] = new Segment(pos, pos.x + w, pos.y, mass/4);
    sides[1] = new Segment(pos.x + w, pos.y, pos.x + w, pos.y + h, mass/4);
    sides[2] = new Segment(pos.x + w, pos.y + h, pos.x, pos.y + h, mass/4);
    sides[3] = new Segment(pos.x, pos.y + h, pos, mass/4);
    return sides;
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
  
  boolean collides(Circle c){ //Rect-crcl
    return c.collides(this);
  }
  
  boolean collides(Segment s){ //Rect-sgmt
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(s)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Rectangle r){ //Rect-rect
    Segment[] sides = this.getSidesAsSegmentArray();
    Segment[] sidesR = r.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      for(int j = 0; j < sidesR.length; j++){
        if(sides[i].collides(sidesR[j])){
          return true;
        }
      }
    }
    return false;
  }
  
  boolean collides(Polygon p){ //Rect-poly
    Segment[] sides = this.getSidesAsSegmentArray();
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
  
  boolean collides(Point p){ //Rect-point
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(p)){
        return true;
      }
    }
    return false;
  }
  
  boolean collides(PVector v){ //Rect-point
    Segment[] sides = this.getSidesAsSegmentArray();
    for(int i = 0; i < sides.length; i++){
      if(sides[i].collides(v)){
        return true;
      }
    }
    return false;
  }
  
}