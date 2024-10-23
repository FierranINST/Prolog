% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Genera una permutación aleatoria de
%              una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%     // Función para generar una permutación aleatoria de una lista.
%     static List<T> RndPermu<T>(List<T> list)
%     {
%         Random rand = new Random();
%         return list.OrderBy(x => rand.Next()).ToList();
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> permutacion = RndPermu(lista);
%         Console.WriteLine(string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una permutación aleatoria de los elementos de una lista.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).

main :-
    Lista = [a, b, c, d, e],  % lista de entrada
    rnd_permu(Lista, Permutacion),
    format('Permutación aleatoria: ~w~n', [Permutacion]).

