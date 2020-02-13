/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  // this Sprite's current location.
  //float x, y;

  //this Sprite's current velocity vector.
  //float dx, dy;
  Vector2 location;
  Vector2 velocity;
  boolean perp = false;
  //this bool is for my modified move() method further below

  // initialize a Sprite at a given coordinate.
  Sprite(float x, float y)
  {
    this.location = new Vector2(x, y);

    this.velocity = new Vector2(0, 0);
  }

  // initalize a Sprite at a given coordinate with a given velocity.
  Sprite(float x, float y, float dx, float dy)
  {
    this.location = new Vector2(x, y);
    this.velocity = new Vector2(dx, dy);
    //this constructor is different from the constructor above because this contructor accounts for the sprite moving (with dx, dy) instead of just staying still (with 0, 0)
  }

  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    return get((int)this.location.x, (int)this.location.y)==c;
  }

  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    float speed = (float)velocity.magnitude();
    //float delX = other.location.x - this.location.x; 
    //float delY = other.location.y - this.location.y;
    Vector2 diff = other.location.subtract(this.location);
    //defines a new vector that is the difference betweent the "this" vector and the "other" vector
    
    //float mag = sqrt(delX*delX + delY*delY);
    double mag = diff.magnitude();
    //creates a variable "mag" that stores the magnitude of this new vector "diff"
    //the "interface" of the class - ex: the names of all these vectors and methods - ex: (diff.magnitude())
    //the "implementation" is the code inside methods and such
    //overall, "interface" is the code the user often sees and interacts with the code, often using the methods written behind the scenes - and the "implementation" is the sort of behind-the-scenes code within methods and such, the code blocks that actually define what a method and such does

    //if (delX != 0) this.location.x += (delX / mag) * speed;
    //if (delY != 0) this.location.y += (delY / mag) * speed;
    
    if(diff.x != 0) location.x += (diff.x / mag) * speed;
    if(diff.y!= 0) location.y += (diff.y / mag) * speed;
    //these lines 58-59 replace lines 55-56 using the new Vector2, "diff"
    
    
  }

  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while mafloataing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = (float)velocity.magnitude();
    //float delX = other.location.x - this.location.x;
    //float delY = other.location.y - this.location.y;
    //float mag = sqrt(delX*delX + delY*delY);
    //Vector2 diff = other.location.subtract(this.location);
    Vector2 diff = new Vector2(other.location.x - this.location.x, other.location.y - this.location.y);
    float mag = sqrt(diff.x * diff.x + diff.y * diff.y);
    //defines a new vector that is the difference of the two vectors
    //this statement + declaration of the diff variable (Vector2 type) is a more concise way and more human-readable way of writing the 3 commented out lines in lines 70-73 (delX and delY stuff)

    if (mag > 0 && mag <= minFollowDistance) 
    {
      if (diff.y < diff.x)
      {
        this.location.x -= (diff.y / mag) * speed * 0.5;
        this.location.y += (diff.x / mag) * speed * 0.5;
      } else
      {
        this.location.x += (diff.y / mag) * speed * 0.5;
        this.location.y -= (diff.x / mag) * speed * 0.5;
      }
      return;
    }

    if (diff.x != 0) this.location.x += (diff.x / mag) * speed;
    if (diff.y != 0) this.location.y += (diff.y / mag) * speed;
  }

  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = (float)this.velocity.magnitude();
    Vector2 diff = new Vector2(mouseX - this.location.x, mouseY - this.location.y);
    //float delY = mouseY - this.location.y;
    //float mag = sqrt(delX*delX + delY*delY);
    //Vector2 diff = other.location.subtract(this.location);
    float mag = sqrt(diff.x * diff.x + diff.y * diff.y);

    if (diff.x != 0) this.location.x += (diff.x / mag) * speed;
    if (diff.y != 0) this.location.y += (diff.y / mag) * speed;
  }

  // move this sprite according to it's current velocity vector
  // bounces off the walls
  void move()
  {
    this.location = this.location.add(this.velocity);

    // make sure we don't go out of bounds
    if (this.location.x < 0) 
    { 
      //if the blob hits the left side of the screen...
      this.location.x += width;
    }
    if (this.location.x > width) 
    {
      //if the blob hits the right side of the screen...
      this.location.x -= width;
    }
    if (this.location.y < 0) 
    {
      //if the blob hits the bottom side of the screen...
      this.location.y += height;
    }
    if (this.location.y > height)
    {
      //if the blob hits the top side of the screen...
      this.location.y -= height;
    }
   
    
    
  }

  // get the distance between centers of this Sprite and another
  float distanceTo(Sprite other)
  {
    //float delX = other.location.x - this.location.x;
    //float delY = other.location.y - this.location.y;
    //return sqrt(delX*delX + delY*delY);
    Vector2 diff = other.location.subtract(this.location);
    return sqrt(diff.x * diff.x + diff.y * diff.y);
    
  }

  // Control this sprite using the Arrow Keys
  void keyboardControl()
  {
    // If I hit the LEFT arrow, go Left
    if (keyCode == LEFT)
    {
      this.velocity.x = -1;
      this.velocity.y = 0;
    }
    // if I hit the RIGHT arrow, go Right
    else if (keyCode == RIGHT)
    {
      this.velocity.x = 1;
      this.velocity.y = 0;
    }
    // if I hit the UP arrow, go Up
    if (keyCode == UP)
    {
      this.velocity.y = -1;
      this.velocity.x = 0;
    }
    // if I hit the DOWN arrow, go Down
    else if (keyCode == DOWN)
    {
      this.velocity.y = 1;
      this.velocity.x = 0;
    }
    // if I hit the Space Bar, Stop
    if (keyCode == ' ')
    {
      this.velocity.x = 0;
      this.velocity.y = 0;
    }

    // move x and y in the appropriate way
    this.location = this.location.add(this.velocity);

    // make sure we don't go out of bounds
    if (this.location.x < 0) this.location.x += width;
    if (this.location.x > width) this.location.x -= width;
    if (this.location.y < 0) this.location.y += height;
    if (this.location.y > height) this.location.y -= height;
  }

  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
