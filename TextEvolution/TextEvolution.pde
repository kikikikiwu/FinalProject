import geomerative.*;

RShape[] shan; //array of shan graphic stage
RShape origin;
RPoint[] shan_pts0, shan_pts1, shan_pts2, shan_pts3, shan_pts4, shan_pts5; //arrays of each stage's points
RPoint[] draw_pts;
RPoint[][] shan_pts_normalized; //an array of the normalizations of all stages' points
RContour shan_ct; //contour for each stages
int n; //number of points of each contour
//declare two index counters to identify the stage and its points
int shanIndex = 0;
int shanPtIndex = 0;

void setup(){
  //initialize the sketch
  size(600, 800);
  frameRate(20);
  background(225);
  
  //initialize the library
  RG.init(this);
  
  //load stage 0-6 graphics
  imageMode(CENTER);
  shan = new RShape[6]; 
  shan[0] = RG.loadShape("shan1.svg");
  shan[1] = RG.loadShape("shan2.svg");
  shan[2] = RG.loadShape("shan3.svg");
  shan[3] = RG.loadShape("shan4.svg");
  shan[4] = RG.loadShape("shan5.svg");
  shan[5] = RG.loadShape("shan6.svg");

  //initialize array
  shan_pts0 = shan[0].getPoints();
  shan_pts1 = shan[1].getPoints();
  shan_pts2 = shan[2].getPoints();
  shan_pts3 = shan[3].getPoints();
  shan_pts4 = shan[4].getPoints();
  shan_pts5 = shan[5].getPoints();
  
  n = shan_pts0.length; //normalized standard
  draw_pts = new RPoint [n];
  shan_pts_normalized = new RPoint [shan.length][n];
  
  //normalization
  for (int i = 0; i < n; i ++) {
    //shan_pts_normalized[0][i]= shan_pts0[i];
    shan_pts_normalized[0][i] = new RPoint(shan_pts0[floor((i*shan_pts0.length)/n)]);
    shan_pts_normalized[1][i] = new RPoint(shan_pts1[floor((i*shan_pts1.length)/n)]);
    shan_pts_normalized[2][i] = new RPoint(shan_pts2[floor((i*shan_pts2.length)/n)]);
    shan_pts_normalized[3][i] = new RPoint(shan_pts3[floor((i*shan_pts3.length)/n)]);
    shan_pts_normalized[4][i] = new RPoint(shan_pts4[floor((i*shan_pts4.length)/n)]);
    shan_pts_normalized[5][i] = new RPoint(shan_pts5[floor((i*shan_pts5.length)/n)]);
    
  //initialize array   
    draw_pts[i] = new RPoint();
    }
    
  smooth();
}

void draw(){
  //Clean frame
  //background(225);
  
  //set to draw in the center of the sketch
  translate(width/10, height/4);
  scale(3);
  
  //rest intervel
  int intervel = 50;
  
  //move stage by stage
  shanIndex = (floor(frameCount/(n+intervel))) % shan.length; //loop from 0 to 5
  
  //interate each stage's points by increasing one for each loop
    //if (frameCount >= (shanIndex*(n+intervel) + 1) && frameCount <= (shanIndex*(n+intervel) + n)){
      shanPtIndex = (shanPtIndex + 1) % n; //loop from 0 to n-1  
      println(frameCount,shanPtIndex);
    //}
  
  //pass the normalized data to the drawing points
  draw_pts [shanPtIndex] = new RPoint (shan_pts_normalized[shanIndex][shanPtIndex]);
  shan_ct = new RContour(draw_pts);
    
  if(frameCount % (n+intervel) == 0){
    //Clean frame
    background(225);
    strokeWeight(1);
    stroke(200,200,0,80);
    shan_ct.draw();
  }

  float xloc = draw_pts [shanPtIndex].x;
  float yloc = draw_pts [shanPtIndex].y;
  noStroke();
  fill(200,30,0);
  ellipse(xloc, yloc, 8-shanIndex,8-shanIndex);
   
}
