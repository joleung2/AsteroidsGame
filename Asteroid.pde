class Asteroid extends Floater
{
  int cornerNum = 11;
  int[] xList = new int[cornerNum];
  int[] yList = new int[cornerNum];
  int rotSpeed;
  public Asteroid()
  {
    corners = cornerNum;
    xCorners = randomAsteroidShape(7);
    yCorners = yList;
    myColor = color(175, 175, 175);
    rotSpeed = (int)(Math.random()*11 - 6);
  }
  public void move ()   
  {      
    turn(rotSpeed);
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    if (myCenterX > width)
    {     
      respawn();
    } else if (myCenterX < 0)
    {     
      respawn();
    }    
    if (myCenterY > height)
    {    
      respawn();
    } else if (myCenterY < 0)
    {     
      respawn();
    }
  }
  public void respawn()
  {      
    int choice = (int)(Math.random()*4)+1;
    if (choice == 1) {
      if (bob.accessCenterY() != 0) { 
        myCenterX = Math.random()*700;
        myCenterY = 0;
      } else respawn();
    }
    if (choice == 2) {
      if (bob.accessCenterX() != 0) { 
        myCenterX = 0;
        myCenterY = Math.random()*700;
      } else respawn();
    }
    if (choice == 3) {
      if (bob.accessCenterY() != 700) {
        myCenterX = Math.random()*700;
        myCenterY = 700;
      } else respawn();
    }
    if (choice == 4) {
      if (bob.accessCenterX() != 700) {
        myCenterX = 700;
        myCenterY = Math.random()*700;
      } else respawn();
    }
    myXspeed = Math.random()*4 - 2;
    myYspeed = Math.random()*4 - 2;
    myPointDirection = Math.random()*360;
    rotSpeed = (int)(Math.random()*11 - 6);
  }
  public void randomRespawn()
  {
    myCenterX = Math.random()*700;
    myCenterY = Math.random()*700;
    myXspeed = Math.random()*4 - 2;
    myYspeed = Math.random()*4 - 2;
    myPointDirection = Math.random()*360;
    rotSpeed = (int)(Math.random()*11 - 6);
  }
  public boolean crash()
  {
    if (dist((int)myCenterX, (int)myCenterY, (int)bob.accessCenterX(), (int) bob.accessCenterY()) < 40)
      return true;
    else 
    return false;
  }
  public boolean destroy()
  {
    for (int i = 0; i < bullet.size(); i++) {
      if (dist((int)myCenterX, (int)myCenterY, bullet.get(i).getX(), bullet.get(i).getY()) < 15)
        return true;
    }
    return false;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public int[] randomAsteroidShape(int variation)
  {
    int nRadius;
    int radius = 10 + (int)(Math.random() * (2 * variation));
    double angle = 2 * Math.PI / cornerNum;
    for (int i = 0; i < cornerNum; i++) {
      nRadius = 10 + (int)(Math.random() * (2 * variation));
      while (nRadius - radius > 5) {
        nRadius = 10 + (int)(Math.random() * (2 * variation));
      }
      radius = nRadius;
      xList[i] = (int)(radius * Math.sin(angle * i));
      yList[i] = (int)(radius * Math.cos(angle * i));
    }
    return xList;
  }
}
