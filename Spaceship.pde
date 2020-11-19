class Spaceship extends Floater  
{   
  double speed = 0;
  double angle = 0;
  public Spaceship() {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8; 
    yCorners[0] = -8; 
    xCorners[1] = 16; 
    yCorners[1] = 0; 
    xCorners[2] = -8; 
    yCorners[2] = 8;
    xCorners[3] = -12; 
    yCorners[3] = 6; 
    xCorners[4] = -16; 
    yCorners[4] = 8; 
    xCorners[5] = -20; 
    yCorners[5] = 0;
    xCorners[6] = -16; 
    yCorners[6] = -8; 
    xCorners[7] = -12; 
    yCorners[7] = -6;
    myColor = 255; //white spaceship
    myCenterX = 350;
    myCenterY = 350;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void accelerate (double dAmount)   
  {          
    speed += dAmount;
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians)); 
  }  

  public void turn (double degreesOfRotation)   
  {     
    angle += degreesOfRotation;
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;
  } 

  public void move()
  {
    myCenterX += Math.cos(angle*(Math.PI/180)) * speed;
    myCenterY += Math.sin(angle*(Math.PI/180)) * speed;

    if (speed > 3) speed = 2.9;
    if (speed < -3) speed = -2.9;
    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }

  public void hyperspace()
  {
    myXspeed = 0;
    myYspeed = 0;
    speed = 0;
    myCenterX = ((int)(Math.random()*width));
    myCenterY = ((int)(Math.random()*height));
  }

  public double accessSpeed() {
    return speed;
  }

  public void setXspeed(int x) {
    myXspeed = x;
  }

  public void setYspeed(int x) {
    myYspeed = x;
  }

  public double accessCenterX() {
    return myCenterX;
  }

  public double accessCenterY() {
    return myCenterY;
  }
  public void setX(int x) {
    myCenterX = x;
  };    

  public void setY(int y) {
    myCenterY = y;
  };   

  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  };   

  public double getPointDirection() {
    return myPointDirection;
  };
}
