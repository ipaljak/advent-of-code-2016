#include <cstdio>
#include <cstring>

using namespace std;

const int LEN = 1001;

char seq[LEN];

int r = 3, s = 1; 
char grid[][8] = {
  ".......",
  "...1...",
  "..234..",
  ".56789.",
  "..ABC..",
  "...D...",
  "......."};

void move(char c) {
  if (c == 'U' && grid[r - 1][s] != '.') --r;
  if (c == 'R' && grid[r][s + 1] != '.') ++s;
  if (c == 'D' && grid[r + 1][s] != '.') ++r;
  if (c == 'L' && grid[r][s - 1] != '.') --s;
}

inline void find_button() {
  int len = strlen(seq);
  for (int i = 0; i < len; ++i)
    move(seq[i]);
  printf("%c", grid[r][s]);
}

int main(void) {
  
  while (scanf("%s", seq) != EOF)
    find_button();

  printf("\n");

  return 0;

}
