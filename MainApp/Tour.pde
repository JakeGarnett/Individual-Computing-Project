Instance theInstance;
UAV myUAV;


class Tour
{

  int r;
  int g;
  int b;
  
  int [] tourIndices;
  
  int position;
  
  float distance;
  float hopDistance;
  
  
  int s;
  int id;
  
  
  
  Tour(int [] Indices, int uav, int station)
  {
    r=int(random(0,255));
    g=int(random(0,255));
    r=int(random(0,255));
    tourIndices=Indices;
    id=uav;
    s = station;
    
  

     
} 

 
  
  
  void draw(Instance theInstance)
  { 
    stroke(r,g,b);
    
    //println("Rnd Station " +s);
    
    Waypoint thisStation = myInstance.Stations.get(s);
    Waypoint thisNode=myInstance.Nodes.get(tourIndices[0]);
    Waypoint nextNode=myInstance.Nodes.get(tourIndices[1]);
    
    
    //line(thisStation.x, thisStation.y, thisNode.x, thisNode.y);
    hopDistance = dist(thisStation.x, thisStation.y, thisNode.x, thisNode.y);
    distance = hopDistance + distance;
    loop();
    for (int i=0; i<tourIndices.length; i++)
    {
      position = position + 1;
      
      if (i<tourIndices.length-1)
      {
        thisNode=myInstance.Nodes.get(tourIndices[i]);
        nextNode=myInstance.Nodes.get(tourIndices[i+1]);
      //  line(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
        
        hopDistance = dist(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
        distance = hopDistance + distance;
        
      }
      
      
    }
    
    
    //nextNode= myInstance.Nodes.get(tourIndices[position-1]); 
      //line(thisStation.x, thisStation.y, nextNode.x, nextNode.y);
    hopDistance = dist(thisStation.x, thisStation.y, nextNode.x, nextNode.y);
    distance = hopDistance + distance;
  }
}
