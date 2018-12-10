import geomerative.*;

RShape[] shan, bai, niu, ren, shou; //array of characters' stages
RPoint[] shan_pts0, shan_pts1, shan_pts2, shan_pts3, shan_pts4, shan_pts5; //arrays of each stage's points
RPoint[] bai_pts0, bai_pts1, bai_pts2, bai_pts3, bai_pts4, bai_pts5;
RPoint[] draw_shanPt, draw_baiPt;
RPoint[][] shan_pts_normalized, bai_pts_normalized; //an array of the normalizations of all stages' points
RContour shan_ct, bai_ct; //contour for each stages
int n; //number of points of each contour
//declare two index counters to identify the stage and its points
int shanIndex = 0, baiIndex = 0;
int shanPtIndex = 0, baiPtIndex = 0;

void setup(){
  //initialize the sketch
  size(600, 800);
  frameRate(60);
  background(225);
  
  //initialize the library
  RG.init(this);
  
  //load graphics
  imageMode(CENTER);
  shan = new RShape[6]; 
  shan[0] = RG.loadShape("shan1.svg");
  shan[1] = RG.loadShape("shan2.svg");
  shan[2] = RG.loadShape("shan3.svg");
  shan[3] = RG.loadShape("shan4.svg");
  shan[4] = RG.loadShape("shan5.svg");
  shan[5] = RG.loadShape("shan6.svg");
  
  bai = new RShape[6];
  bai[0] = RG.loadShape("bai1.svg");
  bai[1] = RG.loadShape("bai2.svg");
  bai[2] = RG.loadShape("bai3.svg");
  bai[3] = RG.loadShape("bai4.svg");
  bai[4] = RG.loadShape("bai5.svg");
  bai[5] = RG.loadShape("bai6.svg");
  
  
  //initialize get points array
  //"shan"
  shan_pts0 = shan[0].getPoints();
  shan_pts1 = shan[1].getPoints();
  shan_pts2 = shan[2].getPoints();
  shan_pts3 = shan[3].getPoints();
  shan_pts4 = shan[4].getPoints();
  shan_pts5 = shan[5].getPoints();
  //"bai"
  bai_pts0 = bai[0].getPoints();
  bai_pts1 = bai[1].getPoints();
  bai_pts2 = bai[2].getPoints();
  bai_pts3 = bai[3].getPoints();
  bai_pts4 = bai[4].getPoints();
  bai_pts5 = bai[5].getPoints();
    
  //normalized standard
  n = 600; 
  
  //initialize normalized and draw_pts array
    //"shan"
  shan_pts_normalized = new RPoint [shan.length][n];
  draw_shanPt = new RPoint [n];  
    //"bai"
  bai_pts_normalized = new RPoint [bai.length][n];
  draw_baiPt = new RPoint [n]; 
  
  //normalization
  for (int i = 0; i < n; i ++) {
    //shan_pts_normalized[0][i]= shan_pts0[i];
    shan_pts_normalized[0][i] = new RPoint(shan_pts0[floor((i*shan_pts0.length)/n)]);
    shan_pts_normalized[1][i] = new RPoint(shan_pts1[floor((i*shan_pts1.length)/n)]);
    shan_pts_normalized[2][i] = new RPoint(shan_pts2[floor((i*shan_pts2.length)/n)]);
    shan_pts_normalized[3][i] = new RPoint(shan_pts3[floor((i*shan_pts3.length)/n)]);
    shan_pts_normalized[4][i] = new RPoint(shan_pts4[floor((i*shan_pts4.length)/n)]);
    shan_pts_normalized[5][i] = new RPoint(shan_pts5[floor((i*shan_pts5.length)/n)]);
    
    //bai_pts_normalized[0][i]= bai_pts0[i];
    bai_pts_normalized[0][i] = new RPoint(bai_pts0[floor((i*bai_pts0.length)/n)]);
    bai_pts_normalized[1][i] = new RPoint(bai_pts1[floor((i*bai_pts1.length)/n)]);
    bai_pts_normalized[2][i] = new RPoint(bai_pts2[floor((i*bai_pts2.length)/n)]);
    bai_pts_normalized[3][i] = new RPoint(bai_pts3[floor((i*bai_pts3.length)/n)]);
    bai_pts_normalized[4][i] = new RPoint(bai_pts4[floor((i*bai_pts4.length)/n)]);
    bai_pts_normalized[5][i] = new RPoint(bai_pts5[floor((i*bai_pts5.length)/n)]);
    
  //initialize array   
    draw_shanPt[i] = new RPoint();
    draw_baiPt[i] = new RPoint();
    }
    
  smooth();
}

void draw(){
  //Clean frame
  //background(225);
  
  //set to draw in the center of the sketch
  //translate(width/10, height/4);
  //scale(3);
  
  //rest intervel
  int intervel = 5;
  
  //move stage by stage
  shanIndex = (floor(frameCount/(n+intervel))) % shan.length; //loop from 0 to 5
  baiIndex = (floor(frameCount/(n+intervel))) % bai.length;
  
  //interate each stage's points by increasing one for each loop
    //if (frameCount >= (shanIndex*(n+intervel) + 1) && frameCount <= (shanIndex*(n+intervel) + n)){
      shanPtIndex = (shanPtIndex + 1) % n; //loop from 0 to n-1  
      baiPtIndex = (baiPtIndex + 1) % n;
      
      println(shan_pts3.length);
    //}
  
  //pass the normalized data to the drawing points
  draw_shanPt [shanPtIndex] = new RPoint (shan_pts_normalized[shanIndex][shanPtIndex]);
  draw_baiPt [baiPtIndex] = new RPoint (bai_pts_normalized[baiIndex][baiPtIndex]);
  shan_ct = new RContour(draw_shanPt);
  bai_ct = new RContour(draw_baiPt);
    
  if(frameCount % (n+intervel) == 0){
    //Clean frame
    background(225);
    strokeWeight(1);
    stroke(200,200,0,80);
    shan_ct.draw();
    bai_ct.draw();
  }

  float shan_x = draw_shanPt [shanPtIndex].x;
  float shan_y = draw_shanPt [shanPtIndex].y;
  float bai_x = draw_baiPt [baiPtIndex].x;
  float bai_y = draw_baiPt [baiPtIndex].y;
  noStroke();
  fill(200,30,0);
  ellipse(shan_x, shan_y, 7-shanIndex,7-shanIndex);
  stroke(30,50,200);
  noFill();
  ellipse(bai_x, bai_y, 7-baiIndex,7-baiIndex);
}
