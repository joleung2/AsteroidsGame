public class Rocket extends Floater
{
  public Rocket()
  {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]= -20;
    yCorners[0] = 8;
    xCorners[1]= -20;
    yCorners[1] = -8;      
    xCorners[2]= -25;
    yCorners[2] = 0;

    myCenterX = 425;
    myCenterY = 425;
    myPointDirection = 0;
    myColor = color(255);        
  }

  public void setX(double x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(double y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setPointDirection(double degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}
