
// this is your player, they're a blob and they're kinda boring.
Blob player;
Blob other;

void setup()
{
  size(600, 600);
  
  // Blob parameters are: 
  // x (px), y (px), radius (px), 
  // x-speed (px/frame), y-speed (px/frame), and color.
  player = new Blob(100, 100, 15, 1.25, 1.5, color(450, 150, 150));
  other = new Blob(50, 50, 10, 1.25, 1.5, color(300, 300, 500));
}

void draw()
{
  background(150,350,165);
  
  // make the player move automatically.
  
  player.keyboardControl();
  other.chase(player, 10);
  
  // draw the player on the screen.
  player.drawSprite();
  other.drawSprite();
}
