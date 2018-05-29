class EngineObject { // Proto-class for engine objects
  
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float coefficient;
  
  float mass = 0;
  
  EngineObject(PVector position, float mass){
    pos = position;
    this.mass = mass;
  }
  
  void update(float drag){
    pos.add(vel);
    vel.mult(drag * coefficient);
    vel.add(acc);
    acc.mult(0);
    coefficient = 0;
  }
  
  void show(){
    
  }
  
  boolean collides(EngineObject o){
    return pos.x == o.pos.x && pos.y == o.pos.y;
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void applyCoefficient(float coeff){
    coefficient = coeff;
  }
  
}