class Asteroid extends Floater
{
  int rotSpeed;
  public Asteroid()
  {
    corners = 11;
    xCorners = new int[11];
    yCorners = new int[11];
    xCorners[0] = 10;
    yCorners[0] = 0;
    xCorners[1] = 7;
    yCorners[1] = -4;
    xCorners[2] = 0;
    yCorners[2] = -10;
    xCorners[3] = -6;
    yCorners[3] = -8;
    xCorners[4] = -8;
    yCorners[4] = -3;
    xCorners[5] = -10;
    yCorners[5] = 0;
    xCorners[6] = -5;
    yCorners[6] = 5;
    xCorners[7] = 0;
    yCorners[7] = 10;
    xCorners[8] = 3;
    yCorners[8] = 11;
    xCorners[9] = 6;
    yCorners[9] = 9;
    xCorners[10] = 9;
    yCorners[10] = 5;
    myColor = color(175, 175, 175);
    rotSpeed = (int)(Math.random()*11 - 6);
  }
  public void move ()   
  {      
    turn(rotSpeed);
    super.move();
  }
  public void respawn()
  {      
    myCenterX = Math.random()*700;
    myCenterY = Math.random()*700;
    myXspeed = Math.random()*4 - 2;
    myYspeed = Math.random()*4 - 2;
    myPointDirection = Math.random()*360;
  }
  public boolean crash()
  {
    if (dist((int)myCenterX, (int)myCenterY, (int)bob.accessCenterX(), (int) bob.accessCenterY()) < 20)
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
}
