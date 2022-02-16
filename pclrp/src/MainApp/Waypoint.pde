class Waypoint 
{
  int x;
  int y;
  int v;
  
  Waypoint(int Xcoord, int Ycoord, int Value)
  {
    x=Xcoord;
    y=Ycoord;
    v=Value;
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
      strokeWeight(2);
      fill(255);
      triangle(ax,ay,bx,by,cx,cy);
    }
    else{
      fill(0);
      textFont(f);
      text(v,x -5, y - 20);
      ellipse(x,y,WPSIZE,WPSIZE);
    }
  }
}
    
    
  
