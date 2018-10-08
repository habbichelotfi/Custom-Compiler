#include <iostream>

 extern int yyparse();
extern int yylineno;


int main(){
int result=yyparse();
if(result==0)
  std::cout << "the input is valid"<<std::endl;
  else
  std::cout<<"the input is invalid"<<std::endl;
  return result;
}
