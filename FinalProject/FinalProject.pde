import geomerative.*;

//Chinese graphics
RShape[] shan, bai, niu, ren, shou, yun; //array of characters' stages
Chinese shan_, bai_, niu_, ren_, shou_, yun_; //constructor --> (RShape[], xloc, yloc)

//text effect
ArrayList<DropText> texts = new ArrayList<DropText>();
int w_Index;
String[] words = {"mountain", "white", "ox", "human", "hand", "cloud"}; //a list of English words(translation)

//progress bar
PVector[] bar = new PVector [6]; //6 stages in total
  
void setup(){
  //initialize the sketch
  size(800, 600, P3D);
  frameRate(60);
  background(0);
  
  //initialize the library
  RG.init(this);
  
  //load graphics
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
  
  niu = new RShape[6]; 
  niu[0] = RG.loadShape("niu1.svg");
  niu[1] = RG.loadShape("niu2.svg");
  niu[2] = RG.loadShape("niu3.svg");
  niu[3] = RG.loadShape("niu4.svg");
  niu[4] = RG.loadShape("niu5.svg");
  niu[5] = RG.loadShape("niu6.svg");
  
  ren = new RShape[6]; 
  ren[0] = RG.loadShape("ren1.svg");
  ren[1] = RG.loadShape("ren2.svg");
  ren[2] = RG.loadShape("ren3.svg");
  ren[3] = RG.loadShape("ren4.svg");
  ren[4] = RG.loadShape("ren5.svg");
  ren[5] = RG.loadShape("ren6.svg");
  
  shou = new RShape[6]; 
  shou[0] = RG.loadShape("shou1.svg");
  shou[1] = RG.loadShape("shou2.svg");
  shou[2] = RG.loadShape("shou3.svg");
  shou[3] = RG.loadShape("shou4.svg");
  shou[4] = RG.loadShape("shou5.svg");
  shou[5] = RG.loadShape("shou6.svg");
  
  yun = new RShape[6]; 
  yun[0] = RG.loadShape("yun1.svg");
  yun[1] = RG.loadShape("yun2.svg");
  yun[2] = RG.loadShape("yun3.svg");
  yun[3] = RG.loadShape("yun4.svg");
  yun[4] = RG.loadShape("yun5.svg");
  yun[5] = RG.loadShape("yun6.svg");  
  
  //assign location & get points for normalization
  shan_ = new Chinese (shan, 0, 0);    
  shan_.getPt();
  shan_.normalizePt();
  
  bai_ = new Chinese (bai, width/3, 0);    
  bai_.getPt();
  bai_.normalizePt();
    
  niu_ = new Chinese (niu, 2*width/3, 0);    
  niu_.getPt();
  niu_.normalizePt();
    
  ren_ = new Chinese (ren, 0, height/2);    
  ren_.getPt();
  ren_.normalizePt();
    
  shou_ = new Chinese (shou, width/3, height/2);    
  shou_.getPt();
  shou_.normalizePt();
    
  yun_ = new Chinese (yun, 2*width/3, height/2);    
  yun_.getPt();
  yun_.normalizePt();
  
  //progress bar initialization
  for(int i=0; i<bar.length; i++){
    bar[i] = new PVector(230+i*65, 550);
  }
  
  //enable smoothing
  smooth();
}

void draw(){  
  background(0);
  shan_.drawPt();
  bai_.drawPt();
  niu_.drawPt();
  ren_.drawPt();
  shou_.drawPt();
  yun_.drawPt();   
  
  //text
  for (DropText text : texts) {
    text.display();
  }
  
  //draw progress bar
  pushMatrix();
  translate(0,0,0);
  for(int i=0; i<bar.length; i++){
    stroke(103, 87, 125);
    strokeWeight(2);
    if(i == shan_.stageIndex){
      fill(255);
      rect(bar[i].x, bar[i].y, 15, 15);
    }else{
      noFill();
      rect(bar[i].x, bar[i].y, 15, 15);
    }
  }
  popMatrix();
}

void mouseClicked(){      
   //add dropping words
   texts.add(new DropText(mouseX, mouseY, words));
}
