/**
 * File: OT_logo_graffiti.pde, Graffiti.pde
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
 * Date:  日  6月 10 17:20:32 CST 2012
 * Developing environment: Processing 2.0a6
 */


PImage logo = null;
Graffiti[] graffitis = new Graffiti[30];


void setup(){
        size(400, 400);
        background(255);
        smooth();
        
        logo = loadImage("ot-logo.png");
  
        for(int i=0; i<graffitis.length; i++){
                graffitis[i] = new Graffiti(int(random(width)), int(random(height)));
        }
}

void draw(){
        for(int i=0; i<graffitis.length; i++){
                graffitis[i].show();
        }
}


