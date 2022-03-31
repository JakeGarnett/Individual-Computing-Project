class UAV{

  int x,y,v,t,m,tx,ty,pos,tAssigned;
  
  float dist,vel,speed,charge,maxCharge,power,usage,currDur,taskDuration;
  
  boolean once,addScore,dead,task,penalty;
  
  PVector location,target;
  
  UAV(int xCoord, int yCoord, int tour){
    
    x = xCoord;
    y = yCoord;
    
    t = tour;
        
    m = millis();
    
    pos = 1;
    power = 5;
    maxCharge = 1000;
    speed = 0.005;
    
    charge = maxCharge;
    
    currDur = 0;
    
    location = new PVector(x,y);
    target = new PVector(tx,ty);
  
    penalty = true;
    once = true;
    addScore = false;
    dead = false;
    task = false;
    
  
   
  }
  
  void update() {
    
    
    this.assign();
    this.battery();
    
    if (charge >= 0){
      if (location.x != target.x & location.y != target.y || task == false){
       // println("move");
        this.move();
      }
      if (task == true){
        
       // println("task");
        this.task();
      }
    
    }else{
    
      this.stop();
    }
    
    
  }
  
  void battery(){
    
    if (charge <= 0){
      charge = 0;
    }
    
    Waypoint thisStation=myInstance.Stations.get(myInstance.Tours.get(tAssigned).tour[0]);
  
    if(location.x != thisStation.x & location.y != thisStation.y ){
        
     charge = charge - usage;
        

    }
    else{
    
      charge = charge + 2;
      if (charge > maxCharge){
           charge = maxCharge;
      }
    }
  
  }
  
  void move(){
    

   
    line(location.x, location.y, target.x, target.y); 
    dist = dist(location.x,location.y,target.x,target.y);
  // println(dist);
    
    usage = power / m * dist;
    location.lerp(target, constrain(vel, 0, 1));
    vel = speed * m/dist; 
    
    if(location.x == target.x & location.y == target.y ){
      
      task = true;
      addScore = false;
    
    }
   
  }
  
  void task(){

    if (pos < myInstance.Tours.get(tAssigned).tour.length-1){
      
        once = true;
        
        if (once){
          
            Waypoint thisWaypoint=myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos]);
             v = thisWaypoint.v;
             taskDuration = 20 * v;
              //addScore = false;
              if (addScore == false){
                if (currDur < taskDuration){
                    currDur += 0.5;
              }
              else{
                  if (myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos]).UAVvisited == false){
                     score += v;
                  }
                 
       
                   myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos]).UAVvisited = true;
                  //println(thisWaypoint.UAVvisited);
                  boolean nextPos = false;
                  if (nextPos == false){
                      println("Position" + pos);
                  
                       pos += 1;
       
                    nextPos = true;
                  }
                  if (pos < myInstance.Tours.get(tAssigned).tour.length ){
                     Waypoint nextWaypoint=myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos]);
                     
                      vel = 0;
                  target.x = nextWaypoint.x;
                  target.y = nextWaypoint.y;
                  
                  task = false;
                  addScore = true;
                  currDur = 0;
              
                  }
                 
              
                    
                 
                }
                  
            }
        }
          
        
          
        
      }
    else{
      
             Waypoint thisWaypoint=myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos-1]);
             v = thisWaypoint.v;
             taskDuration = 20 * v;
              //addScore = false;
              if (addScore == false){
                if (currDur < taskDuration){
                    currDur += 0.5;
                    once = true;
              }
              else{
                
                if(once = true){
                
                  if (myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos-1]).UAVvisited == false){
                     //score += v;
                  }
                  // myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos-1]).UAVvisited = true;
                  //println(thisWaypoint.UAVvisited);

                  Waypoint nextWaypoint=myInstance.Stations.get(myInstance.Tours.get(tAssigned).tour[0]);
              
                    
                  vel = 0;
                  target.x = nextWaypoint.x;
                  target.y = nextWaypoint.y;
                  
                  //task = false;
                  addScore = true;
                 once = false;
                  currDur = 0;
                  }
                }
                  
            } 

          
        
      }
          
         
            
          
        
             
  }
  
  void assign(){
  
    for(int i = 0; i < myInstance.Tours.size(); i ++){
    
      if (t == myInstance.Tours.get(i).u){
        tAssigned = i;
       }
      
    }
    
    if(location.x == 0 & location.y == 0 ){
      
        Waypoint thisStation=myInstance.Stations.get(myInstance.Tours.get(tAssigned).tour[0]);
        vel = 0;
        
        Waypoint nextWaypoint=myInstance.Nodes.get(myInstance.Tours.get(tAssigned).tour[pos]);
   
         target.x = nextWaypoint.x;
         target.y = nextWaypoint.y;
        
        
        location.x = thisStation.x;
        location.y = thisStation.y;
        
          println(myInstance.Tours.get(tAssigned).tour);
       
    }
  
  }
  
  void stop(){
    
    if (dead == false){
        
        score -= 100;
        
        println("UAV DEAD");
        dead = true;
    }
  
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,25,25);
    
    
  }

}
