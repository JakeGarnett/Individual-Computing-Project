class Instance
{
  
  //create an arraylist of waypoints
  ArrayList<Waypoint> Waypoints;
  
  //initilize waypoint amount
  int numWaypoints;
  int routeStart = 0;
  int routeEnd = 0;
 
  Instance(String filename)
  {
    //load coords
    String [] fileLines=loadStrings(filename);
    //define no. of waypoints
    numWaypoints=fileLines.length;
    
    //Array List for waypoints
    Waypoints=new ArrayList<Waypoint>();
    
    //Loop by numWaypoints
    for (int counter=0; counter<numWaypoints; counter++)
    {
      
      //get the counter/current coord from loaded file
      String thisWaypoint=fileLines[counter];
      //split values
      int [] coords=int(split(thisWaypoint, ","));
      //define x coord
      int thisX=coords[0];
      //define y coord
      int thisY=coords[1];
      //define waypoint value
      int thisV=coords[2];
      
      //create a new Waypoint
      Waypoint newWaypoint = new Waypoint(thisX, thisY, thisV);
      
      //add to array list
      Waypoints.add(newWaypoint);
      
      //print Waypoint and it's values
      //println("Waypoint: "+Waypoints.get(counter)+" is at X="+thisX+", Y="+thisY + " With a value of: " + thisV);
      
    }
  }
  
  void draw()
  {
  
    for (int counter=0; counter<numWaypoints; counter++)
    {
       Waypoints.get(counter).draw();
    } 
  }
}

 
