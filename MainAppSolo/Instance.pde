class Instance {
  ArrayList <UAV> UAVS;
  ArrayList <Waypoint> Nodes;
  ArrayList <Waypoint> Stations;
  int numWaypoints;
  int value;
  int t;
  int s;
  
  Instance(int tours,int waypoints, int stations){
  
    t = tours;
    UAVS = new ArrayList<UAV>();
    Nodes = new ArrayList<Waypoint>();
    Stations = new ArrayList<Waypoint>();
    
    s = stations;
    
    numWaypoints = waypoints;
   
   for (int counter=0; counter<numWaypoints; counter++)
    {
      value = int(random(1,9));
      //println(value);
      Waypoint newNode = new Waypoint(int(random(100,700)),int(random(100,700)),value,false);
      Nodes.add(newNode);
        //println("New Node");
    }
    
    for (int counter=0; counter<stations; counter++)
    {
      Waypoint newStation = new Waypoint(int(random(100,700)),int(random(100,700)),-1,false);
      Stations.add(newStation);
      //println("New Station");
    }
    
    
   
    
    
 
  }
  
  
 void draw(){
   //println (n);
   for (int i = 0; i < Tours.size(); i++){ 
    UAV myUAV = new UAV(0,0,i);
    myInstance.UAVS.add(myUAV);
    UAVS.get(i).display();
    UAVS.get(i).update();
  }
   
   
   for (int Ncounter = 0; Ncounter < Nodes.size() ; Ncounter++){ 

    Nodes.get(Ncounter).draw();
    
    }
    for (int Scounter = 0; Scounter < Stations.size() ; Scounter++){ 

    Stations.get(Scounter).draw();
    }
  
  
  }
}
