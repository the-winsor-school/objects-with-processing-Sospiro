
// this is your player, they're a blob and they're kinda boring.
Blob player;
Blob other;
Blob blobby;
Blob miniBlobby;
Blob bigBlobby;

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
  bigBlobby = new Blob(200, 10, 200, 0.6, 0.8, color(10, 500, 300));
}

void draw()
{
  background(150,350,165);
  
  // make the player move automatically.
  
  player.keyboardControl();
  other.chase(player, 100);
  blobby.followMouse();
  miniBlobby.chase(blobby, 30);
  bigBlobby.move();
  
  // draw the player on the screen.
  player.drawSprite();
  other.drawSprite();
  blobby.drawSprite();
  miniBlobby.drawSprite();
  bigBlobby.drawSprite();
}
