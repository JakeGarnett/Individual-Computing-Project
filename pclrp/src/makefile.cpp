#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <stdlib.h>
#include <random>


using namespace std;
using matrix = vector< vector<double> >;

//======================================================================


int vertArr[20][20]; //the adjacency matrix initially 0
int count = 0;
void displayMatrix(int v) {
   int i, j;
   for(i = 0; i < v; i++) {
      for(j = 0; j < v; j++) {
         cout << vertArr[i][j] << " ";
      }
      cout << endl;
   }
}


//function to add unweighted edge into the matrix with random value

void add_edge(int u, int v) { 

   int MIN = -1;
   int MAX = 5;

   int rnd;

   std::random_device rd;
   std::default_random_engine eng(rd());
   std::uniform_int_distribution<int> distr(MIN, MAX);

   rnd = distr(eng);

   vertArr[u][v] = rnd;
   vertArr[v][u] = rnd;

}


main(int argc, char* argv[]) {

int v = 10; //there are 10 vertices in the graph


add_edge(0, 4);
add_edge(0, 3);
add_edge(1, 2);
add_edge(1, 4);
add_edge(1, 5);
add_edge(2, 3);
add_edge(2, 5);
add_edge(5, 3);
add_edge(5, 4);
add_edge(6,4);
add_edge(10,3);
add_edge(7,8);
add_edge(2,8);
add_edge(10,6);
add_edge(1,10);
add_edge(9,2);
add_edge(0,7);

displayMatrix(v);


//TODO: write matrix to file

}

