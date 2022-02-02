#include <iostream>
#include <stdlib.h>
#include <random>

using namespace std;
int main(){
    int vertArr[100][100],filas,columnas,m,k;
    
    int v = 10; // verticies in grapth
    int MIN = -1;
    int MAX = 10;

    int rnd;

    std::random_device rd;
    std::default_random_engine eng(rd());
    std::uniform_int_distribution<int> distr(MIN, MAX);

  

    for(int i=0;i<v;i++)
    {
        for(int j=0;j<v;j++)
        {
            for (k=1; k<=v; k++)
            {
                rnd = distr(eng);
            vertArr[i][j]= rnd;
            }
        }
    }
    for(int i=0;i<v;i++){
        for(int j=0;j<v;j++){
            cout<<vertArr[i][j]<<" ";
        }
        cout<<"\n";
    }

    return 0;

}
