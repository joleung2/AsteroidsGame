class largeAsteroid extends Asteroid {
  int myColor = color(175, 175, 175);
  int cornerNum = 11;
  int[] xList = new int[cornerNum];
  int[] yList = new int[cornerNum];
  int rotSpeed;
  int health = 3;
  public largeAsteroid()
  {
    corners = cornerNum;
    xCorners = randomAsteroidShape(7);
    yCorners = yList;
    myColor = color(175, 175, 175);
    rotSpeed = (int)(Math.random()*11 - 6);
  }
  public int[] randomAsteroidShape(int variation)
  {
    int nRadius;
    int radius = 20 + (int)(Math.random() * (2 * variation));
    double angle = 2 * Math.PI / cornerNum;
    for (int i = 0; i < cornerNum; i++) {
      nRadius = 20 + (int)(Math.random() * (2 * variation));
      while (nRadius - radius > 5) {
        nRadius = 20 + (int)(Math.random() * (2 * variation));
      }
      radius = nRadius;
      xList[i] = (int)(radius * Math.sin(angle * i));
      yList[i] = (int)(radius * Math.cos(angle * i));
    }
    return xList;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    if (health == 3) myColor = color(175, 175, 175);
    if (health == 2) myColor = color(145, 145, 145);
    if (health == 1) myColor = color(115, 115, 115);
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
  public void shot() {
    if (destroy()) {
      health --;
    }
  }
  public void reset() {
    health = 3;
    super.respawn();
  }
  public int accessHealth()
  {
    return health;
  }
}
