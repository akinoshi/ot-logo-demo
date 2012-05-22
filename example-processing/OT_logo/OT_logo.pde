/**
 * File: OT_logo.pde, cell.pde
 * --------------------------
 * This sketch demonstrates one way to draw OT logo
 *
 * OpenLabTaipei
 * http://www.openlabtaipei.org/
 *
 * Processing
 * http://processing.org/
 *
 * Author: Shengpo
 * E-mail: owen.s096 -at- gmail.com
 * Date:  二  5月 22 14:01:02 CST 2012
 * Developing environment: Processing 2.0a5
 */


//canvas for put cells on
int canvasWidth = 450;
int canvasHeight = 450;

//triangle cells
ArrayList<Cell> cellList = null;
int cellCountX = 11;
int cellCountY = 11;
color cellStrokeColor = color(255);
color cellFillColor = color(0);

//cell id for OT logo
int[] cellIDforOTlogo = new int[]{71, 72, 73, 74, 75, 76, 78, 79, 81, 82, 92, 95, 96, 101, 102, 103, 114, 115, 116, 117, 118, 121, 122, 126, 127, 139, 141, 142, 160, 161, 162};

//float rotateDegree = 0;
float rotateDegree = -25;


void setup(){
  size(400, 400);
  
  //set all cells
  cellList = new ArrayList<Cell>();
  int id = 0;
  for(int j=0; j<cellCountY; j++){
    for(int i=0; i<cellCountX; i++){
      if(checkOTlogoCell(id)){
        cellFillColor = color(255);
      }else{
        cellFillColor = color(0);
      }

      PVector v1 = new PVector(i*(canvasWidth/(cellCountX+0.0)), j*(canvasHeight/(cellCountY+0.0)));
      PVector v2 = new PVector((i+1)*(canvasWidth/(cellCountX+0.0)), j*(canvasHeight/(cellCountY+0.0)));
      PVector v3 = new PVector(i*(canvasWidth/(cellCountX+0.0)), (j+1)*(canvasHeight/(cellCountY+0.0)));
      cellList.add(new Cell(id++, v1, v2, v3, cellStrokeColor, cellFillColor));

      if(checkOTlogoCell(id)){
        cellFillColor = color(255);
      }else{
        cellFillColor = color(0);
      }

      v1 = new PVector(i*(canvasWidth/(cellCountX+0.0)), (j+1)*(canvasHeight/(cellCountY+0.0)));
      v2 = new PVector((i+1)*(canvasWidth/(cellCountX+0.0)), (j+1)*(canvasHeight/(cellCountY+0.0)));
      v3 = new PVector((i+1)*(canvasWidth/(cellCountX+0.0)), j*(canvasHeight/(cellCountY+0.0)));
      cellList.add(new Cell(id++, v1, v2, v3, cellStrokeColor, cellFillColor));
    }
  }
}

void draw(){
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rotateDegree));
  translate(-canvasWidth/2, -canvasHeight/2);
  
  for(int i=0; i<cellList.size(); i++){
    cellList.get(i).update();
    cellList.get(i).show();
  }
  popMatrix();
  
  strokeWeight(110);
  stroke(255);
  noFill();
  ellipse(width/2, height/2, width*1.25, height*1.25);
}


boolean checkOTlogoCell(int id){
  boolean result = false;
  
  for(int i=0; i<cellIDforOTlogo.length; i++){
    if(id == cellIDforOTlogo[i]){
      result = true;
    }
  }
  
  return result;
}

