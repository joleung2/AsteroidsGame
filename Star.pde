public class Star 
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }
  public void show()
  {
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    ellipse(myX, myY, 1, 1);
  }
  public void shuffleStar()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    show();
  }
}
