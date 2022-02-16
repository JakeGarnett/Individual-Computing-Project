class Tour
{

  int r;
  int g;
  int b;
  
  int [] tourIndices;
  
  Tour(int [] Indices, int red, int green, int blue)
  {
    r=red;
    g=green;
    b=blue;
    tourIndices=Indices;
  }
  
  void draw(Instance theInstance)
  {
    stroke(r,g,b);
    int last = 0;
    
    for (int i=0; i<tourIndices.length; i++)
    {
      last = last + 1;
      if (i<tourIndices.length-1)
      {
       
        Waypoint thisWaypoint=theInstance.Waypoints.get(tourIndices[i]);
        Waypoint nextWaypoint=theInstance.Waypoints.get(tourIndices[i+1]);
        line(thisWaypoint.x, thisWaypoint.y, nextWaypoint.x, nextWaypoint.y);
      }
    }
    
    Waypoint firstWaypoint=theInstance.Waypoints.get(tourIndices[0]);
    Waypoint lastWaypoint=theInstance.Waypoints.get(tourIndices[last-1]); 
    line(firstWaypoint.x, firstWaypoint.y, lastWaypoint.x, lastWaypoint.y);
    
  }
}
