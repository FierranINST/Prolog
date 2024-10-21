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
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.
% ----------------------------------------------

