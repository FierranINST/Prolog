% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              tabla de verdad para una expresión
%              lógica en dos variables.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para generar la tabla de verdad
%     static void TruthTable(Func<bool, bool, bool> expr)
%     {
%         Console.WriteLine("A B Result");
%         for (int a = 0; a <= 1; a++)
%         {
%             for (int b = 0; b <= 1; b++)
%             {
%                 Console.WriteLine($"{a} {b} {expr(a == 1, b == 1)}");
%             }
%         }
%     }
%
%     static void Main()
%     {
%         TruthTable((a, b) => a && b); // Ejemplo de AND
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
table(A, B, Expr) :- write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).
% ----------------------------------------------

