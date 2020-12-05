Spaceship bob = new Spaceship();
boolean [] keys = new boolean[6];
Rocket fire = new Rocket();
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
Star [] sky = new Star[700];
Boolean accelerating = false;
Boolean hyperspace = false;
public void setup() 
{
  size(700, 700);
  background(0);
  noStroke();
  for (int i = 0; i < sky.length; i++)
  {
    sky[i] = new Star();
  }
  for (int i = 0; i < 15; i++)
  {
    rocks.add(new Asteroid());
    rocks.get(i).respawn();
  }
}
public void draw() 
{
  fill(0);
  background(0);
  if (accelerating == true) {
    bob.accelerate(.15);
    fireUpdate();
    fire.show();
    accelerating = false;
  }
  if (keys[1]) {
    bob.turn(-5);
    keys[1] = false;
  }
    if (keys[2]) {
    bob.turn(5);
    keys[2] = false;
  }
  if (hyperspace == true) {
    background(0);
    bob.hyperspace();
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].shuffleStar();
    }
    hyperspace = false;
  }
  if (bob.accessCenterX() >= 700 || bob.accessCenterY() >= 700 || bob.accessCenterX() <= 0 || bob.accessCenterY() <= 0)
  {     
    background(0);
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].shuffleStar();
    }
    for (int i = 0; i < rocks.size(); i++)
    {
      rocks.get(i).respawn();
    }
  }
  for (int i = 0; i < rocks.size(); i++)
  {
    rocks.get(i).move();
    rocks.get(i).show();
    if(rocks.get(i).crash()) rocks.get(i).respawn();
  }
  for (int i = 0; i < sky.length; i++)
  {
    sky[i].show();
  }
  bob.show();
  bob.move();
}
public void keyPressed()
{
  if (key == 'w') {
    if (bob.accessSpeed() <= 3)
    {
      accelerating = true;
    }
  }
  if (key == 's') {
    if (bob.accessSpeed() >= -3)
    {
      bob.accelerate(-0.15);
    }
  }
  if (key == 'a') {
    keys[1] = true;
  }
  if (key == 'd') {
    keys[2] = true;
  }
  if (key == 'h')
  {
    hyperspace = true;
  }
}
public void fireUpdate() {
  fire.setX(bob.accessCenterX()); 
  fire.setY(bob.accessCenterY()); 
  fire.setPointDirection(bob.getPointDirection());
}
public static void wait(int ms)
{
  try
  {
    Thread.sleep(ms);
  }
  catch(InterruptedException ex)
  {
    Thread.currentThread().interrupt();
  }
}
