int sx = 20, sy = 20;
int[][][] world = new int[sx][sy][2];
void setup(){
  fill(0);
  background(255);
  textSize(20);
  size(420,600);
  for(int i = 0; i < sx; i++){
    for(int j = 0; j < sy; j++){
      world[i][j][1] = (int)random(2);
    }
  }
}

void draw(){
    int c = 0;
    background(255);
    text("Instructions: \nPress 'S' to start or pause. \nClick the mouse to fill in a circle. ", 10, 450);
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
