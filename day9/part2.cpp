#include <cstdio>
#include <cstring>

using namespace std;

typedef long long llint;

const int MAXLEN = 1e6 + 10;

char s[MAXLEN];

int n;

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

llint rek(int lo, int hi, int factor) {

  if (lo > hi)
    return 0;

  if (s[lo] != '(') 
    return (llint) factor + rek(lo + 1, hi, factor);

  ++lo;
  int A = parse_num(&lo, 'x');
  int B = parse_num(&lo, ')');

  return rek(lo, lo + A - 1, factor * B) + rek(lo + A, hi, factor);

}

int main(void) {

  scanf("%s", s);
  n = strlen(s);

  printf("%lld\n", rek(0, n - 1, 1));

  return 0;

}
