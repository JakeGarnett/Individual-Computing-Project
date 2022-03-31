UAV myUAV;

import java.io.*; 
import java.util.List; 
import java.util.ArrayList; 

class Tour {
  
  int[] tour;

  boolean added;
  
  int sRnd, sMax, pos,u;
  
  float dist,hopDist;

  Tour(ArrayList indices, int uav){
    
      //tour= indices;
      u = uav;
      added = false;
    
    
      Object[] obj_arr= indices.toArray();
      tour =new int[indices.size()];
      for(int i=0;i<obj_arr.length;i++)
      {
        tour[i]=(int)obj_arr[i];
      }
      
      println("Tour"+ tour);
     
  }
  
  void draw(Instance theInstance){
    
    if (added == false){
    
      myInstance.UAVS.add(new UAV(0,0,u));
      added = true;
    }
    pos = 1;
     Waypoint thisNode=myInstance.Stations.get(tour[0]);
     Waypoint nextNode=myInstance.Nodes.get(tour[1]);
     //line(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
     
    for (int i=0; i<tour.length; i++)
    {
      if (i<tour.length-1)
      { 
        thisNode=myInstance.Nodes.get(tour[i]);
        nextNode=myInstance.Nodes.get(tour[i+1]);
        //line(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
        
        //hopDistance = dist(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
       // distance = hopDistance + distance;
        
      }
      
    }
      int endPos = tour.length-1;
    
      thisNode=myInstance.Nodes.get(tour[endPos]);
      nextNode=myInstance.Stations.get(tour[0]);
      //line(thisNode.x, thisNode.y, nextNode.x, nextNode.y);
      
  }

}
