dw-2020-parcial-1
================
Tepi
9/3/2020

# Examen parcial

Indicaciones generales:

-   Usted tiene el período de la clase para resolver el examen parcial.

-   La entrega del parcial, al igual que las tareas, es por medio de su
    cuenta de github, pegando el link en el portal de MiU.

-   Pueden hacer uso del material del curso e internet (stackoverflow,
    etc.). Sin embargo, si encontramos algún indicio de copia, se
    anulará el exámen para los estudiantes involucrados. Por lo tanto,
    aconsejamos no compartir las agregaciones que generen.

## Sección I: Preguntas teóricas.

-   Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
    deberá responder 5. Las 5 a responder estarán determinadas por un
    muestreo aleatorio basado en su número de carné.

-   Ingrese su número de carné en `set.seed()` y corra el chunk de R
    para determinar cuáles preguntas debe responder.

``` r
set.seed("20190435") 
v<- 1:10
preguntas <-sort(sample(v, size = 6, replace = FALSE ))

paste0("Mis preguntas a resolver son: ",paste0(preguntas,collapse = ", "))
```

    ## [1] "Mis preguntas a resolver son: 2, 3, 5, 6, 7, 8"

### Listado de preguntas teóricas

1.  Para las siguientes sentencias de `base R`, liste su contraparte de
    `dplyr`:

    -   `str()`
    -   `df[,c("a","b")]`
    -   `names(df)[4] <- "new_name"` donde la posición 4 corresponde a
        la variable `old_name`
    -   `df[df$variable == "valor",]`

2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

3.  ¿Por qué en R utilizamos funciones de la familia apply
    (lapply,vapply) en lugar de utilizar ciclos?

4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

5.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

6.  ¿Qué es un vector y en qué se diferencia en una lista en R?

7.  ¿Qué pasa si quiero agregar una nueva categoría a un factor que no
    se encuentra en los niveles existentes?

8.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?

    -   El nuevo elemento
    -   `NA`

9.  En SQL, ¿para qué utilizamos el keyword `HAVING`?

10. Si quiero obtener como resultado las filas de la tabla A que no se
    encuentran en la tabla B, ¿cómo debería de completar la siguiente
    sentencia de SQL?

    -   SELECT \* FROM A \_\_\_\_\_\_\_ B ON A.KEY = B.KEY WHERE
        \_\_\_\_\_\_\_\_\_\_ = \_\_\_\_\_\_\_\_\_\_

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

## Sección II Preguntas prácticas.

-   Conteste las siguientes preguntas utilizando sus conocimientos de R.
    Adjunte el código que utilizó para llegar a sus conclusiones en un
    chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

# RESPUESTAS

### Carga de librarías

``` r
#Carga de librerías
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

## I. Preguntas teóricas

##### 2. Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas funciones que el keyword `OR` para filtrar uno o más elementos una misma columna?

<span style="color:blue"> Dependiendo el contexto, si es para remplazar
condiciones de igualdad, se puede utilizar `IN`, tambien se puede
realizar 2 querys y unirlas por medio de `UNION` </span>

##### 3. ¿Por qué en R utilizamos funciones de la familia apply (lapply,vapply) en lugar de utilizar ciclos?

<span style="color:blue"> Se utiliza porque es mucho más legible que
utilizar ciclos anidados. </span>

##### 5. ¿Cuál es la forma correcta de cargar un archivo de texto donde el delimitador es `:`?

<span style="color:blue"> Se puede utilizar `read_delim()` por ejemplo:
`read.delim('archivo.txt', sep=':')` </span>

##### 6. ¿Qué es un vector y en qué se diferencia en una lista en R?

<span style="color:blue"> Un vector es un conjunto de datos del mismo
tipo. </span>

<span style="color:blue"> La lista es mucho más dinamica que el vector,
en el sentido que se puede hacer una lista de una combinacion de
distintos tipos de datos. Además una lista puede contener otras listas y
vectores </span>

##### 7. ¿Qué pasa si quiero agregar una nueva categoría a un factor que no se encuentra en los niveles existentes?

<span style="color:blue"> Se puede agregar usando append al vector de
los niveles EJEMPLO:

``` r
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata
```

    ##  [1] 1 2 2 3 1 2 3 3 1 2 3 3 1
    ## Levels: 1 2 3

``` r
levels(fdata) <- append(levels(fdata), 4) 
fdata
```

    ##  [1] 1 2 2 3 1 2 3 3 1 2 3 3 1
    ## Levels: 1 2 3 4

</span>

##### 8. Si en un dataframe, a una variable de tipo `factor` le agrego un nuevo elemento que *no se encuentra en los niveles existentes*, ¿cuál sería el resultado esperado y por qué?

##### \* \* evo elemento

##### \* `NA`

<span style="color:blue"> Se espera como resultado `NA`

replicacion del error:

``` r
df = data.frame( 
  "str" = c('str1', 'str2', 'str3'), 
  "num" = c(22, 25, 45),
  stringsAsFactors = T
) 
df[1, 1] = 34
```

    ## Warning in `[<-.factor`(`*tmp*`, iseq, value = 34): invalid factor level, NA
    ## generated

``` r
df
```

    ##    str num
    ## 1 <NA>  22
    ## 2 str2  25
    ## 3 str3  45

</span>

##### Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar utilizando como banco las diez acá presentadas? (responder con código de R.)

``` r
n_preguntas_examen <- 5
n_total_preguntas <- 10
n_posibles_examenes <- choose(n_total_preguntas, n_preguntas_examen)
n_posibles_examenes
```

    ## [1] 252

## II. Preguntas prácticas

#### A. De los clientes que están en más de un país,¿cuál cree que es el más rentable y por qué?

``` r
data <- readRDS("parcial_anonimo.rds")

clientes_2paises <- data %>% 
  select(Cliente, Pais, Venta) %>% 
  group_by(Cliente) %>% 
  summarise(num_paises = n_distinct(Pais), 
            sum_ventas = sum(Venta), 
            avg_ventas = mean(Venta), 
            n_ventas = n(),
            n_retorno_ventas = sum(Venta<0),
            n_ventas_positivas = sum(Venta>0),
            n_retorno_ventas_portenaje = (sum(Venta<0)/n()) ) %>% 
  filter(num_paises > 1)
```

#### B. Estrategia de negocio ha decidido que ya no operará en aquellos territorios cuyas pérdidas sean “considerables”. Bajo su criterio, ¿cuáles son estos territorios y por qué ya no debemos operar ahí?

``` r
territorios <- data %>% 
  select(Territorio, Pais, Venta) %>% 
  group_by(Territorio) %>% 
  summarise(sum_ventas = sum(Venta), 
            avg_ventas = mean(Venta), 
            n_ventas = n(),
            n_retorno_ventas = sum(Venta<0),
            n_retorno_ventas = sum(Venta>0),
            n_retorno_ventas_portenaje = (sum(Venta<0)/n())) 
```
