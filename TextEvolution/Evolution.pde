class Chinese{
  RShape[] stages;
  RPoint[] ptsStage0, ptsStage1,  ptsStage2,  ptsStage3,  ptsStage4,  ptsStage5;//points for each stage
  RPoint[] draw_Pt;
  RPoint[][] chinese_pts_normalized;
  RContour chinese_ct;
  int num;
  int stageIndex, stagePtIndex;
  
  //constructor
  Chinese(int num_, RShape[] stages_, 
          RPoint[] ptsStage0_, RPoint[] ptsStage1_, RPoint[] ptsStage2_, 
          RPoint[] ptsStage3_, RPoint[] ptsStage4_, RPoint[] ptsStage5_){
  
    num = num_;
    stages = stages_;
    ptsStage0 = ptsStage0_;
    ptsStage1 = ptsStage1_;
    ptsStage2 = ptsStage2_;
    ptsStage3 = ptsStage3_;
    ptsStage4 = ptsStage4_;
    ptsStage5 = ptsStage5_;
    
    stageIndex = 0;
    stagePtIndex = 0;
    
  }
  
  //methods
  void normalizePt(){
    //initialize normalized and draw_pts array
    chinese_pts_normalized = new RPoint [stages.length][n];
    draw_Pt = new RPoint [n];  
    
    //normalization
    for (int i = 0; i < n; i ++) {  //i => stagePtIndex
      chinese_pts_normalized[0][i] = new RPoint(ptsStage0[floor((i*ptsStage0.length)/n)]);
      chinese_pts_normalized[1][i] = new RPoint(ptsStage1[floor((i*ptsStage1.length)/n)]);
      chinese_pts_normalized[2][i] = new RPoint(ptsStage2[floor((i*ptsStage2.length)/n)]);
      chinese_pts_normalized[3][i] = new RPoint(ptsStage3[floor((i*ptsStage3.length)/n)]);
      chinese_pts_normalized[4][i] = new RPoint(ptsStage4[floor((i*ptsStage4.length)/n)]);
      chinese_pts_normalized[5][i] = new RPoint(ptsStage5[floor((i*ptsStage5.length)/n)]);
      
    //initialize array   
      draw_Pt[i] = new RPoint();     
    }
  }
}
