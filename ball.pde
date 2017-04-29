class Ball {
  float x1;
  float y1;
  float vx1;
  float vy1;
  float r1;
  color c1;
  
  float x2;
  float y2;
  float vx2;
  float vy2;
  float r2;
  color c2;
  
  float x3;
  float y3;
  float vx3;
  float vy3;
  float r3;
  color c3;
  
  float x4;
  float y4;
  float vx4;
  float vy4;
  float r4;
  color c4;
  
  
  Ball(float r1, color c1, float r2, color c2, float r3, color c3, float r4, color c4) {
    this.r1 = r1;
    this.c1 = c1;
    
    this.r2 = r2;
    this.c2 = c2;
    
    this.r3 = r3;
    this.c3 = c3;
    
    this.r4 = r4;
    this.c4 = c4;
  }
  
  void display() {
    fill(c1);
    noStroke();
    ellipse(x1, y1, r1 * 3, r1 * 3);
    
    fill(c2);
    noStroke();
    ellipse(x2, y2, r2 * 3, r2 * 3);
    
    fill(c3);
    noStroke();
    ellipse(x3, y3, r3 * 3, r3 * 3);
    
    fill(c4);
    noStroke();
    ellipse(x4, y4, r4 * 3, r4 * 3);
    }
}