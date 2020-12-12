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

  public void editCorners()
  {
    if (shipType == 1) {
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
    }
    if (shipType == 2) {
      corners = 15;
      xCorners = new int[corners];
      yCorners = new int[corners];
      int[] xArray = {0, -10, -14, -10, 0, 10, 12, 22, 20, 12, 12, 12, 20, 22, 12, 10};
      int[] yArray = {14, 10, 0, -10, -14, -10, -8, -6, -4, -2, 2, 4, 6, 8, 10};
      xCorners = xArray;
      yCorners = yArray;
    }
    if (shipType == 3) {
      corners = 10;
      int [] xArray = {14, 1, -10, -4, -6, -8, -8, -4, -10, 1};
      int [] yArray = {0, 18, 18, 9, 6, 6, -6, -9, -18, -18};
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners = xArray;
      yCorners = yArray;
    }
    if (shipType == 4) {
      corners = 9;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0] = 30;
      yCorners[0] = 0;
      xCorners[1] = 15;
      yCorners[1] = 10;
      xCorners[2] = 0;
      yCorners[2] = 10;
      xCorners[3] = -25;
      yCorners[3] = 20;
      xCorners[4] = -15;
      yCorners[4] = 10;
      xCorners[5] = -15;
      yCorners[5] = -10;
      xCorners[6] = -25;
      yCorners[6] = -20;
      xCorners[7] = 0;
      yCorners[7] = -10;
      xCorners[8] = 15;
      yCorners[8] = -10;
    }
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

    if (speed > maxSpeed) speed = maxSpeed - 0.1;
    if (speed < -maxSpeed) speed = maxSpeed + 0.1;

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

  public void shoot()
  {
    bullet.add(new Bullet((int)bob.getX(), (int)bob.getY(), bob.getPointDirection(), 5 * bob.getDirectionX(), 5 * bob.getDirectionY()));
  }

  public double accessSpeed() {
    return speed;
  }

  public void stopVelocity()  
  {
    myCenterX = 350;
    myCenterY = 350;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    speed = 0;
    angle = 0;
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
  public double getX() {
    return myCenterX;
  };    
  public double getY() {
    return myCenterY;
  };   
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  };   
  public double getDirectionX() {
    return Math.cos(myPointDirection*(Math.PI/180));
  };    
  public double getDirectionY() {
    return Math.sin(myPointDirection*(Math.PI/180));
  };   
  public double getPointDirection() {
    return myPointDirection;
  };
}
