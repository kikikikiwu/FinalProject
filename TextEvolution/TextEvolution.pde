import geomerative.*;

RShape[] shan; //array of shan graphic stage
RPoint[] shan_pts0, shan_pts1, shan_pts2, shan_pts3, shan_pts4, shan_pts5; //arrays of each stage's points
RPoint[] draw_pts;
RPoint[][] shan_pts_normalized; //an array of the normalizations of all stages' points
RContour[] shan_ct; //contour arrays for all stages
int n; //number of points of each contour

void setup(){
  //initialize the sketch
  size(600, 800);
  frameRate(30);
  background(225);
  fill(70, 102, 127);
  strokeWeight(5);
  stroke(0);
  
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
     
  shan_ct = new RContour [shan.length];
  for(int i=0; i<shan.length; i++){
    shan_ct[i] = new RContour();
  }
  
  n = shan_pts0.length; //normalized standard
  draw_pts = new RPoint [n];
  shan_pts_normalized = new RPoint [shan.length][n];
  
  //normalization
  for (int i = 0; i < n; i ++) {
    shan_pts_normalized[0][i]= shan_pts0[i];
    shan_pts_normalized[1][i] = new RPoint(shan_pts1[floor((i*shan_pts1.length)/n)]);
    shan_pts_normalized[2][i] = new RPoint(shan_pts2[floor((i*shan_pts2.length)/n)]);
    shan_pts_normalized[3][i] = new RPoint(shan_pts3[floor((i*shan_pts3.length)/n)]);
    shan_pts_normalized[4][i] = new RPoint(shan_pts4[floor((i*shan_pts4.length)/n)]);
    shan_pts_normalized[5][i] = new RPoint(shan_pts5[floor((i*shan_pts5.length)/n)]);
    
  //initialize array   
    draw_pts[i] = shan_pts0[i];
    }
}

void draw(){
  //Clean frame
  background(225);
  
  //set to draw in the center of the sketch
  translate(width/4, height/4);
  scale(3);
  
  strokeWeight(1);
  stroke(200,200,0);
  
  //move stage by stage  
   for(int i=0; i<(floor(frameCount/n))%6; i++){
  //index increase frame by frame
     int f = frameCount % n;
  //pass the normalized data to the drawing points
     draw_pts [f] = new RPoint (shan_pts_normalized[i][f]);
     shan_ct[i] = new RContour(draw_pts);
     shan_ct[i].draw();
   }
   
  //add or reduce points when the contour length increase or decrease
  
}
