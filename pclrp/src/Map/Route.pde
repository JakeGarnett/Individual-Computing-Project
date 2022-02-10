class Route
{
  
  //create an arraylist of waypoints
  ArrayList<Waypoint> Waypoints;
  ArrayList<Waypoint> Tour;
  ArrayList<ArrayList<Waypoint>>Tours;
  
  //initilize waypoint amount
  int numWaypoints;
  int routeStart = 0;
  int routeEnd = 0;
  

  
  Route(String filename)
  {
    //load coords
    String [] fileLines=loadStrings(filename);
    //define no. of waypoints
    numWaypoints=fileLines.length;
    
    //Array List for waypoints
    Waypoints=new ArrayList<Waypoint>();
    Tours = new ArrayList<ArrayList<Waypoint>>();
    
    println ("Adding Tours:");
    
    println();
    println("/////////////////////////////////");
    println();
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
      
      //look for terminator
      if (thisV == -1){
        
        //print the start and end of the route
        println("New Tour:");
        println ("Route Starts at: " + routeStart + ", Route Ends at: "+ routeEnd);
        println ();
        
        //update route end
        routeEnd = counter;
        
       //Create arraylist for new tour
        Tour = new ArrayList<Waypoint>(Waypoints.subList(routeStart,routeEnd+1));
        
        //add station to start of the tour
        Tour.add(0,Waypoints.get(counter));
        
        //Add new tour to Tours
        Tours.add(Tour);
        
        //print tour
        println("Tour Created:");
        println(Tour);
        println();
        
        println("/////////////////////////////////");
        println();
        
        
        //update route start
        routeStart = routeEnd+1;
      } 
     
 
    }
 
    println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
    println();
    
    println("Checking Tours:");
    
    println();
    println("/////////////////////////////////");

    
    //check to see if the each Tour is stored in the Tours ArrayList
    for (int counter =0;counter<Tours.size();counter++)
    {
      
      if (counter<Tours.size())
        {
          int num;
          Tours.get(counter);
          println();
          println("Tour: " + counter);
          println(Tours.get(counter));
          
          println();
          
      
          
          //ERROR: prints out repeated waypoints in Tour[3]
          
          for (num = 0; num<Tour.size(); num++){
            
                    //only GETS the index value of Tour[3]
                    //change Tours.get from 0 to num to see it output Tour[3]
                   // Tours.get(0);
                    println("Waypoint: " + Tour.get(num));
                    println();
          
          }
          println("/////////////////////////////////");
          
          
        }
    }
      
    
  }
  
  //TODO:
  //loop through Tours
  
      //for each tour
      
          //create the waypoints

  
  void draw()
  {
     //draw the lines then redraw the waypoints ontop
     
     //ERROR: issue with iterating into waypoints inside each tour.
     //Only outputs the values of the last Tour
     
     //loop through Tours
      for (int counter = 0; counter<Tours.size(); counter++)
      { 
        if (counter<Tour.size()-1) // last-but-one waypoint
              {
                //create 
                stroke(0,0,255); // blue line
                // draw line from current waypoint to NEXT waypoint
                Waypoint thisWaypoint=Tour.get(counter);
                Waypoint nextWaypoint=Tour.get(counter+1);
                line(thisWaypoint.x, thisWaypoint.y, nextWaypoint.x, nextWaypoint.y);
              }
        // draw the current waypoint
        Waypoints.get(counter).draw();
      }
    
    
    
    //Redraw waypoints ontop of routes
    //ERROR: COMMENT LOOP OUT TO SEE ISSUES WITH DRAWING TOURS
    
    for (int counter=0; counter<numWaypoints; counter++){
       Waypoints.get(counter).draw();
     } 
  }
  }

 
