Instance myInstance;
Tour myTour1;
Tour myTour2;
Tour myTour3;
Tour myTour4;
final int WPSIZE=15;

PFont f;


void setup()
{
  size(1000,1000);
  myInstance=new Instance("../../instances/pclrp01.csv");
  f= createFont("Arial", 16, true);
  noLoop();
  
  int [] t1={3, 4, 6};
  myTour1=new Tour(t1, 255,0,0); //red
  
  int [] t2={0, 2, 5};
  myTour2=new Tour(t2, 0,255,0); // green
  
  int [] t3={11, 7, 1};
  myTour3=new Tour(t3, 0,0,255); // blue
  
  int [] t4={12, 15, 13, 18, 9};
  myTour4=new Tour(t4, 255,255,255);
  
}

void draw()
{
  myTour1.draw(myInstance);
  myTour2.draw(myInstance);
  myTour3.draw(myInstance);
  myTour4.draw(myInstance);
  myInstance.draw();
}
