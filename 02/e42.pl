% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que utiliza
%              operadores lógicos para definir
%              expresiones y generar tablas de verdad.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Definición de operadores lógicos
%     static bool And(bool a, bool b) => a && b;
%     static bool Or(bool a, bool b) => a || b;
%     static bool Xor(bool a, bool b) => a ^ b;
%     static bool Nor(bool a, bool b) => !(a || b);
%     static bool Nand(bool a, bool b) => !(a && b);
%     static bool Impl(bool a, bool b) => !a || b;
%     static bool Equiv(bool a, bool b) => a == b;
%
%     static void Main()
%     {
%         bool a = true, b = false;
%         Console.WriteLine($"AND: {And(a, b)}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una tabla de verdad para una expresión lógica en dos variables.
table(A, B, Expr) :-
    write(A), write(' '), write(B), write(' '),
    (   call(Expr) -> write(true) ; write(false) ),
    nl, fail.
table(_, _, _).

% Definición de los operadores lógicos básicos.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Función main para probar las tablas de verdad de varios operadores.
main :-
    write('Tabla de verdad para AND:'), nl,
    table(true, true, and(true, true)),
    table(true, false, and(true, false)),
    table(false, true, and(false, true)),
    table(false, false, and(false, false)),

    nl, write('Tabla de verdad para OR:'), nl,
    table(true, true, or(true, true)),
    table(true, false, or(true, false)),
    table(false, true, or(false, true)),
    table(false, false, or(false, false)),

    nl, write('Tabla de verdad para XOR:'), nl,
    table(true, true, xor(true, true)),
    table(true, false, xor(true, false)),
    table(false, true, xor(false, true)),
    table(false, false, xor(false, false)),

    nl, write('Tabla de verdad para IMPLICACIÓN:'), nl,
    table(true, true, impl(true, true)),
    table(true, false, impl(true, false)),
    table(false, true, impl(false, true)),
    table(false, false, impl(false, false)),

    nl, write('Tabla de verdad para EQUIVALENCIA:'), nl,
    table(true, true, equ(true, true)),
    table(true, false, equ(true, false)),
    table(false, true, equ(false, true)),
    table(false, false, equ(false, false)).
