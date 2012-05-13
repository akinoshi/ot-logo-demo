/**
 * File: ot_logo_sodaplay.pde
 * --------------------------
 * This program demonstrates simple sodaplay algorithm
 * to draw OT logo.
 *
 * OpenLabTaipei
 * http://www.openlabtaipei.org/
 *
 * Processing
 * http://processing.org/
 *
 * Author: Akinori Kinoshita
 * E-mail: art.akinoshi -at- gmail.com
 * Date: Sun May 13 22:31:24 CST 2012
 */

import processing.opengl.*;

Mass m;
SpringSet a;

void setup() {
  // size(640, 480);
  size(640, 480, OPENGL);
  smooth();
  
  m = new Mass();
  m.x = width / 2;
  m.y = height / 2;
  
  a = new SpringSet(33);
}

void draw() {
  background(227, 236, 250);
  
  if (mousePressed) {
    /*
    m.x = mouseX;
    m.y = mouseY;
    m.vx = mouseX - pmouseX;
    m.vy = mouseY - pmouseY;
    */
    
    a.m[0].x = mouseX;
    a.m[0].y = mouseY;
    a.m[0].vx = mouseX - pmouseX;
    a.m[0].vy = mouseY - pmouseY;
  }
  
  m.update();
  
  // fill(0);
  // ellipse(m.x, m.y, 8, 8);
  
  a.update();
  a.display();
}
