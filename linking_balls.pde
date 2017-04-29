//https://www.openprocessing.org/sketch/46828

String file = "695-776.csv"; // 20s
Table table;
Ball[] balls;
//int numBalls = 13;
float minDist = 200.0;//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
float springAmount1 = 0.000000005;
float springAmount2 = 0.000000005;
float springAmount3 = 0.000000005;
float springAmount4 = 0.000000005;
boolean bshow= true;
int n= int ((frameCount-1)/4);
int beat;

void setup() {
  background(0);
  frameRate(13); // 20*13 frames, 16(points on sreen), 80, : 1-16 data, 2-17 data...65-80 data, every piece exist 4 frames, every data exist 16*4 frames 
   // n= int((frameCount-1)/4), n <= i && i <=(n+15), are in display.
   //size(450, 450);
  //fullScreen();
  size(1920, 1080);
  smooth();
  beat = 0;
  
  table = loadTable(file, "header");
  balls = new Ball[table.getRowCount()]; 
  
  for (int i = 0; i < balls.length; i=i+1) {
    float r1= table.getRow(i).getFloat("excitement")/10;
    float r2= table.getRow(i).getFloat("frustration")/10;
    float r3= table.getRow(i).getFloat("valence")/10;
    float r4= table.getRow(i).getFloat("focus")/10;
    Ball ball = new Ball( r1, color(255,85,0,135-pow(1.5,r1+1)), r2, color(191,8,186,135-pow(1.5,r2+1)), r3, color(91,154,0,135-pow(1.5,r3+1)), r4, color(0,137,235,135-pow(1.5,r4+1)));
    
    ball.x1 = random(width/12, width/12*5);
    ball.y1 = random(height/12, height/12*5);
    ball.vx1 = random(-3, 3)*r1*2;
    ball.vy1 = random(-3, 3)*r1*2;
    
    ball.x2 = random(width/12*7, width/12*11);
    ball.y2 = random(height/12, height/12*5);
    ball.vx2 = random(-3, 3)*r2*2;
    ball.vy2 = random(-3, 3)*r2*2;
    
    ball.x3 = random(width/12, width/12*5);
    ball.y3 = random(height/12*7, height/12*11);
    ball.vx3 = random(-3, 3)*r3*2;
    ball.vy3 = random(-3, 3)*r3*2;
    
    ball.x4 = random(width/12*7, width/12*11);
    ball.y4 = random(height/12*7, height/12*11);
    ball.vx4 = random(-3, 3)*r4*2;
    ball.vy4 = random(-3, 3)*r4*2;
    
    balls[i] = ball;
  }
}




void draw() {
  background(0);
  int n= int ((frameCount-1)/4);
  
  for (int i = 0; i < balls.length; i=i+1) {

    Ball ball = balls[i];
    ball.x1 += ball.vx1;
    ball.y1 += ball.vy1;
    ball.x2 += ball.vx2;
    ball.y2 += ball.vy2;
    ball.x3 += ball.vx3;
    ball.y3 += ball.vy3;
    ball.x4 += ball.vx4;
    ball.y4 += ball.vy4;
    
    if (ball.x1 > width/12*5) {
      ball.x1 = width/12;
    } else if (ball.x1 < width/12) {
      ball.x1 = width/12*5;
    }
    if (ball.y1 > height/12*5) {
      ball.y1 = height/12;
    } else if (ball.y1 < height/12) {
      ball.y1 = height/12*5;
    }
    
    if (ball.x2 > width/12*11) {
      ball.x2 = width/12*7;
    } else if (ball.x2 < width/12*7) {
      ball.x2 = width/12*11;
    }
    if (ball.y2 > height/12*5) {
      ball.y2 = height/12;
    } else if (ball.y2 < height/12) {
      ball.y2 = height/12*5;
    }
    
    if (ball.x3 > width/12*5) {
      ball.x3 = width/12;
    } else if (ball.x3 < width/12) {
      ball.x3 = width/12*5;
    }
    if (ball.y3 > height/12*11) {
      ball.y3 = height/12*7;
    } else if (ball.y3 < height/12*7) {
      ball.y3 = height/12*11;
    }
    
    if (ball.x4 > width/12*11) {
      ball.x4 = width/12*7;
    } else if (ball.x4 < width/12*7) {
      ball.x4 = width/12*11;
    }
    if (ball.y4 > height/12*11) {
      ball.y4 = height/12*7;
    } else if (ball.y4 < height/12*7) {
      ball.y4 = height/12*11;
    }
  }
  
  
  
  //for (int i = 0; i < balls.length - 1; i=i+1) {
    
    // n= int((frameCount-1)/4), n <= i && i <=(n+15), are in display.
    
    for(int i=n; i <=n+15 && i< balls.length-1; i=i+1 ){//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
      if(bshow) balls[i].display();
      Ball partA = balls[i];
    
    for (int j = i + 1; j <=n+16 && j< balls.length-1; j=j+1) {
      Ball partB = balls[j];
      spring(partA, partB);
    } 
  }
  
  beat++;
  if ( beat == 260 ){
    exit();
  }
  saveFrame("data/screen-1080/####.jpg");
}

void mousePressed(){ exit();}






void spring(Ball partA, Ball partB) {
  
  float dx1 = partB.x1 - partA.x1;
  float dy1 = partB.y1 - partA.y1;
  float dist1 = sqrt(dx1 * dx1 + dy1 * dy1);
  if (dist1 < minDist) {
    strokeWeight(1);
    stroke(color(255,85,0, 255 - 255 * (dist1 / minDist)));
    if (bshow)line(partA.x1, partA.y1, partB.x1, partB.y1); //!!!!!!!!!!!!!!!!!!!
    float ax1 = dx1 * springAmount1;
    float ay1 = dy1 * springAmount1;
    partA.vx1 += ax1;
    partA.vy1 += ay1;
    partB.vx1 -= ax1;
    partB.vy1 -= ay1;
  }
  
  float dx2 = partB.x2 - partA.x2;
  float dy2 = partB.y2 - partA.y2;
  float dist2 = sqrt(dx2 * dx2 + dy2 * dy2);
  if (dist2 < minDist) {
    strokeWeight(1);
    stroke(color(191,8,186, 255 - 255 * (dist2 / minDist)));
    if (bshow) line(partA.x2, partA.y2, partB.x2, partB.y2);//!!!!!!!!!!!!!!!!!!!
    float ax2 = dx2 * springAmount2;
    float ay2 = dy2 * springAmount2;
    partA.vx2 += ax2;
    partA.vy2 += ay2;
    partB.vx2 -= ax2;
    partB.vy2 -= ay2;
  }
  
  float dx3 = partB.x3 - partA.x3;
  float dy3 = partB.y3 - partA.y3;
  float dist3 = sqrt(dx3 * dx3 + dy3 * dy3);
  if (dist3 < minDist) {
    strokeWeight(1);
    stroke(color(91,154,0, 255 - 255 * (dist3 / minDist)));
    if (bshow)line(partA.x3, partA.y3, partB.x3, partB.y3);//!!!!!!!!!!!!!!!!!!!
    float ax3 = dx3 * springAmount3;
    float ay3 = dy3 * springAmount3;
    partA.vx3 += ax3;
    partA.vy3 += ay3;
    partB.vx3 -= ax3;
    partB.vy3 -= ay3;
  }
  
  float dx4 = partB.x4 - partA.x4;
  float dy4 = partB.y4 - partA.y4;
  float dist4 = sqrt(dx4 * dx4 + dy4 * dy4);
  if (dist4 < minDist) {
    strokeWeight(1);
    stroke(color(0,137,235, 255 - 255 * (dist4 / minDist)));
   if (bshow) line(partA.x4, partA.y4, partB.x4, partB.y4);//!!!!!!!!!!!!!!!!!!!
    float ax4 = dx4 * springAmount4;
    float ay4 = dy4 * springAmount4;
    partA.vx4 += ax4;
    partA.vy4 += ay4;
    partB.vx4 -= ax4;
    partB.vy4 -= ay4;
  }
}