class Waypoint 
{
  int WPSIZE = 15;
  int x;
  int y;
  int v;
  boolean Selected;
  Waypoint(int Xcoord, int Ycoord, int Value, boolean Visited)
  {
    x=Xcoord;
    y=Ycoord;
    v=Value;
    Selected = false;
    Visited = false;
  }
  
  void draw()
  {
    
    stroke(0);
    if (v == -1)
    {
      //x,y = center point
       //initilize triangle coords
      int ax = x;
      int ay = y - WPSIZE;
      int bx = x - WPSIZE;
      int by = y + WPSIZE;
      int cx = x+WPSIZE;
      int cy = y+WPSIZE;
      strokeWeight(1);
      fill(255);
      
      triangle(ax,ay,bx,by,cx,cy);
    }
    else{
     
      fill(100);
      textFont(f,16);
      text(v,x -5, y - 20);
      ellipse(x,y,WPSIZE,WPSIZE);
      
    }
  }
}
    
    
  
