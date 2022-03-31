class Waypoint{
  
  int x,y,v,size,count;
  
  boolean UAVvisited,penalty,countBool;
  
  Waypoint(int xCoord, int yCoord, int value, boolean visited){
    
    size = 10;
    x = xCoord;
    y =yCoord;
    v = value;
    UAVvisited = visited;
    penalty = true;
    countBool = true;
  
  }
  
  void draw(){
  
    
   
    
    if (v == -1)
    {
      UAVvisited = false;
      //x,y = center point
       //initilize triangle coords
      int ax = x;
      int ay = y - size;
      int bx = x - size;
      int by = y + size;
      int cx = x+size;
      int cy = y+size;
      //noStroke();
      fill(255);
      
      triangle(ax,ay,bx,by,cx,cy);
    }
    else{
      
       if (UAVvisited == true){
      penalty = true;
      
      if (penalty == true){
        count += 1;
        //println(count);
          penalty = false;
           UAVvisited = false;
      }
      if (count > 1){
             println("UAV Visited"); 
             score -= 50;
       }
    }
     
      //fill(100);
      textFont(f,16);
      text(v,x -5, y - 20);
      //noStroke();
      ellipse(x,y,size,size);
      
    }
  }
  
}
