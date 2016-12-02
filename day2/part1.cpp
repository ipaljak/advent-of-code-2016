#include <cstdio>
#include <cstring>

using namespace std;

const int LEN = 1001;

char seq[LEN];

int r = 1, s = 1; 
int grid[][3] = {
  {1,2,3},
  {4,5,6},
  {7,8,9}};

void move(char c) {
  if (c == 'U' && r > 0) --r;
  if (c == 'R' && s < 2) ++s;
  if (c == 'D' && r < 2) ++r;
  if (c == 'L' && s > 0) --s;
}

inline void find_button() {
  int len = strlen(seq);
  for (int i = 0; i < len; ++i)
    move(seq[i]);
  printf("%d", grid[r][s]);
}

int main(void) {
  
  while (scanf("%s", seq) != EOF)
    find_button();

  printf("\n");

  return 0;

}
