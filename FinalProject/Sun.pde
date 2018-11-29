class Sun{
float x, y, r;
color sunC = color (200, 0, 0);

    Sun(float x_, float y_, float r_){
      x = x_;
      y = y_;
      r = r_;
    }
    
    void display(){
      noStroke();
      fill(sunC);
      ellipse(x, y, r, r);
    }
    
    void highlight(){
    
    }
    
    void evolute(){
    }
}
