% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Elimina cada n-ésimo elemento de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para eliminar cada n-ésimo elemento de una lista.
%     static List<T> Drop<T>(List<T> list, int n)
%     {
%         List<T> result = new List<T>();
%         for (int i = 1; i <= list.Count; i++)
%         {
%             if (i % n != 0)
%             {
%                 result.Add(list[i - 1]);
%             }
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         List<char> sinCadaTercero = Drop(lista, 3);
%         Console.WriteLine(string.Join(", ", sinCadaTercero));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).

