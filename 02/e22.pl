% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Crea una lista con todos los enteros
%              dentro de un rango dado.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para crear una lista con todos los enteros dentro de un rango.
%     static List<int> Range(int start, int end)
%     {
%         List<int> result = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             result.Add(i);
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<int> lista = Range(1, 5);
%         Console.WriteLine(string.Join(", ", lista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Crea una lista con todos los enteros dentro de un rango dado.
range(I, I, [I]).
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

main :-
    Inicio = 1,  % valor inicial del rango
    Fin = 5,     % valor final del rango
    range(Inicio, Fin, ListaResultado),
    format('Rango de ~d a ~d: ~w~n', [Inicio, Fin, ListaResultado]).

