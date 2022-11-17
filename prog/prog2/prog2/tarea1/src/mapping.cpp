
/* 53205740 */

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
};

TMapping crearMapping()
{
  TMapping p = new repMap;
  (*p).lst = crearLista();
  return (p);
}

TMapping asociar(nat clave, double valor, TMapping map)
{
   if (longitud(map->lst) < MAX && posNat(clave, map->lst) == 0)
   { 
        info_t v1;
        v1.natural = clave;
        v1.real = valor; 
        map->lst = insertar(longitud(map->lst) + 1, v1, map->lst);      
   }
   return(map);
}

bool esClave(nat clave, TMapping map)
{
    return posNat(clave, map->lst) != 0;
}

double valor(nat clave, TMapping map)
{
    return (infoLista(posNat(clave, map->lst), map->lst)).real;
}   

TMapping desasociar(nat clave, TMapping map)
{
     if (posNat(clave, map->lst) != 0 )
     {
         (*map).lst = remover(posNat(clave, (*map).lst), (*map).lst);         
     }   
     return map;
}

