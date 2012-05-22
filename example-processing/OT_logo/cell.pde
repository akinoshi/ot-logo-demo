class Cell {
  private int id = -1;
  private PVector v1, v2, v3;
  private color strokeColor = 0;
  private color fillColor = 0;
  
  public Cell(int id, PVector v1, PVector v2, PVector v3, color strokeColor, color fillColor){
    this.id = id;
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
  }
  
  public void update(){
  }
  
  public void show(){
    strokeWeight(2);
    stroke(strokeColor);
    fill(fillColor);
    triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y);
  }
}
