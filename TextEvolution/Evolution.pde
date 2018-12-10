class Chinese{
  RShape[] stages;
  RPoint[] stage0_pts, stage1_pts, stage2_pts, stage3_pts, stage4_pts, stage5_pts;//array of points for each stage
  RPoint[] draw_pts;
  RPoint[][] stages_pts_normalized; //array of array of normalized points for each stage with the same amount of points
  RContour stage_ct;
  int num, intervel;
  int stageIndex, stagePtIndex;
  
  //constructor
  Chinese(RShape[] stages_){
  
    num = 600;
    intervel = 5;
    stages = stages_;
    /*stage0_pts = stage0_pts_;
    stage1_pts = stage1_pts_;
    stage2_pts = stage2_pts_;
    stage3_pts = stage3_pts_;
    stage4_pts = stage4_pts_;
    stage5_pts = stage5_pts_;*/
    
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
    //initialize normalized and draw_pts array
    stages_pts_normalized = new RPoint [stages.length][num];
    draw_pts = new RPoint [num];  
    
    //normalization
    for (int i = 0; i < num; i ++) {  //i => stagePtIndex
      stages_pts_normalized[0][i] = new RPoint(stage0_pts[floor((i*stage0_pts.length)/num)]);
      stages_pts_normalized[1][i] = new RPoint(stage1_pts[floor((i*stage1_pts.length)/num)]);
      stages_pts_normalized[2][i] = new RPoint(stage2_pts[floor((i*stage2_pts.length)/num)]);
      stages_pts_normalized[3][i] = new RPoint(stage3_pts[floor((i*stage3_pts.length)/num)]);
      stages_pts_normalized[4][i] = new RPoint(stage4_pts[floor((i*stage4_pts.length)/num)]);
      stages_pts_normalized[5][i] = new RPoint(stage5_pts[floor((i*stage5_pts.length)/num)]);
      
    //initialize array   
      draw_pts[i] = new RPoint();     
    }
  }
  
  void drawPt(){
    //set intervel
    stageIndex = (floor(frameCount/(num+intervel))) % stages.length; //loop from 0 to 5
    stagePtIndex = (stagePtIndex + 1) % num; //increase by 1 per frame and loop from 0 to n-1  
    
    //pass the normalized data to the drawing points
    draw_pts [stagePtIndex] = new RPoint (stages_pts_normalized[stageIndex][stagePtIndex]);
    stage_ct = new RContour(draw_pts);
    
    //clean frame but leave previous trace between stages
    if(frameCount % (num+intervel) == 0){
    background(225);
    strokeWeight(1);
    stroke(200,200,0,80);
    stage_ct.draw();
    }
  }
  
  void ellipsePen(){
    float stage_x = draw_pts [stagePtIndex].x;
    float stage_y = draw_pts [stagePtIndex].y;
    noStroke();
    fill(200,30,0);
    ellipse(stage_x, stage_y, 6, 6);
  }
}
