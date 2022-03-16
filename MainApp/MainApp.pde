Instance myInstance;
ArrayList <Tour> Tours;


PFont f;
public int count = 0;
public int score = 0;

void setup() 
{
  size(800,800);
  smooth();
  
  f = createFont("Arial",16,true);
  
  myInstance = new Instance(4,20,6); 
 
  
  //create indices arrays 
  int [] t1={3,4,5,6};
  int [] t2={0, 2, 5};
  int [] t3={11, 7, 1};
  int [] t4={12, 15, 13, 9};
  
  int [] [] all={t1,t2,t3,t4};
  
  int count = 4;
 
  int stationsMax = myInstance.s - 1;
  int stationRand;
  Tours = new ArrayList<Tour>();
  
  for (int i = 0; i < all.length; i++){
     stationRand = int(random(0,stationsMax));
     Tours.add(new Tour(all[i],i, stationRand));
      //println(stationRand);
  }
 
}

void draw(){
  background(255);
  textFont(f,16);
  fill(0);
  text("Score:" + score,20,50);

   
  
  myInstance.draw();
  
  for (int i = 0; i < Tours.size(); i++){ 
    Tours.get(i).draw(myInstance);
    
    //println(Tours.get(i).tourIndices);
  }
  
 
  
  
}
