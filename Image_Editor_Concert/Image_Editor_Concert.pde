ImageEditor myIE;
void setup()
{
  size(400,400);
  myIE = new ImageEditor("monkeys.jpg");
  noLoop();
  myIE.resizeWindowToImage(1,1);
}

void draw()
{
  myIE.startEditing();
  for (int y = 0; y <myIE.height(); y = y + 1)
  {
    for (int x = 300; x <myIE.width()-10; x = x + 1)
    {      
      
     //stripes
      if (x%10 > 5)
      {
      //invert colors
        int r = myIE.getRedAt(x,y);
        int g = myIE.getGreenAt(x,y);
        int b = myIE.getBlueAt(x,y);
      
        myIE.setRedAt(r,x+10,y);
        myIE.setGreenAt(g,x+10,y);
        myIE.setBlueAt(b,x+10,y);
      }
    }
  }
  for (int y = 0; y <myIE.height(); y = y + 1)
  {
    for (int x = 0; x <myIE.width()-300; x = x + 1)
    {      
  //black filter
      int r1 = myIE.getRedAt(x,y);
      int r2 = myIE.getRedAt(x+1,y);
      
      int diff = abs(r2-r1);
      
      myIE.setRedAt(diff,x,y);
      myIE.setGreenAt(diff,x,y);
      myIE.setBlueAt(diff,x,y);
    }
  }
  myIE.stopEditing();
  myIE.drawAt(0,0);
  save("resultInWindow.png");
}
