int sx = 20, sy = 20;
int[][][] world = new int[sx][sy][2];
int start = 0;
void setup(){
  fill(0);
  background(255);
  textSize(20);
  size(420,600);
  for(int i = 0; i < sx; i++){
    for(int j = 0; j < sy; j++){
      world[i][j][1] = 0;
      text("○", 10 + 20 * i, 30 + 20 * j);
    }
  }
  text("Instructions: \nPress 'S' to start or pause. \nClick the mouse to fill in a circle. ", 10, 450);
//  world[18][18][1] = 1;
//  world[18][19][1] = 1;
//  world[18][20][1] = 1;
}

void draw(){
  if (start == 1){
    int c = 0;
    background(255);
    text("Instructions: \nPress 'S' to start or pause. \nClick the mouse to fill in a circle. ", 10, 450);
    text("Running", 50, 580);
    for (int i = 0; i < sx; i++){
      for (int j = 0; j < sy; j++){
        if (world[i][j][1] == 1){
          text("●", 10 + 20 * i, 30 + 20 * j);
        }
        if (world[i][j][1] == 0){
          text("○", 10 + 20 * i, 30 + 20 * j);
        }
        world[i][j][0] = world[i][j][1];
      }
    }
    for (int i = 0; i < sx; i++){
      for (int j = 0; j < sy; j++){
        c = countNeighbor(i, j);
        if (world[i][j][0] == 0 && c == 3)
          world[i][j][1] = 1;
        if (world[i][j][0] == 1 && (c < 2 || c > 3))
          world[i][j][1] = 0;
      }
    }
  }
}

void mousePressed(){
  if (mouseX < 410 && mouseY < 410){
    int i = (mouseX - 10) / 20;
    int j = (mouseY - 10) / 20;
    world[i][j][1] = 1;
    text("●", 10 + 20 * i, 30 + 20 * j);
  }
}

int countNeighbor(int x, int y){
  int count = world[(x + 1) % sx][y][0]
            + world[x][(y + 1) % sy][0]
            + world[(x + sx - 1) % sx][y][0]
            + world[x][(y + sx - 1) % sy][0]
            + world[(x + 1) % sx][(y + 1) % sy][0]
            + world[(x + 1) % sx][(y + sx - 1) % sy][0]
            + world[(x + sx - 1) % sx][(y + 1) % sy][0]
            + world[(x + sx - 1) % sx][(y + sx - 1) % sy][0];
  return count;
}

void keyPressed(){
  if (key == 's')
    if (start == 1)
      start = 0;
    else
      start = 1;
}
