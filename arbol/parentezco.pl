%%
%% Declaraciones
%%

% Juan es padre de María
padrede('Juan', 'María'). 

% Pablo es padre de Juan y Marcela
padrede('Pablo', 'Juan').  
padrede('Pablo', 'Marcela').  

% Carlos es padre de Débora
padrede('Carlos', 'Débora').

% A es hijo de B si B es padre de A
hijode(A, B) :- 
    padrede(B, A).

% A es abuelo de B si A es padre de C y C es padre de B
abuelode(A, B) :- 
    padrede(A, C), 
    padrede(C, B).

% A y B son hermanos si el padre de A es el mismo que el de B y A no es B
hermanode(A, B) :- 
    padrede(C, A), 
    padrede(C, B), 
    A \== B.

% A y B son familiares si A es padre de B, hijo de B, o hermano de B
familiarde(A, B) :- 
    padrede(A, B).
familiarde(A, B) :- 
    hijode(A, B).
familiarde(A, B) :- 
    hermanode(A, B).
