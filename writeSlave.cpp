#include <iostream>
#include <cstdlib>
#include <fstream>
using namespace std;

int main(int argc, char ** argv){
  ofstream overwrite;
  overwrite.open(argv[1]);
  overwrite << "";

  ofstream toWrite;
  toWrite.open(argv[1], ios::app);
  
  for(int index = 2; index < argc; index ++){
    toWrite << argv[index] << endl;
  }
  toWrite.close();
  return 0;
}
