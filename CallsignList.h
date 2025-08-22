#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <algorithm>
using namespace std;
struct callsignInfo{
    string type;
    string name;
    string location;
    string value;
};
struct functionInfo{
    string returned_type;
    string name;
    vector<string> parameter_types;
    string location;
};
class callsignList{
public:
    vector<callsignInfo> vars;
    bool existsVar(const char* type,const char* name,const char* location);
    void addValue(const char* name,const char* value);
    bool checkType(const char* name);
    string returnTypeGeneral(const char* name);
    string returnType(string name);
    bool checkIfDefined(const char* name);
    void addVar(const char* type,const char* name,const char* location,const char* value);
    void printVars();
    ~callsignList();
};
class functionList{
public:
    vector<functionInfo> f_vars;
    int f_existsVar();
    bool f_checkIfDefined(const char* name);
    void f_addVar(const char* returned_type,const char* name,char parameter_types[100][100],const char* location);
    void f_addLocation(const char* location);
    void f_printVars();
    ~functionList();
private:
    vector<string> convert_type(char parameter_types[100][100]);
};