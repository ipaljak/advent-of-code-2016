#include <algorithm>
#include <cassert>
#include <cstdio>
#include <cstring>
#include <vector>

using namespace std;

const int MAXN = 1e4 + 10;

bool bio[MAXN];

int n;
int l[MAXN], r[MAXN];

vector <int> val[MAXN], out[MAXN];

void dfs(int node) {
  
  if (bio[node] || (int) val[node].size() < 2)
    return;

  bio[node] = true;

  if (l[node] >= 0)
    val[l[node]].push_back(min(val[node][0], val[node][1]));
  else
    out[-l[node] - 1].push_back(min(val[node][0], val[node][1]));

  if (r[node] >= 0)
    val[r[node]].push_back(max(val[node][0], val[node][1]));
  else
    out[-r[node] - 1].push_back(max(val[node][0], val[node][1]));

  if (l[node] >= 0) dfs(l[node]);
  if (r[node] >= 0) dfs(r[node]);

}

int main(void) {

  char s[10];
  while (scanf("%s", s) != EOF) {
    if (strcmp(s, "value") == 0) {
      int a, b;
      scanf("%d goes to bot %d", &a, &b);
      val[b].push_back(a);
      n = max(n, b);
    } else {
      char s1[10], s2[10];
      int bot, lo_dest, hi_dest;
      scanf("%d gives low to %s %d and high to %s %d", &bot, s1, &lo_dest, s2, &hi_dest);
      if (strcmp(s1, "output") == 0) {
        lo_dest *= -1;
        --lo_dest;
      }
      if (strcmp(s2, "output") == 0) {
        hi_dest *= -1;
        --hi_dest;
      }
      l[bot] = lo_dest;
      r[bot] = hi_dest;
      n = max(n, max(bot, max(lo_dest, hi_dest)));
    }
  }

  for (int i = 0; i <= n; ++i) 
    if (val[i].size() == 2 && !bio[i])
      dfs(i);

  for (int i = 0; i <= n; ++i) {
    if (val[i].size() == 2 && min(val[i][0], val[i][1]) == 17 && max(val[i][0], val[i][1]) == 61)
      printf("%d\n", i);
  }

  return 0;

}
