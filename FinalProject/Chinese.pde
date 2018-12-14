class Chinese{
  RShape[] stages;
  RPoint[] stage0_pts, stage1_pts, stage2_pts, stage3_pts, stage4_pts, stage5_pts;//array of points for each stage
  RPoint[] draw_pts, tan;
  RPoint[][] stages_pts_normalized; //array of array of normalized points for each stage with the same amount of points
  RContour stage_ct;
  int num, intervel;
  int stageIndex, stagePtIndex;
  float x, y; //location for each character
  float tan_x, tan_y; //location of tangents
  ArrayList<PVector> eloc = new ArrayList<PVector>(); //pen points
  ArrayList<PVector> pline_s = new ArrayList<PVector>(); //purpleLine startings
  ArrayList<PVector> pline_e = new ArrayList<PVector>(); //purpleLine endings
  
  float agl = 400, r = 0.5; //camera angle and change rate
   
  //constructor
  Chinese(RShape[] stages_, float x_, float y_){
  
    num = 400;
    intervel = 50;
    stages = stages_;
    x = x_;
    y = y_;
    stageIndex = 0;
    stagePtIndex = 0;
  }
  
  //methods
  void getPt(){
    stage0_pts = stages[0].getPoints();
    stage1_pts = stages[1].getPoints();
    stage2_pts = stages[2].getPoints();
    stage3_pts = stages[3].getPoints();
    stage4_pts = stages[4].getPoints();
    stage5_pts = stages[5].getPoints();
  }
  
  void normalizePt(){
    //initialize RPoints arrays
    stages_pts_normalized = new RPoint [stages.length][num];
    draw_pts = new RPoint [num];  
    tan = new RPoint [num]; 
    
    //normalization
    for (int i = 0; i < num; i ++) {  //i => stagePtIndex
      stages_pts_normalized[0][i] = new RPoint(stage0_pts[floor((i*stage0_pts.length)/num)]);
      stages_pts_normalized[1][i] = new RPoint(stage1_pts[floor((i*stage1_pts.length)/num)]);
      stages_pts_normalized[2][i] = new RPoint(stage2_pts[floor((i*stage2_pts.length)/num)]);
      stages_pts_normalized[3][i] = new RPoint(stage3_pts[floor((i*stage3_pts.length)/num)]);
      stages_pts_normalized[4][i] = new RPoint(stage4_pts[floor((i*stage4_pts.length)/num)]);
      stages_pts_normalized[5][i] = new RPoint(stage5_pts[floor((i*stage5_pts.length)/num)]);
      
    //create RPoint instance  
      draw_pts[i] = new RPoint(); 
      tan[i] = new RPoint();   
    }
  }
  
  void drawPt(){   
    //set intervel
    stageIndex = (floor(frameCount/(num+intervel))) % stages.length; //loop from 0 to 5
    stagePtIndex = (stagePtIndex + 1) % num; //increase by 1 per frame and loop from 0 to n-1  
    
    //pass the normalized data to the drawing points
    draw_pts [stagePtIndex] = new RPoint (stages_pts_normalized[stageIndex][stagePtIndex]);
    tan = stages[stageIndex].getTangents();
    
    //set matrix for drawPts
    draw_pts[stagePtIndex].scale(0.32);
    draw_pts[stagePtIndex].translate(x, y+20);
    tan[stagePtIndex].scale(0.32);
    tan[stagePtIndex].translate(x, y);   
    
    /*
    //draw contour, starting from the second stage
    if(stageIndex >=1){
    strokeWeight(1);
    stroke(200,150,150,90);
    stage_ct = new RContour(draw_pts);
    stage_ct.draw();
    }
    */
          
    effects();
    intervel();
  }
  
  void effects(){
    //mouse-controlled camera effect
    
      if(mousePressed){
        //rotate effect
        rotateX(radians(map(mouseY, 0, height, 90, -90)));
        rotateY(radians(map(mouseX, 0, width, -90, 90)));
      }
      
      /*
      if(keyPressed && key == CODED){
        if(keyCode == UP || keyCode == RIGHT){
           agl = agl + r;
        }if(keyCode == DOWN || keyCode == LEFT){
           agl = agl - r;
        }
        rotateX(radians(map(agl, 0, height, 90, -90)));
        rotateY(radians(map(agl, 0, width, -90, 90)));
      }
      */
       
    //tangent line effect
      //style
      stroke(60, 20, 170, 30);
      strokeWeight(3);
      //initialize tangent location
      tan_x = tan[stagePtIndex].x;
      tan_y = tan[stagePtIndex].y;
      //interate the array to store locations
      for(int i=0; i<pline_s.size(); i++){
        PVector ps = pline_s.get(i);
        PVector pe = pline_e.get(i);
        //draw the whole array
        line(ps.x, ps.y, -300, pe.x, pe.y, 0);
      }   
      //add line points and store them into the above array
      pline_s.add(new PVector(tan_x, tan_y));
      pline_e.add(new PVector(mouseX, mouseY));
      
      /*
      //purple tangent lines
      stroke(60, 20, 170, 8);
      strokeWeight(3);
      line(tan_x, tan_y, -300, mouseX, mouseY, 0); 
      */
      
    //ellipsePen effect
      //style
      noStroke();
      fill(255,200);
      //interate the array to store locations
      for(int i=0; i<eloc.size(); i++){
        PVector e = eloc.get(i);
        //draw the whole array
        ellipse(e.x, e.y, 6, 6);
      }   
      //add pen points and store it into the above array
      eloc.add(new PVector(draw_pts[stagePtIndex].x, draw_pts[stagePtIndex].y));
    
    //contour effect
      //draw contour when keypressed, starting from the second stage
      if(keyPressed){
        if(stageIndex >=1){
        strokeWeight(2);
        stroke(200,150,150,80);
        stage_ct = new RContour(draw_pts);
        stage_ct.draw();
        }
      }
  } 
  void intervel(){
    //clean frame
    if(frameCount % (num+intervel) == 0){
      background(0);
      eloc.clear();
      pline_s.clear();
      pline_e.clear();
    }
  }
   
}
