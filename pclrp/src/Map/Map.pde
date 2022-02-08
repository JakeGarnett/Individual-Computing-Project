boolean drawn;
final int WPSIZE=15;
Waypoint[] Waypoints;
int numWaypoints;
PFont f;
void setup()
{
  
  
  size(1000,1000);
  String [] fileLines=loadStrings("../../instances/pclrp01.csv");
  numWaypoints=fileLines.length;
  Waypoints=new Waypoint[numWaypoints];
  f= createFont("Arial", 16, true);
    
  for (int counter=0; counter<numWaypoints; counter++)
  {
    String thisWaypoint=fileLines[counter];
    int [] coords=int(split(thisWaypoint, ","));
    int thisX=coords[0];
    int thisY=coords[1];
    int thisV=coords[2];
    Waypoints[counter]=new Waypoint(thisX, thisY,thisV);
    println("Waypoint: "+counter+" is at X="+thisX+", Y="+thisY + " With a value of: " + thisV);
  }
}

void draw()
{
  if (!drawn)
  {
    for (int counter=0; counter<numWaypoints; counter++)
    {
      Waypoints[counter].draw();
    }
    drawn=true;
  }
}

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
      int r = 10;
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
