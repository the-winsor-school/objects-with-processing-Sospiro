
// this is your player, they're a blob and they're kinda boring.
Blob player;
Blob other;
Blob blobby;
Blob miniBlobby;
Blob bigBlobby;
//creates 5 new objects -> "player", "other", "blobby", "miniBlobby", and "bigBlobby"

void setup()
{
  size(600, 600);
  
  // Blob parameters are: 
  // x (px), y (px), radius (px), 
  // x-speed (px/frame), y-speed (px/frame), and color.
  player = new Blob(100, 100, 15, 1.25, 1.5, color(450, 150, 150));
  other = new Blob(50, 50, 10, 1.25, 1.5, color(300, 300, 500));
  blobby = new Blob(30, 50, 30, 2, 3, color(140, 140, 170));
  miniBlobby = new Blob(50, 50, 10, 1.25, 1.5, color(380, 230, 115));
  bigBlobby = new Blob(100, 10, 100, 0.6, 0.8, color(10, 500, 300));
  //sets bigBlobby to be pretty big with a slower speed and a light blue color
  //overall, I'm setting all these blobs to have a diversity of sizes and colors and speeds
}

void draw()
{
  background(150,350,165);
  
  // make the player move automatically.
  
  player.keyboardControl();
  //uses the keyboardControl() method, which is defined in the Sprite class -> this method makes it so you can control the movement of this blob through your keyboard arrow keys
  other.chase(player, 100);
  //uses the chase() method, which is also defined in the Sprite class 
  //this method makes it so this blob chases the blob set in the first part of the parameter
  //this method also makes it so this blob has to keep a minimum distance from the blob its chasing (second part of the parameter input)
  //I set the parameters so this blob, "other", chases the blob, "player", and has to keep a minimum distance of 100 from "player"
  blobby.followMouse();
  //uses the followMouse() method, which is also defined in the Sprite class
  //this method tells the blob to follow your mouse (pretty fun :p)
  miniBlobby.chase(blobby, 30);
  bigBlobby.move();
  //uses the move() method, which is defined in the Sprite class
  //this move method enables this blob, "bigBlobby", to keep moving in one direction (when bigBlobby hits the edge of the screen, moves to the respective corresponding side of the other side of the screen)
  
  // draw the player on the screen.
  player.drawSprite();
  other.drawSprite();
  blobby.drawSprite();
  miniBlobby.drawSprite();
  bigBlobby.drawSprite();
  //these statements use the drawSprite() method (defined in Sprite class) to draw all these blobs onto the screen (pretty important if you want to actually see all these blobs in action)
}
