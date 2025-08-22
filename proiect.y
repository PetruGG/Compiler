%{
    #include <iostream>
    #include <cstring>
    #include "CallsignList.h"
    extern FILE* yyin;
    extern char* yytext;
    extern int yylineno;
    extern int yylex();
    void yyerror(const char* s);
    class callsignList ids;
    class functionList f_ids;
    char structure_field_type[100][100];
    char structure_field_name[100][100];
    char function_parameter_type[100][100];
    char function_parameter_name[100][100];
    char function_block_variables_type[100][100];
    char function_block_variables_name[100][100];
    char used_variables_names[100][100];
    char expression_name[100][100];
    char assignment_name[100][100];
    char constant[100];
    int counter=0,counter1=0,counter2=0;
    int used_counter=0,expression_counter=0,assignment_counter=0;
%}
%union{
    char* string;
}
%token BGIN END CONST POSITIVEINT STRUCTURE ARRAY FUNCTION ASSIGN CONDITION THEN ELSE WHILE LOOP NR BVALUE
%token EVAL TYPEOF
%token<string> TYPE_INT TYPE_FLOAT TYPE_CHAR TYPE_STRING TYPE_BOOL CALLSIGN
%type<string> type callsign expression bvalue positiveint nr
%start program
%left '+' '-'
%left '*' '/'
%left AND OR
%left EQ NEQ '<' '>' LEQ GEQ
%left NOT 
%left '('
%%
program: user_defined_types global_variables global_functions block {std::cout<<"Programul este corect!\n"; 
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;

            assignment_counter=0;
            used_counter=0;}
        | user_defined_types global_functions block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;

            assignment_counter=0;
            used_counter=0;}
        | user_defined_types global_variables block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;}
        | user_defined_types block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;

            assignment_counter=0;
            used_counter=0;}
        | global_variables global_functions block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;}
        | global_variables block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;}
        | global_functions block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;}
        | block {std::cout<<"Programul este corect!\n";
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;}
        ;
user_defined_types: user_defined_types_declaration ';'
                    | user_defined_types user_defined_types_declaration ';'
                    ;
user_defined_types_declaration: STRUCTURE callsign '{' field_list '}' {
                                    if(!ids.existsVar("structure",$2,"global"))
                                    {
                                        ids.addVar("structure",$2,"global","NULL");
                                        for(int i=0;i<counter;i++)
                                            if(!ids.existsVar(structure_field_type[i],structure_field_name[i],$2))
                                                ids.addVar(structure_field_type[i],structure_field_name[i],$2,"NULL");
                                            else
                                                yyerror("Duplicate field declaration");
                                        f_ids.f_addLocation($2);
                                        if(f_ids.f_existsVar()==2)
                                            yyerror("Duplicate function declaration");
                                    }
                                    else 
                                        yyerror("Duplicate structure declaration");
                                    memset(structure_field_type, 0, sizeof(structure_field_type));
                                    memset(structure_field_name, 0, sizeof(structure_field_name));
                                    counter=0;
                                }
                                | CONST ARRAY STRUCTURE callsign callsign '[' positiveint ']' {
                                    strcpy(constant,"const ");
                                    strcat(constant,"vec ");
                                    strcat(constant,"structure ");
                                    strcat(constant,$4);
                                    if(!ids.existsVar(constant,$5,"global"))
                                        ids.addVar(constant,$5,"global","NULL");
                                    else
                                        yyerror("Duplicate structure declaration");
                                }
                                | ARRAY STRUCTURE callsign callsign '[' positiveint ']' {
                                    strcpy(constant,"vec ");
                                    strcat(constant,"structure ");
                                    strcat(constant,$3);
                                    if(!ids.existsVar(constant,$4,"global"))
                                        ids.addVar(constant,$4,"global","NULL");
                                    else
                                        yyerror("Duplicate structure declaration");
                                }
                                | STRUCTURE callsign callsign {
                                    if(!ids.existsVar($2,$3,"global"))
                                        ids.addVar($2,$3,"global","NULL");
                                    else
                                        yyerror("Duplicate structure declaration");
                                }
                                ;
field_list: field_definition
            | field_list ',' field_definition
            ;
field_definition: type callsign '(' parameter_list ')' '{' function_block '}' {
            for(int j=0;j<counter1;j++)
                if(!ids.existsVar(function_parameter_type[j],function_parameter_name[j],$2))
                    ids.addVar(function_parameter_type[j],function_parameter_name[j],$2,"NULL");
                else 
                    yyerror("Duplicate parameter declaration");
            for(int j=0;j<counter2;j++)
                if(!ids.existsVar(function_block_variables_type[j],function_block_variables_name[j],$2))
                    ids.addVar(function_block_variables_type[j],function_block_variables_name[j],$2,"NULL");
                else
                    yyerror("Duplicate function block variable declaration");
            f_ids.f_addVar($1,$2,function_parameter_type,"NULL");
            if(f_ids.f_existsVar()==2)
                yyerror("Duplicate function declaration");
            for(int j=0;j<used_counter;j++)
                if(!ids.checkIfDefined(used_variables_names[j]))
                    yyerror("Variable used but not defined");
            for(int j=0;j<assignment_counter;j++){
                ids.addValue(assignment_name[j],expression_name[j]);
                /*
                if(ids.checkType(assignment_name[j])==false)
                    yyerror("The type of the left side of the assignment does not match the type of the right side");
                */
            }
            memset(used_variables_names, 0, sizeof(used_variables_names));
            memset(expression_name, 0, sizeof(expression_name));
            memset(function_parameter_type, 0, sizeof(function_parameter_type));
            memset(function_parameter_name, 0, sizeof(function_parameter_name));
            memset(assignment_name, 0, sizeof(assignment_name));
            counter1=0;
            counter2=0;
            expression_counter=0;
            assignment_counter=0;
            used_counter=0;
        }
        | type callsign '(' parameter_list ')' {
            for(int j=0;j<counter1;j++)
                if(!ids.existsVar(function_parameter_type[j],function_parameter_name[j],$2))
                    ids.addVar(function_parameter_type[j],function_parameter_name[j],$2,"NULL");
                else
                    yyerror("Duplicate parameter declaration");
            f_ids.f_addVar($1,$2,function_parameter_type,"NULL");
            memset(function_parameter_type, 0, sizeof(function_parameter_type));
            memset(function_parameter_name, 0, sizeof(function_parameter_name));
            counter1=0;
        }
        | CONST ARRAY type callsign '[' positiveint ']' {
            strcpy(structure_field_type[counter],"const ");
            strcat(structure_field_type[counter],"vec ");
            strcat(structure_field_type[counter],$3);
            strcpy(structure_field_name[counter],$4);
            counter++;
        }
        | ARRAY type callsign '[' positiveint ']' {
            strcpy(structure_field_type[counter],"vec ");
            strcat(structure_field_type[counter],$2);
            strcpy(structure_field_name[counter],$3);
            counter++;
        }
        | CONST type callsign {
            strcpy(structure_field_type[counter],"const ");
            strcat(structure_field_type[counter],$2);
            strcpy(structure_field_name[counter],$3);
            counter++;
        }
        | type callsign {
            strcpy(structure_field_type[counter],$1);
            strcpy(structure_field_name[counter],$2);
            counter++;
        }
        ;
global_variables: global_variables_declaration ';'
                | global_variables global_variables_declaration ';'
                ;
global_variables_declaration : CONST ARRAY type callsign '[' positiveint ']'{
                                strcpy(constant,"const ");
                                strcat(constant,"vec ");
                                strcat(constant,$3);
                                if(!ids.existsVar(constant,$4,"global"))
                                    ids.addVar(constant,$4,"global","NULL");
                                else
                                    yyerror("Duplicate constant declaration");
                            }
                            | ARRAY type callsign '[' positiveint ']'{
                                strcpy(constant,"vec ");
                                strcat(constant,$2);
                                if(!ids.existsVar(constant,$3,"global"))
                                    ids.addVar(constant,$3,"global","NULL");
                                else
                                    yyerror("Duplicate variable declaration"); 
                            }
                            | CONST type callsign {
                                strcpy(constant,"const ");
                                strcat(constant,$2);
                                if(!ids.existsVar(constant,$3,"global"))
                                    ids.addVar(constant,$3,"global","NULL");
                                else
                                    yyerror("Duplicate constant declaration");
                            }
                            | type callsign {
                                if(!ids.existsVar($1,$2,"global"))
                                    ids.addVar($1,$2,"global","NULL");
                                else
                                    yyerror("Duplicate variable declaration"); 
                            }
                            ;
global_functions: global_functions_definitions ';'
                | global_functions global_functions_definitions ';'
                ;
global_functions_definitions: FUNCTION type callsign '(' parameter_list ')' '{' function_block '}' {
                                for(int j=0;j<counter1;j++)
                                    if(!ids.existsVar(function_parameter_type[j],function_parameter_name[j],$3))
                                        ids.addVar(function_parameter_type[j],function_parameter_name[j],$3,"NULL");
                                    else
                                        yyerror("Duplicate parameter declaration");
                                for(int j=0;j<counter2;j++)
                                    if(!ids.existsVar(function_block_variables_type[j],function_block_variables_name[j],$3))
                                        ids.addVar(function_block_variables_type[j],function_block_variables_name[j],$3,"NULL");
                                    else
                                        yyerror("Duplicate function block variable declaration");
                                f_ids.f_addVar($2,$3,function_parameter_type,"global");
                                if(f_ids.f_existsVar()==2)
                                    yyerror("Duplicate function declaration");
                                for(int j=0;j<used_counter;j++)
                                    if(!ids.checkIfDefined(used_variables_names[j]))
                                        yyerror("Variable used but not defined");
                                for(int j=0;j<assignment_counter;j++){
                                    ids.addValue(assignment_name[j],expression_name[j]);
                                    /*
                                    if(ids.checkType(assignment_name[j])==false)
                                        yyerror("The type of the left side of the assignment does not match the type of the right side");
                                    */
                                }
                                memset(used_variables_names, 0, sizeof(used_variables_names));
                                memset(expression_name, 0, sizeof(expression_name));
                                memset(function_parameter_type, 0, sizeof(function_parameter_type));
                                memset(function_parameter_name, 0, sizeof(function_parameter_name));
                                memset(assignment_name, 0, sizeof(assignment_name));
                                counter1=0;
                                counter2=0;
                                expression_counter=0;
                                assignment_counter=0;
                                used_counter=0;
                            } 
                            | FUNCTION type callsign '(' parameter_list ')' {
                                for(int j=0;j<counter1;j++)
                                    if(!ids.existsVar(function_parameter_type[j],function_parameter_name[j],$3))
                                        ids.addVar(function_parameter_type[j],function_parameter_name[j],$3,"NULL");
                                    else
                                        yyerror("Duplicate parameter declaration");
                                f_ids.f_addVar($2,$3,function_parameter_type,"global");
                                if(f_ids.f_existsVar()==2)
                                    yyerror("Duplicate function declaration");
                                memset(function_parameter_type, 0, sizeof(function_parameter_type));
                                memset(function_parameter_name, 0, sizeof(function_parameter_name));
                                counter1=0;
                            }
                            ;
parameter_list: parameter_definition
                | parameter_list ',' parameter_definition
                ;
parameter_definition: CONST ARRAY type callsign '[' positiveint ']' {
                strcpy(function_parameter_type[counter1],"const ");
                strcat(function_parameter_type[counter1],"vec ");
                strcat(function_parameter_type[counter1],$3);
                strcpy(function_parameter_name[counter1],$4);
                counter1++;
            }
            | ARRAY type callsign '[' positiveint ']' {
                strcpy(function_parameter_type[counter1],"vec ");
                strcat(function_parameter_type[counter1],$2);
                strcpy(function_parameter_name[counter1],$3);
                counter1++;
            }
            | CONST type callsign {
                strcpy(function_parameter_type[counter1],"const ");
                strcat(function_parameter_type[counter1],$2);
                strcpy(function_parameter_name[counter1],$3);
                counter1++;
            }
            | type callsign {
                strcpy(function_parameter_type[counter1],$1);
                strcpy(function_parameter_name[counter1],$2);
                counter1++;
            }
            ;
function_block: function_variables function_instructions_list
                ;
function_variables: function_variable_declaration ';'
                    | function_variables function_variable_declaration ';'
                    ;
function_variable_declaration: CONST ARRAY type callsign '[' positiveint ']' {
                                strcpy(function_block_variables_type[counter2],"const ");
                                strcat(function_block_variables_type[counter2],"vec ");
                                strcat(function_block_variables_type[counter2],$3);
                                strcpy(function_block_variables_name[counter2],$4);
                                counter2++;
                            }
                            | ARRAY type callsign '[' positiveint ']' {
                                strcpy(function_block_variables_type[counter2],"vec ");
                                strcat(function_block_variables_type[counter2],$2);
                                strcpy(function_block_variables_name[counter2],$3);
                                counter2++;
                            }
                            | CONST type callsign {
                                strcpy(function_block_variables_type[counter2],"const ");
                                strcat(function_block_variables_type[counter2],$2);
                                strcpy(function_block_variables_name[counter2],$3);
                                counter2++;
                            }
                            | type callsign {
                                strcpy(function_block_variables_type[counter2],$1);
                                strcpy(function_block_variables_name[counter2],$2);
                                counter2++;
                            }
                            |
                            ;
function_instructions_list: assignment
                            | function_call ';'
                            | control
                            | predefined_functions ';'
                            | function_instructions_list assignment
                            | function_instructions_list function_call ';'
                            | function_instructions_list control
                            | function_instructions_list predefined_functions ';'
                            ;
type: TYPE_INT {$$=strdup("int");}
    | TYPE_FLOAT {$$=strdup("float");}
    | TYPE_CHAR {$$=strdup("char");}
    | TYPE_STRING {$$=strdup("string");}
    | TYPE_BOOL {$$=strdup("bool");}
    ;
block: BGIN instructions_list END
    ;
instructions_list: statement
                ;
access_field: callsign '[' positiveint ']' '.' field {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
            | callsign '[' callsign ']' '.' field {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
            | callsign '.' field {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
            ;
field: callsign '(' parameter_list_access ')' {
                if(!f_ids.f_checkIfDefined($1))
                    yyerror("Function has not been defined");
            }
    | callsign '[' positiveint ']' {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
    | callsign '[' callsign ']' {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
    | callsign {
                strcpy(used_variables_names[used_counter],$1);
                used_counter++;
            }
    ;
function_call: callsign '(' parameter_list_access ')' {
                if(!f_ids.f_checkIfDefined($1))
                    yyerror("Function has not been defined");
            }
            ;
parameter_list_access: parameter_name
                    | parameter_list_access ',' parameter_name
                    ;
parameter_name: function_call
                | expression {
                    string first=ids.returnTypeGeneral(expression_name[0]);
                    for(int i=1;i<expression_counter;i++)
                        if(first!=ids.returnTypeGeneral(expression_name[i]))
                            yyerror("The operands in the expression dont have the same type");
                }
                | CONST callsign '[' positiveint ']'
                | CONST callsign '[' callsign ']'
                | CONST callsign
                | callsign '[' positiveint ']'
                | callsign '[' callsign ']'
                ;
statement: assignment
        | function_call ';'
        | control
        | predefined_functions ';'
        | statement assignment
        | statement function_call ';'
        | statement control
        | statement predefined_functions ';'
        ;
assignment: left_value ASSIGN expression ';' 
            ;
left_value: callsign '[' positiveint ']' {
                strcpy(used_variables_names[used_counter],$1);
                strcpy(assignment_name[assignment_counter],$1);
                assignment_counter++;
                used_counter++;
            }
            | callsign '[' callsign ']' {
                strcpy(used_variables_names[used_counter],$1);
                strcpy(assignment_name[assignment_counter],$1);
                assignment_counter++;
                used_counter++;
            }
            | callsign {
                strcpy(used_variables_names[used_counter],$1);
                strcpy(assignment_name[assignment_counter],$1);
                assignment_counter++;
                used_counter++;
            }
            ;
expression: callsign {
                strcpy(used_variables_names[used_counter],$1);
                strcpy(expression_name[expression_counter],$1);
                used_counter++;
                expression_counter++;
            }
            | positiveint {
                strcpy(expression_name[expression_counter],$1);
                expression_counter++;
            }
            | nr {
                strcpy(expression_name[expression_counter],$1);
                expression_counter++;
            }
            | access_field
            | bvalue {
                strcpy(expression_name[expression_counter],$1);
                expression_counter++;
            }
            | expression '*' expression
            | expression '/' expression
            | expression '+' expression
            | expression '-' expression
            | expression AND expression
            | expression OR expression
            | NOT expression
            | expression EQ expression
            | expression NEQ expression
            | expression LEQ expression
            | expression GEQ expression
            | expression '>' expression
            | expression '<' expression
            | '(' expression ')'
            ;
bvalue: BVALUE {$$=strdup(yytext);}
        ;
positiveint: POSITIVEINT {$$=strdup(yytext);}
            ;
nr: NR {$$=strdup(yytext);}
    ;
predefined_functions: EVAL '(' arg ')' 
                    | TYPEOF '(' arg ')'
                    ;
arg: expression 
    ;
control: if_statement
        | while_statement
        | for_statement
        ;
if_statement: CONDITION expression THEN '{' block '}' 
            | CONDITION expression THEN '{' block '}' ELSE '{' block '}'
            ;
while_statement: WHILE expression '{' block '}' 
                ;
for_statement: LOOP for_assignment ';' expression ';' for_assignment '{' block '}'
            ;
for_assignment: left_value ASSIGN expression
            ;
callsign: CALLSIGN {$$=strdup(yytext);}
        ;
%%
void yyerror(const char * s){
    std::cout<<"Eroare: "<<s<<" la linia: "<<yylineno<<std::endl;
    exit(EXIT_FAILURE);
}
int main(int argc, char** argv){
    yyin=fopen(argv[1],"r");
    yyparse();
    ids.printVars();
    f_ids.f_printVars(); 
    fclose(yyin);
    return 0; 
} 