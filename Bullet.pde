class Bullet extends Floater
{
  double myDirectionX;
  double myDirectionY;
  public Bullet(int x, int y, double pointDirection, double directionX, double directionY)
  {
    corners = 4;
    xCorners = new int[4];
    yCorners = new int[4];
    xCorners[0] = 2;
    yCorners[0] = 0;
    xCorners[1] = 0;
    yCorners[1] = 2;
    xCorners[2] = -2;
    yCorners[2] = 0;
    xCorners[3] = 0;
    yCorners[3] = -2;
    myColor = color(255);
    myCenterX = x;
    myCenterY = y;
    myPointDirection = pointDirection;
    myDirectionX = directionX;
    myDirectionY = directionY;
    accelerate(5);
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void move () 
  {         
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
  }
}
