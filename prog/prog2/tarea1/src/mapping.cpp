/*
  Módulo de definición de 'TMapping'.

  'TMapping' es un mapping de asociaciones de elementos de
   tipo nat con elementos de tipo double.

  Laboratorio de Programación 2.
  InCo-FIng-UDELAR
 */

#include "../include/listaInfo.h"
#include "../include/utils.h"
#include "../include/mapping.h"

// Biblioteca estándar
#include <assert.h>
#include <stdlib.h>

typedef struct repMap *TMapping;


struct repMap
{
  TLista lst;
}



TMapping crearMapping()
{
  TMapping p = new repMap;
  p->longitud = 0;
  return (p);
}


TMapping asociar(nat clave, double valor, TMapping map)
{

   if (longitud(map->lst) < MAX && posNat(clave, map->lst)) == 0) 
   { 
        info_t v1;
        v1.natural = clave;
        v1.real = valor; 
        insertar(longitud(map->lst), v1, map->list);

      
   }
   return(map);
}


bool esClave(nat clave, TMapping map)
{
    return posNat(clave, map->lst) != 0;
}



double valor(nat clave, TMapping map)
{
    info_t i = infolista(posNat(clave, map->lst), map->lst)  
    return i.real;
    
}   



TMapping desasociar(nat clave, TMapping map)
{
     if (posnat(clave, map->lst)) != 0 
     {
         map->lst = remover(posnat(clave, map->lst), map->lst);
         
     }
    
    return (map);
}

