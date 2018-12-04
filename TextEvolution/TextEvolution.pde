import geomerative.*;

RShape shan0, shan1, shan2, shan3, shan4, shan5, shan6; //shape of different evolution stages of "shan"
RPoint[] pts; //points

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
  shan0 = RG.getText("shan","Catamaran-SemiBold.ttf", 200, CENTER); 
  shan1 = RG.loadShape("shan1.jpg");
  shan2 = RG.loadShape("shan2.jpg");
  shan3 = RG.loadShape("shan3.jpg");
  shan4 = RG.loadShape("shan4.jpg");
  shan5 = RG.loadShape("shan5.jpg");
  shan6 = RG.loadShape("shan6.jpg");
  
}

void draw(){
  //Clean frame
  background(225);
  
  //set to draw in the center of the sketch
  // translate(width/2, height/2);
  
  //segment mode
  RG.setPolygonizer(RG.UNIFORMLENGTH); //uniformed length
  
  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  //get the contour points
  //link the points
  //add or reduce points when the contour length increase or decrease
  
}
