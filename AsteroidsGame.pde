Spaceship bob = new Spaceship();
boolean [] keys = new boolean[6];
Rocket fire = new Rocket();
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <largeAsteroid> chonkRocks = new ArrayList <largeAsteroid>();
ArrayList <Bullet> bullet = new ArrayList <Bullet>();
Star [] sky = new Star[700];

boolean accelerating = false;
boolean deaccelerating = false;
boolean hyperspace = false;
int bulletRecover = 0;
int score = 0;
int highScore = 0;
int health = 5;
int ammo = 10;
int shipType = 1;
int maxHealth;
int maxAmmo;
float maxSpeed;
float engineAcceleration = 0.15;

//stages of game
boolean home = true;
boolean shipSelection = false;
boolean playing = false;
boolean gameOver = false;

Button triangleShip = new Button("Triangle Ship", 150, 400, 130, 30);
Button ringShip = new Button("Ring Ship", 400, 400, 130, 30);
Button wingShip = new Button("Wing Ship", 150, 500, 130, 30);
Button tankShip = new Button("Tank Ship", 400, 500, 130, 30);

public void setup() 
{
  size(700, 700);
  background(0);
  noStroke();
  for (int i = 0; i < sky.length; i++)
  {
    sky[i] = new Star();
  }
  for (int i = 0; i < 13; i++)
  {
    rocks.add(new Asteroid());
    rocks.get(i).randomRespawn();
  }
  for (int i = 0; i < 2; i++)
  {
    chonkRocks.add(new largeAsteroid());
    chonkRocks.get(i).randomRespawn();
  }
}

public void draw() 
{
  fill(0);
  background(0);
  if (home) homeScreen();
  if (shipSelection) selectShip();
  if (playing) gameplay();
  if (gameOver) gameOverScreen();
}


public void keyPressed()
{
  if (key == 'w') {
    if (bob.accessSpeed() <= maxSpeed)
    {
      accelerating = true;
    }
  }
  if (key == 's') {
    if (bob.accessSpeed() >= -maxSpeed)
    {
      deaccelerating = true;
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
    if (ammo >= maxAmmo) {
      hyperspace = true;
      ammo -= maxAmmo;
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
  if (key == 's')
    deaccelerating = false; 
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


public void mouseReleased()
{
  if (home)
  {
    home = false;
    shipSelection = true;
  }
  if (shipSelection)
  {
    if (triangleShip.MouseIsOver()) {
      shipType = 1;
      shipSelection = false;
      playing = true;
      engineAcceleration = 0.15;
      maxHealth = 5;
      maxAmmo = 10;
      maxSpeed = 3;
      bob.editCorners();
      health = maxHealth;
      ammo = maxAmmo;
    }
    if (ringShip.MouseIsOver()) {
      shipType = 2;
      shipSelection = false;
      playing = true;
      engineAcceleration = 0.13;
      maxHealth = 10;
      maxAmmo = 5;
      maxSpeed = 3;
      bob.editCorners();
      health = maxHealth;
      ammo = maxAmmo;
    }
    if (wingShip.MouseIsOver()) {
      shipType = 3;
      shipSelection = false;
      playing = true;
      engineAcceleration = 1;
      maxHealth = 5;
      maxAmmo = 5;
      maxSpeed = 5;
      bob.editCorners();
      health = maxHealth;
      ammo = maxAmmo;
    }
    if (tankShip.MouseIsOver()) {
      shipType = 4;
      shipSelection = false;
      playing = true;
      engineAcceleration = 0.05;
      maxHealth = 20;
      maxAmmo = 10;
      maxSpeed = 1.5;
      bob.editCorners();
      health = maxHealth;
      ammo = maxAmmo;
    }
  }
  if (gameOver)
  {
    gameOver = false;
    home = true;
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].shuffleStar();
    }
    for (int i = 0; i < rocks.size(); i++)
    {
      rocks.get(i).respawn();
    }
    bob.stopVelocity();
    health = maxHealth;
    ammo = maxAmmo;
    score = 0;
  }
}

public void homeScreen()
{
  background(0);
  fill (255);
  textSize(70);
  textAlign(CENTER, TOP);
  text("Asteroids", width/2, 100);
  textSize(50);
  text("Click to begin", width/2, 200);
  textSize(20);
}

public void selectShip()
{
  background(0);
  fill (255);
  textSize(70);
  textAlign(CENTER, TOP);
  text("Select a Ship", width/2, 100);
  textSize(15);
  shipImage triangleShipImage = new shipImage(1, 215, 350);
  shipImage ringShipImage = new shipImage(2, 465, 350);
  shipImage wingShipImage = new shipImage(3, 215, 575);
  shipImage tankShipImage = new shipImage(4, 465, 575);
  triangleShipImage.show();
  triangleShip.show();
  ringShipImage.show();
  ringShip.show();
  wingShipImage.show();
  wingShip.show();
  tankShipImage.show();
  tankShip.show();
}

public void gameplay()
{
  background(0);
  fill (255);
  if (health <= 0) 
  {
    gameOver = true;
    playing = false;
  }
  for (int i = 0; i < bullet.size(); i++)
  {
    bullet.get(i).move();
    bullet.get(i).show();
    if (bullet.get(i).getX() > width || bullet.get(i).getX() < 0 || bullet.get(i).getY() < 0 || bullet.get(i).getY() > height)
    {
      bullet.remove(i);
      i--;
    }
  }
  if (accelerating) {
    bob.accelerate(engineAcceleration);
    fireUpdate();
    fire.show();
  }
  if (deaccelerating) {
    bob.accelerate(-1 * engineAcceleration);
    fireUpdate();
    fire.show();
  }
  if (keys[1]) {
    bob.turn(-3);
    fireUpdate();
    fire.show();
  }
  if (keys[2]) {
    bob.turn(3);
    fireUpdate();
    fire.show();
  }
  if (hyperspace) {
    background(0);
    bob.hyperspace();
    for (int i = 0; i < sky.length; i++)
    {
      sky[i].shuffleStar();
    }
    for (int i = 0; i < rocks.size(); i++)
    {
      rocks.get(i).randomRespawn();
    }
    hyperspace = false;
  }
  for (int i = 0; i < rocks.size(); i++)
  {
    rocks.get(i).move();
    rocks.get(i).show();

    if (rocks.get(i).crash())
    {
      rocks.get(i).respawn();
      i--;
      health--;
    }
    while (i < 0)
      i++;
    if (rocks.size() > 0)
    {
      if (rocks.get(i).destroy())
      {
        rocks.get(i).respawn();
        score++;
        i--;
      }
    }
  }
  for (int i = 0; i < chonkRocks.size(); i++) {
    chonkRocks.get(i).move();
    chonkRocks.get(i).show();
    chonkRocks.get(i).shot();
    while (i < 0)
      i++;
    if (chonkRocks.size() > 0)
    {
      if (chonkRocks.get(i).destroy())
      {
        chonkRocks.get(i).reset();
        score+=3;
        i--;
      }
    }
    if (chonkRocks.get(i).crash()) {
      health -=5;
      chonkRocks.get(i).reset();
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
      rocks.get(i).randomRespawn();
    }
    for (int i = 0; i < bullet.size(); i++)
    {
      bullet.remove(0);
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
      bulletRecover = 1;
    }
  }
  if (!keys[3])
  {
    if (bulletRecover % 10 == 0 && ammo < maxAmmo)
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
  rect(45, 686, 50 * (ammo / maxAmmo), 8);
  fill(0, 255, 0);
  rect(45, 671, (health / maxHealth) * 50, 9);
  fill(0);
  textSize(10);
  text("Energy: " + ammo, 33, 687);
  text("Health: " + health, 30, 673);
  text("Score: " + score, 27, 659);
  strokeWeight(1);
} 

public void gameOverScreen()
{
  if (gameOver) {
    if (highScore < score) highScore = score;
    fill(0);
    background(0);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2 );
    text("Score: " + score, width /2, height / 2 + 30);
    text("High Score: " + highScore, width /2, height / 2 + 60);
    textAlign(BASELINE);
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
