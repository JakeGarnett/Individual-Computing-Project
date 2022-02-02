#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>


using namespace std;
std::vector<string> fileLines;

template <typename S>
ostream& operator<<(ostream& os,
                    const vector<S>& vector)
{
    // Printing all the elements
    // using <<
    for (auto element : vector) {
        os << element << " ";
    }
    return os;
}

int main () {


std::vector< int > tour(fileLines.size());
    
    ifstream inFile("../instances/pclrp04.txt");
		if ( inFile.is_open())
		{
			while (!inFile.eof())
			{
				string line;
				getline(inFile,line);
				fileLines.push_back(line);

                
			}

        for ( int i = 0; i < fileLines.size(); i++ )
			{
				std::string l = fileLines[i];
            }
                
        }
 
	cout << fileLines << " ";
	return 0;
}
