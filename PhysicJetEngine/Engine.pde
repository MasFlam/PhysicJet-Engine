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
      o.applyGravity(gravity.copy());
      o.update(drag);
    }
    
    for(int i = 0; i < tempObjects.size(); i++){
      for(int j = 0; j < tempObjects.size(); j++){
        EngineObject o1 = tempObjects.get(i);
        EngineObject o2 = tempObjects.get(j);
        
        if(o1.collides(o2) && i != j){
          
          println("collision between " + o1.getClass().toString() + " and " + o2.getClass().toString());
          
          boolean o1static = o1.flags.contains("static");
          boolean o2static = o2.flags.contains("static");
          
          if(!o1static) o1.vel.mult(1); else o2.vel.mult(-0.5);
          if(!o2static) o2.vel.mult(-1.05); else o1.vel.mult(-1.5);
          
          println(o1static, o2static);
          
          objects.set(i, o1);
          objects.set(j, o2);
        } else if(i != j) println("no collision between " + o1.getClass().toString() + " and " + o2.getClass().toString());
      }
    }
  }
  
  void update(){
    manageCollisions();
    
    for(EngineObject o : objects){
      if(!o.flags.contains("static")) o.applyGravity(gravity.copy());
      if(!o.flags.contains("static")) o.update(drag);
    }
  }
  
  void push(EngineObject... os){
    for(EngineObject o : os){
      objects.add(o);
    }
  }
  
}