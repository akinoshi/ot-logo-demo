class Graffiti {
        int x = 0;
        int y = 0;
        
        public Graffiti(int x, int y){
                this.x = x;
                this.y = y;
        }
        
        
        public void show(){
                if(random(2) > 1){
                        noFill();
                        stroke(logo.get(x, y), 50);
                }else{
                        noStroke();
                        fill(logo.get(x, y), 50);
                }
        
                beginShape();
                for(int i=0; i<10; i++){
                        curveVertex(x, y);
                        x = x + (int)random(-5, 5);
                        y = y + (int)random(-5, 5);
                        
                        if(x<0 || x>width){
                                x = (int)random(width);
                        }
                        if(y<0 || y>height){
                                y = (int)random(height);
                        }
                }
                endShape();  
        }
}
