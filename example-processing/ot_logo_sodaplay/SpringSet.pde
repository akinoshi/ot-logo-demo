class SpringSet {

  Mass[] m;
  float[][] d;
  int num;
  
  SpringSet(int n) {
    m = new Mass[n];
    for (int i = 0; i < n; i++) {
      m[i] = new Mass();
      m[i].x = random(width);
      m[i].y = random(height);
    }
    
    // Center point
    m[0].x = width / 2;
    m[0].y = height / 2;
    
    // Coordinates for "o"
    m[1].x = width / 2 - 75;
    m[1].y = height / 2 - 75;
    m[2].x = width / 2 - 75;
    m[2].y = height / 2 - 45;
    m[3].x = width / 2 - 105;
    m[3].y = height / 2 - 15;
    m[4].x = width / 2 - 105;
    m[4].y = height / 2 - 45;
    
    m[5].x = width / 2 - 75;
    m[5].y = height / 2 - 75;
    m[6].x = width / 2 + 15;
    m[6].y = height / 2 - 75;
    m[7].x = width / 2 - 45;
    m[7].y = height / 2 - 15;
    m[8].x = width / 2 - 15;
    m[8].y = height / 2 - 15;
    m[9].x = width / 2 - 45;
    m[9].y = height / 2 + 15;
    m[10].x = width / 2 - 105;
    m[10].y = height / 2 + 15;
    m[11].x = width / 2 - 105;
    m[11].y = height / 2 - 15;
    m[12].x = width / 2 - 75;
    m[12].y = height / 2 - 15;
    m[13].x = width / 2 - 45;
    m[13].y = height / 2 - 45;
    m[14].x = width / 2 - 75;
    m[14].y = height / 2 - 45;
    
    // coordinates for "t"
    m[15].x = width / 2 + 15;
    m[15].y = height / 2 - 75;
    m[16].x = width / 2 + 45;
    m[16].y = height / 2 - 75;
    m[17].x = width / 2 + 45;
    m[17].y = height / 2 - 45;
    m[18].x = width / 2 + 15;
    m[18].y = height / 2 - 45;
    
    m[19].x = width / 2 + 75;
    m[19].y = height / 2 - 75;
    m[20].x = width / 2 + 105;
    m[20].y = height / 2 - 75;
    m[21].x = width / 2 + 75;
    m[21].y = height / 2 - 45;
    m[22].x = width / 2 + 75;
    m[22].y = height / 2 - 15;
    m[23].x = width / 2 + 45;
    m[23].y = height / 2 - 15;
    m[24].x = width / 2 - 45;
    m[24].y = height / 2 + 75;
    m[25].x = width / 2 - 75;
    m[25].y = height / 2 + 75;
    m[26].x = width / 2 - 75;
    m[26].y = height / 2 + 45;
    m[27].x = width / 2 - 45;
    m[27].y = height / 2 + 15;
    m[28].x = width / 2 - 45;
    m[28].y = height / 2 + 45;
    
    m[29].x = width / 2 + 75;
    m[29].y = height / 2 - 15;
    m[30].x = width / 2 + 105;
    m[30].y = height / 2 - 15;
    m[31].x = width / 2 + 105;
    m[31].y = height / 2 + 15;
    m[32].x = width / 2 + 75;
    m[32].y = height / 2 + 15;
    
    d = new float[n][n];
    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        d[i][j] = sqrt( sq(m[i].x - m[j].x) + sq(m[i].y - m[j].y) );
      }
    }
    
    num = n;
  }

  void display() {
    // Un-comment below to see the lines
    // stroke(0);
    for (int i = 1; i < num; i++) {
      for (int j = 0; j < i; j++) {
        line(m[i].x, m[i].y, m[j].x, m[j].y);
      }
    }
    
    fill(71, 185, 234);
    noStroke();
    beginShape();
    for (int i = 1; i <= 4; i++) {
      vertex(m[i].x, m[i].y);
    }
    endShape();
    
    beginShape();
    for (int i = 5; i <= 14; i++) {
      vertex(m[i].x, m[i].y);
    }
    endShape();
    
    beginShape();
    for (int i = 15; i <= 18; i++) {
      vertex(m[i].x, m[i].y);
    }
    endShape();
    
    beginShape();
    for (int i = 19; i <= 28; i++) {
      vertex(m[i].x, m[i].y);
    }
    endShape();
    
    beginShape();
    for (int i = 29; i < num; i++) {
      vertex(m[i].x, m[i].y);
    }
    endShape();
    
    for (int i = 0; i < num; i++) {
      fill(0);
      ellipse(m[i].x, m[i].y, 8, 8);
    }
  }
  
  void update() {
  
    for (int i = 1; i < num; i++) {
      for (int j = 0; j < i; j++) {
        float dist_offset = sqrt( sq(m[i].x - m[j].x) + sq(m[i].y - m[j].y) ) - d[i][j];
        float angle = atan2(m[i].y - m[j].y, m[i].x - m[j].x);
        m[i].ax -= cos(angle) * dist_offset * 0.1;
        m[i].ay -= sin(angle) * dist_offset * 0.1;
        m[j].ax += cos(angle) * dist_offset * 0.1;
        m[j].ay += sin(angle) * dist_offset * 0.1;
      }
    }
    
    for (int i = 0; i < num; i++) {
      m[i].update();
    }
  }

}
