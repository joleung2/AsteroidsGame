Spaceship bob = new Spaceship();
boolean [] keys = new boolean[6];
Rocket fire = new Rocket();
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> bullet = new ArrayList <Bullet>();
Star [] sky = new Star[700];
boolean accelerating = false;
boolean gameOver = false;
boolean hyperspace = false;
int bulletRecover = 0;
int score = 0;
int health = 5;
int ammo = 10;
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
  if (gameOver) {
    fill(255);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height /2 );
    text("Score: " + score, width /2, height / 2 + 15);
    textAlign(BASELINE);
  } else {
    if (health <= 0)
      gameOver = true;
    for (int i = 0; i < bullet.size(); i++)
    {
      bullet.get(i).move();
      bullet.get(i).show();
      if (bullet.get(i).getX() > 600 || bullet.get(i).getX() < 0 || bullet.get(i).getY() < 0 || bullet.get(i).getY() > 600)
      {
        bullet.remove(i);
        i--;
      }
    }
    if (accelerating) {
      bob.accelerate(.15);
      fireUpdate();
      fire.show();
    }
    if (keys[1]) {
      bob.turn(-5);
    }
    if (keys[2]) {
      bob.turn(5);
    }
    if (hyperspace) {
      background(0);
      bob.hyperspace();
      for (int i = 0; i < sky.length; i++)
      {
        sky[i].shuffleStar();
      }
      hyperspace = false;
    }
    for (int i = 0; i < rocks.size(); i++)
    {
      rocks.get(i).move();
      rocks.get(i).show();
      if (rocks.get(i).crash())
      {
        rocks.remove(i);
        i--;
        health--;
      }
      while (i < 0)
        i++;
      if (rocks.size() > 0)
      {
        if (rocks.get(i).destroy())
        {
          rocks.remove(i);
          score++;
          i--;
        }
      }
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
      if (rocks.get(i).crash()) 
      {
        rocks.get(i).respawn();
        health--;
      }
    }
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].show();
    }
    if (keys[3])
    {
      if (bulletRecover % 10 == 0 && ammo > 0)
      {
        bob.shoot();
        ammo--;
      }
    }
    if (!keys[3])
    {
      if (bulletRecover % 10 == 0 && ammo < 10)
        ammo++;
    }
    bulletRecover++;
    bob.show();
    bob.move();
    strokeWeight(3);
    stroke(100);
    rect(5, 650, 103, 45);
    noStroke();
    fill(255, 0, 0);
    rect(45, 686, 50, 8);
    rect(45, 671, 50, 9);
    fill(242, 223, 56);
    rect(45, 686, ammo * 5, 8);
    fill(0, 255, 0);
    rect(45, 671, health * 10, 9);
    fill(0);
    text("Energy: " + ammo, 5, 695);
    text("Health: " + health, 5, 680);
    text("Score: " + score, 5, 665);
    strokeWeight(1);
  }
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
    if (ammo == 10) {
      hyperspace = true;
      ammo = 0;
    }
  }
  if (key == ' ')
  {
    keys[3] = true;
  }
}
public void keyReleased()
{
  if (key == 'w')
    accelerating = false; 
  if (key == 'a')
    keys[1] = false;  
  if (key == 'd')
    keys[2] = false;
  if (key == ' ')
  {
    keys[3] = false;
    bulletRecover = 0;
  }
}
public void fireUpdate() {
  fire.setX(bob.accessCenterX()); 
  fire.setY(bob.accessCenterY()); 
  fire.setPointDirection(bob.getPointDirection());
}
public void mousePressed()
{
  if (gameOver)
  {
    gameOver = false;
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].shuffleStar();
    }
    for (int i = 0; i < rocks.size(); i++)
    {
      rocks.get(i).respawn();
    }
    bob.stopVelocity();
    health = 5;
    ammo = 10;
    score = 0;
    draw();
  }
}
public void wait(int ms)
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
