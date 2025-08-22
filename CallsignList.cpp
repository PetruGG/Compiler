#include "CallsignList.h"
void callsignList::addVar(const char* type,const char* name,const char* location,const char* value){
    callsignInfo var={string(type),string(name),string(location),string(value)};
    vars.push_back(var);
}
bool callsignList::existsVar(const char* type,const char* name,const char* location){
    string strtype=string(type);
    string strname=string(name);
    string strlocation=string(location);
    for(const callsignInfo& v : vars){
        if(strtype==v.type && strname==v.name && strlocation==v.location){
            return true;
        }
    }
    return false;
}
void callsignList::addValue(const char* name,const char* value){
    string strname=string(name);
    for(auto& v : vars){
        if(v.name==strname)
        {
            v.value=string(value);
            break;
        }
    }
}
bool isInteger(const string& s){
    if(s.empty()){
        return false;
    }
    for(char c : s){
        if(!isdigit(c)){
            return false;
        }
    }
    return true;
}

bool isFloat(const string& s){
    if(s.empty()){
        return false;
    }
    bool hasDecimal = false;
    for(char c : s){
        if(!std::isdigit(c)){
            if(c == '.' && !hasDecimal){
                hasDecimal = true;
            } 
            else{
                return false;
            }
        }
    }
    return hasDecimal;  
}
string callsignList::returnType(string name){
    for(auto& v : vars){
        if(v.name==name)
            return v.type;
    }
}
bool callsignList::checkType(const char* name){
    string strname=string(name);
    string typeaux;
    for(auto& v : vars){
        if(v.name==strname){
            if(v.value=="true" || v.value=="false")
                typeaux="bool";
            else if(isInteger(v.value))
                typeaux="int";
            else if(isFloat(v.value))
                typeaux="float";
            else
                typeaux=returnType(v.value);
            ssize_t found=v.type.find(typeaux);
            if(found==string::npos)
                return false;
        }
    }
    return true;
}
string callsignList::returnTypeGeneral(const char* name){
    string strname=string(name);
    string typeaux;
    for(auto& v : vars){
        if(v.name==strname){
            if(v.value=="true" || v.value=="false")
                typeaux="bool";
            else if(isInteger(v.value))
                typeaux="int";
            else if(isFloat(v.value))
                typeaux="float";
            else
                typeaux=returnType(v.value);
        }
    }
    return typeaux;
}
bool callsignList::checkIfDefined(const char* name){
    string strname=string(name);
    for(const callsignInfo& v : vars){
        if(strname==v.name){
            return true;
        }
    }
    return false;
}
void callsignList::printVars(){
    string outputFileName="output.txt";
    ofstream outputFile(outputFileName);
    outputFile<<"\tVariables/Constants information"<<endl;
    outputFile<<"TYPE\t"<<"NAME\t"<<"LOCATION\t"<<"VALUE"<<endl;
    for(const auto& callsignInfo : vars){
        outputFile<<callsignInfo.type<<" "<<callsignInfo.name<<" "<<callsignInfo.location<<" "<<callsignInfo.value<<endl;
    }
    outputFile.close();
}
callsignList::~callsignList(){
    vars.clear();
}
vector<string> functionList::convert_type(char parameter_types[100][100]){
    vector<string> result;
    for(int i=0;i<100 && parameter_types[i][0]!='\0';i++)
        result.push_back(string(parameter_types[i]));
    return result;
}
void functionList::f_addVar(const char* returned_type,const char* name,char parameter_types[100][100],const char* location){
    functionInfo var={string(returned_type),string(name),convert_type(parameter_types),string(location)};
    f_vars.push_back(var);
}
void functionList::f_addLocation(const char* location){
    for(auto& v : f_vars){
        if(v.location=="NULL")
            v.location=string(location);
    }
}
int functionList::f_existsVar(){
    int contor=0;
    for(const functionInfo& v : f_vars){
        for(const functionInfo& w : f_vars){
            if(v.returned_type==w.returned_type && v.name==w.name && v.location==w.location)
                contor++;
        }
    }
    return contor;
}
bool functionList::f_checkIfDefined(const char* name){
    string strname=string(name);
    for(const functionInfo& v : f_vars){
        if(strname==v.name){
            return true;
        }
    }
    return false;
}
void functionList::f_printVars(){
    string outputFileName="output.txt";
    ofstream outputFile(outputFileName,ios_base::app);
    outputFile<<"\tFunctions information"<<endl;
    outputFile<<"RETURNED TYPE\t"<<"NAME\t"<<"TYPE OF PARAMETERS\t"<<"LOCATION"<<endl;
    for(const auto& functionInfo : f_vars){
        outputFile<<functionInfo.returned_type<<" "<<functionInfo.name<<" ";
        for(const auto& str : functionInfo.parameter_types){
            outputFile<<str<<" ";
        }
        outputFile<<functionInfo.location<<endl;
    }
    outputFile.close();
}
functionList::~functionList(){
    f_vars.clear();
}