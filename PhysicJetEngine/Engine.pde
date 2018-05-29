class Engine {
  
  ArrayList<EngineObject> objects;
  PVector gravity;
  float drag;
  
  Engine(PVector gravity, float dragForce){
    objects =  new ArrayList<EngineObject>();
    this.gravity = gravity;
    drag = dragForce;
  }
  
  void show(){
    for(EngineObject o : objects){
      o.show();
    }
  }
  
  void manageCollisions(){
    ArrayList<EngineObject> tempObjects = objects;
    
    for(EngineObject o : tempObjects){
      o.applyForce(gravity.copy().mult(o.mass));
      o.update(drag);
    }
    
    for(int i = 0; i < tempObjects.size(); i++){
      for(int j = 0; j < tempObjects.size(); j++){
        EngineObject o1 = tempObjects.get(i);
        EngineObject o2 = tempObjects.get(j);
        if(o1.collides(o2)){
          //o1.vel.mult(-0.5);
          //o2.vel.mult(-0.5);
          
          objects.get(i).applyCoefficient(-0.5);
          objects.get(j).applyCoefficient(-0.5);
        }
      }
    }
  }
  
  void update(){
    for(EngineObject o : objects){
      o.applyForce(gravity.copy().mult(o.mass));
      o.update(drag);
    }
  }
  
  void push(EngineObject... os){
    for(EngineObject o : os){
      objects.add(o);
    }
  }
  
}