int n;
int precision;
float mass;
float TIMEPERIOD;
int count;
Square s1;
Square s2;

void setup(){
  precision = 3;
  n = 351;
  TIMEPERIOD = 1.0/n;
  count = 0;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  size(640, 360);
  mass = pow(10,2*precision);
  s1 = new Square();
  s2 = new Square(mass, 1);
}

void draw(){
  background(0);
  
  stroke(255);
  strokeWeight(1);
  line(0, height/6, 15, height/6);
  line(15, height/6, 15, 5*height/6-15);
  line(15, 5*height/6-15, width, 5*height/6-15);
  line(width, 5*height/6-15, width, 5*height/6);
  line(width, 5*height/6, 0, 5*height/6);
  line(0, 5*height/6, 0, height/6);
  
  translate(width/2, height/2);
  
  stroke(0, 255, 255);
  strokeWeight(1);
  noFill();
  s1.display();
  s2.display();
  
  for(int i=0; i<n; i++){    
    s1.actu();
    s2.actu();
    
    if(s1.wallHit()){
      count += 1;
    }
    
    if(s1.overlapps(s2)){
      float u1 = s1.s;
      float u2 = s2.s;
      float m1 = s1.m;
      float m2 = s2.m;
      float v1 = u1*(m1-m2)/(m1+m2)+u2*2*m2/(m1+m2);
      float v2 = u2*(m2-m1)/(m1+m2)+u1*2*m1/(m1+m2);
      s1.s = v1;
      s2.s = v2;
      count += 1;
    }
    
    stroke(255);
    strokeWeight(1);
    text(str(count)+" collisions", width/3, 1.25*height/3);
  }
}
