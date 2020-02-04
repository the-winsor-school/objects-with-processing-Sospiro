class Vector2 {

  float x;
  float y;
  
  Vector2(float a, float b) {
    this.x = a;
    this.y = b;  
    //this is the Vector2 constructor
  }
  
  double magnitude() {
    double mag = Math.sqrt((this.x * this.x) + (this.y * this.y));
    return mag;
    //returns the magnitude of this vector
    //uses the Pythagorean Theorem to find the magnitude
  }
  
  //[return type] [name](parameters) -> all part of the method header below
  Vector2 add(Vector2 other) {
    float newX = other.x + this.x;
    float newY = other.y + this.y;
    return new Vector2(newX, newY);
    //returns the result when you add the other vector to this vector
  }
  
  Vector2 subtract(Vector2 other) {
    float newX = other.x - this.x;
    float newY = other.y - this.y;
    return new Vector2(newX, newY);
    //returns the result of when you subtract the other vector from this vector
  }
  
  Vector2 inverse() {
    float newX = this.x * -1;
    float newY = this.y * -1;
    return new Vector2(newX, newY);
    //returning a new Vector2 which has -x, -y instead of x, y
    //multiplied the x and y values of the original vector by -1 to get -x, -y
  }
  
  Vector2 scale(double s) {
    float newX = (float)(this.x * s);
    float newY = (float)(this.y * s);
    return new Vector2 (newX, newY);
    //returning a new Vector2 which had its x and y values increased/decreased by a scale of s when compared to the original vector
    //multiplying the x and y values of the original vector by s
  }
  
  Vector2 perpendicular() {
    float newX = this.y * -1;
    float newY = this.x;
    return new Vector2(newX, newY);
    //returning a new Vector2 that is perpendicular to the original vector
    //switching x to -y and switching y to x creates a perpendicular line
  }
  
  Vector2 unitVector() {
    float m = (float)magnitude();
    float newX = this.x / m;
    float newY = this.y / m;
    return new Vector2(newX, newY);
    //returning a new Vector2 which has a magnitude of 1 but still goes in the same direction as the original vector
    //basically dividing the x and y by the magnitude of the vector
  }
  
  double dotProduct(Vector2 other) {
    double dp = (this.x * other.x) + (this.y * other.y);
    return dp;
    //returning the dot-product of this vector and the other vector
    //using the formula where you multiply the x and y values of both vectors separately and then add them together, which gets us the dot-product as a result
  }
  
  double angle(Vector2 other) {
    double a = Math.acos((dotProduct(other))/((magnitude())*(other.magnitude())));
    return a;
    //this angle is in radians
    //used a formula which gets the cosine of the angle between the two vectors - the dot product of the two vectors divided by the product of the two vectors' magnitudes
    //once I got the cosine of the angle I wanted, I did the arccosine of this value to get the actual angle I wanted alone
  }
    
}
