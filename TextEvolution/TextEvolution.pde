import geomerative.*;

RShape[] shan, bai, niu, ren, shou; //array of characters' stages
Chinese shan_, bai_, niu_, ren_, shou_;

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
    
  shan_ = new Chinese (shan);    
  shan_.getPt();
  shan_.normalizePt();
  
  smooth();
}

void draw(){  
  shan_.drawPt();
  shan_.ellipsePen();
}
