class Square{
  float x;
  float y;
  float a;
  float m;
  float s;
  
  Square(){
    a = 50;
    x = -2*width/6;
    y = height/3-15-a/2;
    m = 1;
    s = 0;
  }
  
  Square(float m_, float s_){
    m = m_;
    s = -s_;
    a = 50 + log(m);
    x = width/3;
    y = height/3-15-a/2;
  }
  
  void display(){
    square(x, y, a);
    text(str(m)+"kg", x, y, a, a);
  }
  
  void actu(){
    x += s*TIMEPERIOD;
  }
  
  boolean overlapps(Square p){
    float d = abs(p.x-x);
    if(d < a/2+p.a/2){
      return(true);
    } else {
      return(false);
    }
  }
  
  boolean wallHit(){
    if(x-a/2 < 15-width/2){
      s = -s;
      return(true);
    } else {
      return(false);
    }
  }
}
