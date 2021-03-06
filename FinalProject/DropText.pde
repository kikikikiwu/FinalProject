class DropText {
  //PVector velocity, gravity;
  PVector location;
  String[] word;
  int idx;
  PFont f;
  float s = 40, a = 150, dr1, dr2; //size, alpha and their decrease rates
  
  DropText(float x_, float y_, String[] word_) {
    
    //pass in location
    location = new PVector(x_,y_);
    
    //pass in array
    word = word_;
    
    //style
    f = createFont("Monoton-Regular.ttf", 50);
    dr1 = 0.5;
    dr2 = 1;
    
    /*
    //mover stats
    velocity = new PVector(0, 5);
    gravity = new PVector(0, 1);
    */    
  }
  
  void display() {
    //animation factor
    s = s - dr1;
    a = a - dr2;
    if ( s <= 0){
      s = 0;
      return;
    }
    if (a <= 0){
      a = 0;
      return;
    }
    
    //style
    textAlign(CENTER);
    textFont(f);
    textSize(s);
    fill(232, 174, 43, a);
    
   //update word index depending on mouse location
   if(location.x <= width/3 && location.y <= height/2){
     idx = 0; //mountain
   }
   else if(location.x >= width/3 && location.x <= 2*width/3 && location.y <= height/2){
     idx = 1; //white
   }
   else if(location.x >= 2*width/3 && location.y <= height/2){
     idx = 2; //ox
   }
   else if(location.x <= width/3 && location.y >= height/2){
     idx = 3; //human
   }
   else if(location.x >= width/3 && location.x <= 2*width/3 && location.y >= height/2){
     idx = 4; //hand
   }
   else if(location.x >= 2*width/3 && location.y >= height/2){
     idx = 5; //cloud
   }
    
    //display
    text(word[idx], location.x, location.y);
  }
  
  /*
  void drop() {
    if (location.y > height) {
      return;
    }
    velocity.add(gravity);
    location.add(velocity);
  }
  */  
}
