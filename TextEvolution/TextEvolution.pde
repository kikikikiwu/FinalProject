import geomerative.*;

RShape shan0, shan1, shan2, shan3, shan4, shan5, shan6; //shape of different evolution stages of "shan"
RPoint[] shan_pts1, shan_pts2; //point arrays for shan0-shan6
RContour shan_ct0, shan_ct1, shan_ct2, shan_ct3, shan_ct4, shan_ct5, shan_ct6; //contour for each stage
RPoint[] diff1;

void setup(){
  //initialize the sketch
  size(600, 800);
  frameRate(5);
  background(225);
  fill(70, 102, 127);
  strokeWeight(5);
  stroke(0);
  
  //initialize the library
  RG.init(this);
  
  //load stage 0-6 graphics
  imageMode(CENTER);
  shan0 = RG.getText("shan","ArmWrestler.ttf", 200, CENTER); 
  shan1 = RG.loadShape("shan1.svg");
  shan2 = RG.loadShape("shan2.svg");
  shan3 = RG.loadShape("shan3.svg");
  shan4 = RG.loadShape("shan4.svg");
  shan5 = RG.loadShape("shan5.svg");
  shan6 = RG.loadShape("shan6.svg");
  
  
  //get points for contour
  shan_pts1 = shan1.getPoints();
  shan_pts2 = shan2.getPoints();
  
  //initialize the points difference for movement
  diff1 = new RPoint[shan_pts1.length];
  
  //create the instance of contour
   //shan_ct1 = new RContour(shan_pts1);
   //shan_ct2 = new RContour(shan_pts2);
  
}

void draw(){
  //Clean frame
  background(225);
  
  //set to draw in the center of the sketch
  translate(width/3, height/3);
  
  //get the contour by points if there is any
  //if(shan_pts0 != null){
    noFill();
    strokeWeight(4);
    stroke(200,200,0);
  
  //count the points
  println(shan_pts1.length);
  
  //move the points  
  for(int i=0; i<shan_pts1.length; i++){
    shan_pts2[(int)(i*shan_pts2.length)/shan_pts1.length].sub(shan_pts1[i]);
    diff1[i] = shan_pts2[(int)(i*shan_pts2.length)/shan_pts1.length];
    shan_pts1[i].add(diff1[i]);
    shan_ct1 = new RContour(shan_pts1);
  }
    
    shan_ct1.draw();
    //shan_ct2.draw();
//  }
  
  //add or reduce points when the contour length increase or decrease
  
}
