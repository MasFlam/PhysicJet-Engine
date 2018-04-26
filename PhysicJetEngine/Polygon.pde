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
  
}