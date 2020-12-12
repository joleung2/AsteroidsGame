class shipImage extends Floater
{
  public shipImage(int type, int x, int y) 
  {
    if (type == 1) {
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
      myCenterX = x;
      myCenterY = y;
    }
    if (type == 2) {
      corners = 15;
      xCorners = new int[corners];
      yCorners = new int[corners];
      int[] xArray = {0, -10, -14, -10, 0, 10, 12, 22, 20, 12, 12, 12, 20, 22, 12, 10};
      int[] yArray = {14, 10, 0, -10, -14, -10, -8, -6, -4, -2, 2, 4, 6, 8, 10};
      xCorners = xArray;
      yCorners = yArray;
      myColor = 255; //white spaceship
      myCenterX = x;
      myCenterY = y;
    }
    if (type == 3) {
      corners = 10;
      int [] xArray = {14, 1, -10, -4, -6, -8, -8, -4, -10, 1};
      int [] yArray = {0, 18, 18, 9, 6, 6, -6, -9, -18, -18};
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners = xArray;
      yCorners = yArray;
      myColor = (255);
      myCenterX = x;
      myCenterY = y;
    }
    if (type == 4) {
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
      myColor = (255);
      myCenterX = x;
      myCenterY = y;
    }
  }
}
