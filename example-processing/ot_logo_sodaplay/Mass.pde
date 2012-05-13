class Mass {

  float x, y, vx, vy, ax, ay;
  float const_friction = 0.9;
  
  void update() {
    vx += ax;
    vy += ay;
    ax = 0;
    ay = 0;
    vx *= const_friction;
    vy *= const_friction;
    x += vx;
    y += vy;
    
    if ( x < 0 ) {
      x = 0;
      vx *= -1;
    }
    if ( y < 0 ) {
      y = 0;
      vy *= -1;
    }
    if ( x > width ) {
      x = width;
      vx *= -1;
    }
    if ( y > height ) {
      y = height;
      vy *= -1;
    }
  }
}
