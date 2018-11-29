class Mountain{
  
  Mountain(){
  }
  
  void display(){
    noStroke();
    //far mountain
    fill(220);
    triangle(500, height, 1100, height, 800, 70);
    fill(200);
    triangle(800, height, 1200, height, 1000, 300);
    //clickable mountains
    fill(0);
    triangle(80, height, 680, height, 380, 100);
    fill(60);
    triangle(0, height, 400, height, 200, 220);
    fill(120);
    triangle(450, height, 850, height, 650, 300);
    fill(180);
    triangle(350, height, 550, height, 450, 400);
  }
}
