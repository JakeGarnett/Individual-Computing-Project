Instance myInstance;
PFont f;
public int score;
void setup(){
  size(1000,1000);
  smooth();
  
  f = createFont("Arial",16,true);
  
  myInstance = new Instance("../../instances/pclrp01.csv");
  }
  
  
  int toursNum = 4;

void draw(){
  background(100);
  frameRate(60);
  textFont(f,16);
  fill(255);
  text("Score:" + score,20,50);
  
  myInstance.draw();
  

}
