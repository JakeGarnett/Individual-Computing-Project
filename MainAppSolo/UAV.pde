Tour myTour;



class UAV {

  
  int x;
  int y;
  int v;
  int t;
  int m = millis();
  int tx;
  int ty;
  int position = 1;
  float dist;
  float velocity;
  float speed = 0.002; 
  float batteryCharge = 1200;
  float batteryPower = 5;
  float batteryUsage;
  boolean runOnce = true;
  PVector location;
  PVector target;
  
  UAV(int Xcoord, int Ycoord, int tour){
    x = Xcoord;
    y = Ycoord;
    t = tour;
    location = new PVector(x,y);
    target = new PVector(tx,ty);
  }

  void update() {
    
    float dist = dist(location.x,location.y,target.x,target.y);
    //println(m);
    
    println("Battery = " + batteryCharge);
    //println("Score " + score);
    //println(m);
    
    if(location.x == 0 & location.y == 0 ){
        Waypoint thisStation=myInstance.Stations.get(Tours.get(t).s);
        //println(Tours.get(t).stationRand);
        Waypoint nextWaypoint=myInstance.Nodes.get(Tours.get(t).tourIndices[0]);
        velocity = 0;
        
        target.x = nextWaypoint.x;
        target.y = nextWaypoint.y;
        location.x = thisStation.x;
        location.y = thisStation.y;
        
        //println(t);
        //println(Tours.get(t).tourIndices);
        
        line(location.x, location.y, target.x, target.y); 
    }
    Waypoint thisStation = myInstance.Stations.get(Tours.get(t).s);
    if(location.x != thisStation.x & location.y != thisStation.y ){
        
      batteryCharge = batteryCharge - batteryUsage;
        

    }
    else{
    
      batteryCharge = batteryCharge + 2;
      if (batteryCharge > 1200){
           batteryCharge = 1200;
      }
    }
          
    if(batteryCharge <= 0){
      //noLoop();
      batteryCharge = 0;
      target.x = location.x;
      target.y = location.y;
      
      
        if (runOnce){
              runOnce = false;
               println("PENALTY: DRONE OUT OF CHARGE");
               
               
                score = score - 100;
            }
     
    }
    
    
    dist = dist(location.x,location.y,target.x,target.y);
    
    if(location.x != target.x & location.y != target.y){
      batteryUsage = batteryPower / m * dist;
      location.lerp(target, constrain(velocity, 0, 1));
      velocity = speed * m/dist; 
    }
    
    else{
      dist= 0;
      //println(powerConsumtion);
      
      
      if (position != Tours.get(t).tourIndices.length){
        Waypoint thisWaypoint=myInstance.Nodes.get(Tours.get(t).tourIndices[position-1]);
   
        v = thisWaypoint.v;
        float taskDuration = 1000 * v;
        println("Node Value "+v);
        println("Task Duration "+ taskDuration);
        
        runOnce = true;
        if (runOnce){
              runOnce = false;
              //uscore = uscore + v;
              score = score + v;
            }
        
       
         
          Waypoint nextWaypoint=myInstance.Nodes.get(Tours.get(t).tourIndices[position++]);
          velocity = 0;
          target.x = nextWaypoint.x;
          target.y = nextWaypoint.y;
            
          line(location.x, location.y, target.x, target.y);
          
         runOnce = true; 
        }
        
        else{
        
        
        if (runOnce){
          Waypoint thisWaypoint=myInstance.Nodes.get(Tours.get(t).tourIndices[position-1]);
          thisWaypoint.v = v;
           Waypoint nextWaypoint=myInstance.Stations.get(Tours.get(t).s);
          velocity = 0;
          target.x = nextWaypoint.x;
           target.y = nextWaypoint.y;
          line(location.x, location.y, target.x, target.y);
          float taskDuration = 1000 * v;
          println("Node Value "+v);
          println("Task Duration "+ taskDuration);
              runOnce = false;
              //uscore = uscore + v;
              score = score + v;
             
            
         
        }
       }
    }
    
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,25,25);
    
    
  }
}
