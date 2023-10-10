/*** Definition Section ***/
%{
int identifier=0;
int comment=0;
int keyword=0;

%}

/*** Rule Section ***/
%%
^[_]*[a-z|A-Z][a-z|A-Z|0-9]* identifier++;
^[_]*[a−z]*[A−Z]* identifier++;
([a−z]*[A−Z]*)+[0-9]* identifier++;
^([//]*[/*]*)+[0-9]*[A-Z]*([//]*[/*]*)+ comment++;
^[0-9]*[.]+[0-9]+ keyword++;
^[0-9]*[.][0-9]+e^[0-9]*[.][0-9]+ keyword++;
^[0-9]+e^[0-9]+ keyword++;

\n {return 0;}
%%

/*** Code Section ***/
int yywrap(){}
int main(){
yylex();
if(identifier!=0) printf("Valid identifier\n");
else printf("InValid\n");
if (comment!=0) printf("Valid comment\n");
else printf("InValid\n");
if (keyword!=0) printf("Valid keyword\n");
else printf("InValid\n");

return 0;
}
