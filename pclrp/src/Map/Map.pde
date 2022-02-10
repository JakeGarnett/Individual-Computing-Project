Route myRoute;
final int WPSIZE=15;

PFont f;


void setup()
{
  size(1000,1000);
  myRoute=new Route(("../../instances/pclrp01.csv"));
  f= createFont("Arial", 16, true);
}

void draw()
{
  myRoute.draw();
}
