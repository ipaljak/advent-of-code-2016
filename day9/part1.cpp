#include <cstdio>
#include <cstring>

using namespace std;

const int MAXLEN = 1e6 + 10;

char s[MAXLEN];

int n, sol;

int parse_num(int *i, char limit) {
  int ret = 0;
  while (s[*i] != limit) {
    ret *= 10;
    ret += s[*i] - '0';
    ++(*i);
  }
  ++(*i);
  return ret;
}

int main(void) {

  scanf("%s", s);
  n = strlen(s);

  for (int i = 0; i < n; ++i) {
    if (s[i] != '(') {
      ++sol;
      continue;
    }
    ++i;
    int A = parse_num(&i, 'x');
    int B = parse_num(&i, ')');
    sol += A * B;
    i += A - 1;
  }

  printf("%d\n", sol);

  return 0;

}
