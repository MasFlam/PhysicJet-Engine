abstract class EngineObject { // Proto-class for engine objects
  
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  ArrayList<String> flags;
  
  float mass = 0;
  
  EngineObject(PVector position, float mass){
    pos = position;
    this.mass = mass;
    
    flags = new ArrayList<String>();
  }
  
  void update(float drag){
    pos.add(vel);
    vel.add(acc);
    vel.mult(drag);
    acc.mult(0);
    if(vel.mag() < 0.001) vel = new PVector(0, 0);
  }
  
  EngineObject addFlag(String flag){
    flags.add(flag);
    return this;
  }
  
  abstract void show();
  
  abstract boolean collides(Circle c);
  
  abstract boolean collides(Point p);
  
  abstract boolean collides(Polygon p);
  
  abstract boolean collides(Rectangle r);
  
  abstract boolean collides(Segment s);
  
  abstract boolean collides(EngineObject o);
  
  void applyGravity(PVector gravity){
    acc.add(gravity.mult(mass));
  }
  
  void applyForce(PVector force){
    if(mass != 0) {
      acc.add(force.div(mass));
    }
  }
  
  void attract(PVector point){
    applyForce(point.sub(pos.copy()).mult(dist(point.x, point.y, pos.x, pos.y) * 0.00001));
  }
  
}