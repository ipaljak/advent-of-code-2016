#include <cstdio>
#include <cstring>
#include <vector>

using namespace std;

const int R = 6;
const int C = 50;

int sol;

char grid[R][C+1];

inline void rect(int r, int c) {
  for (int i = 0; i < r; ++i) {
    for (int j = 0; j < c; ++j) {
      sol += grid[i][j] == '.';
      grid[i][j] = '#';
    }
  }
}

inline void rot_row(int r, int n) {
  vector <char> tmp;
  for (int i = 0; i < C; ++i)
    tmp.push_back(grid[r][(C - n + i) % C]);
  for (int i = 0; i < C; ++i)
    grid[r][i] = tmp[i];
}

inline void rot_col(int c, int n) {
  vector <char> tmp;
  for (int i = 0; i < R; ++i)
    tmp.push_back(grid[(R - n + i) % R][c]);
  for (int i = 0; i < C; ++i)
    grid[i][c] = tmp[i];
}

int main(void) {

  memset(grid, '.', sizeof grid);

  char oper[10];
  while (scanf("%s", oper) != EOF) {
    if (strcmp(oper, "rect") == 0) {
      int c, r; scanf("%dx%d", &c, &r);
      rect(r, c);
    } else {
      char dummy[20], dim;
      int x, n;
      scanf("%s %c=%d by %d", dummy, &dim, &x, &n);
      if (dim == 'x')
        rot_col(x, n);
      else
        rot_row(x, n);
    }
  }

  printf("%d\n", sol);

  return 0;

}
