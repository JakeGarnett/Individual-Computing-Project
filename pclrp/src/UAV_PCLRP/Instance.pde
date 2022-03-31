class Instance{
  
  
   ArrayList <Tour> Tours;
   ArrayList <UAV> UAVS;
   ArrayList <Waypoint> Stations, Nodes;
   ArrayList sPossible,indices;
   
   
   
   String[] fileLines;
   String thisWaypoint;
   
   int[] coords;
   
   
   
   int sMax,sRnd,i,t,v,w,x,y;
   
  
   Instance(String filename){
   

     sPossible = new ArrayList();
     indices = new ArrayList<Integer>();
     
     UAVS = new ArrayList<UAV>();
     Nodes = new ArrayList<Waypoint>();
     Stations = new ArrayList<Waypoint>();
     Tours = new ArrayList<Tour>();
     
     
     fileLines=loadStrings(filename);
     
   
     
     w = fileLines.length;

    
     for (i=0; i<w; i++){
       
      thisWaypoint = fileLines[i];
      coords = int(split(thisWaypoint, ","));
      x = coords[0];
      y = coords[1];
      v = coords[2];
      
      Waypoint newWaypoint = new Waypoint(x,y,v,false);
      
     
      switch(v){
        case -1:
          Stations.add(newWaypoint);      
        break;
        default:
         Nodes.add(newWaypoint);
    
        break;
      
     }
 
     
     if (i == w -1){
         
       sMax = Stations.size() -1;
             
       for(int q = 0; q < toursNum; q++){
         // println("implement tours");
          
          int tourLength = int(random(0, Nodes.size()));
          
          for(int p = 0; p < tourLength; p++){
            
            int newIndices = int(random(0, tourLength));
            indices.add(newIndices);
           // println(indices);
            
            if (p == tourLength -1){
                sRnd = int(random(sMax));
                println("Station " + sRnd);
                
                indices.add(0,sRnd);
                println("indices " + indices);
                
                Tours.add(new Tour(indices, q));
                
                indices.clear();
                
            
            }
          
          }
          
          
          
       }
       
       
     }
       
   }
   
   
   
}
   
   void draw(){
     
     
     for (int i=0; i<Stations.size(); i++){
       
       Stations.get(i).draw();
       //Nodes.get(i).draw();
     }
     for (int i=0; i<Nodes.size(); i++){
       
       //Stations.get(i).draw(),;
       Nodes.get(i).draw();
     }
     
       for (int i=0; i<myInstance.Tours.size(); i++){
      
       Tours.get(i).draw(myInstance);
     }
     
     for (int i = 0; i < Tours.size(); i++){ 
 
        UAVS.get(i).display();
        UAVS.get(i).update();
     }
   }
     
   
 }
   
   
