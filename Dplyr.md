dplyr
================
Cesar Quiroz, Danae Quispe & Gabriel Ricra
14/1/2022

# Instalación de paquetes

``` r
library(nycflights13)
```

    ## Warning: package 'nycflights13' was built under R version 4.1.2

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 4.1.2

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.5     v purrr   0.3.4
    ## v tibble  3.1.6     v dplyr   1.0.7
    ## v tidyr   1.1.4     v stringr 1.4.0
    ## v readr   2.1.1     v forcats 0.5.1

    ## Warning: package 'ggplot2' was built under R version 4.1.2

    ## Warning: package 'forcats' was built under R version 4.1.2

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

# 1. Dplyr - filter

## 1.1 Encuentra todos los vuelos que:

### Tuvieron un retaso de llegada de dos o más horas

``` r
filter(flights, arr_delay >= 120)
```

    ## # A tibble: 10,200 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      811            630       101     1047            830
    ##  2  2013     1     1      848           1835       853     1001           1950
    ##  3  2013     1     1      957            733       144     1056            853
    ##  4  2013     1     1     1114            900       134     1447           1222
    ##  5  2013     1     1     1505           1310       115     1638           1431
    ##  6  2013     1     1     1525           1340       105     1831           1626
    ##  7  2013     1     1     1549           1445        64     1912           1656
    ##  8  2013     1     1     1558           1359       119     1718           1515
    ##  9  2013     1     1     1732           1630        62     2028           1825
    ## 10  2013     1     1     1803           1620       103     2008           1750
    ## # ... with 10,190 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Volaron a Houston (IAH oHOU)

``` r
filter(flights,dest == "IAH" | dest ==  "HOU" )
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Fueron operados por United, American o Delta

``` r
filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")
```

    ## # A tibble: 139,504 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Partieron en invierno del hemisferio sur (julio, agosto y septiembre)

``` r
filter(flights, month == 07 | month == 08 | month == 09)
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Llegaron más de dos horas tarde, pero no salieron tarde

``` r
flights %>% 
  filter(arr_delay > 120) %>% 
  filter(dep_delay == 0)
```

    ## # A tibble: 3 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013    10     7     1350           1350         0     1736           1526
    ## 2  2013     5    23     1810           1810         0     2208           2000
    ## 3  2013     7     1      905            905         0     1443           1223
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

### Se retrasaron por lo menos una hora, pero repusieron más de 30 minutos en vuelo

``` r
flights %>%
  filter(dep_delay >= 60) %>%
  filter(arr_delay == 30)
```

    ## # A tibble: 33 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013    10     5     1605           1500        65     1857           1827
    ##  2  2013    10     9     2056           1955        61     2217           2147
    ##  3  2013    10    11     2101           2000        61     2202           2132
    ##  4  2013    10    15     2008           1900        68     2131           2101
    ##  5  2013    11     6     2208           2100        68     2309           2239
    ##  6  2013    11     9     2021           1915        66     2203           2133
    ##  7  2013    12    27     1709           1605        64     1906           1836
    ##  8  2013    12    28     1953           1845        68     2250           2220
    ##  9  2013     2    16     1741           1630        71     1917           1847
    ## 10  2013     3     3     1719           1605        74     1903           1833
    ## # ... with 23 more rows, and 11 more variables: arr_delay <dbl>, carrier <chr>,
    ## #   flight <int>, tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>,
    ## #   distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Partieron entre la medianoche y las 6 a.m. (incluyente)

``` r
filter(flights, sched_dep_time %in% c(1:600) | sched_dep_time == 2400)
```

    ## # A tibble: 8,970 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 8,960 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 1.2 Otra función de dplyr que es útil para usar filtros es between(). ¿Qué hace? ¿Puedes usarla para simplificar el código necesario para responder a los desafíos anteriores?

``` r
filter(flights, between(month, 2, 3))
```

    ## # A tibble: 53,785 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     2     1      456            500        -4      652            648
    ##  2  2013     2     1      520            525        -5      816            820
    ##  3  2013     2     1      527            530        -3      837            829
    ##  4  2013     2     1      532            540        -8     1007           1017
    ##  5  2013     2     1      540            540         0      859            850
    ##  6  2013     2     1      552            600        -8      714            715
    ##  7  2013     2     1      552            600        -8      919            910
    ##  8  2013     2     1      552            600        -8      655            709
    ##  9  2013     2     1      553            600        -7      833            815
    ## 10  2013     2     1      553            600        -7      821            825
    ## # ... with 53,775 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 1.3 ¿Cuántos vuelos tienen datos faltantes en horario_salida? ¿Qué otras variables tienen valores faltantes? ¿Qué representan estas filas?

``` r
filter(flights, is.na(dep_time))
```

    ## # A tibble: 8,255 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1       NA           1630        NA       NA           1815
    ##  2  2013     1     1       NA           1935        NA       NA           2240
    ##  3  2013     1     1       NA           1500        NA       NA           1825
    ##  4  2013     1     1       NA            600        NA       NA            901
    ##  5  2013     1     2       NA           1540        NA       NA           1747
    ##  6  2013     1     2       NA           1620        NA       NA           1746
    ##  7  2013     1     2       NA           1355        NA       NA           1459
    ##  8  2013     1     2       NA           1420        NA       NA           1644
    ##  9  2013     1     2       NA           1321        NA       NA           1536
    ## 10  2013     1     2       NA           1545        NA       NA           1910
    ## # ... with 8,245 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
#Los vuelos que tienen `NA` en su horario de salida, también lo tienen en el horario de llegada, por lo que deducimos que son vuelos que han sido cancelados.
```

## 1.4 ¿Por qué NA^0 no es faltante? ¿Por qué NA \| TRUE no es faltante? ¿Por qué FALSE & NA no es faltante? ¿Puedes descubrir la regla general? (¡NA \* 0 es un contraejemplo complicado!)

``` r
x <- c(NA)
is.na(x) 
```

    ## [1] TRUE

``` r
#La función `is.na()` determina si falta un valor y devuelve un valor lógico `TRUE` en los casos en que es NA.

x^0
```

    ## [1] 1

``` r
#Dado que el NA podría tomar cualquier valor, es práctico pensar que cualquier número (aunque sea muy grande) a la potencia cero es igual a 1.

x | TRUE 
```

    ## [1] TRUE

``` r
#Es igual a TRUE pues el NA se entiende como un valor lógico (`TRUE` or `FALSE`) y por lógica proposicional es siempre igual a `TRUE`.

x & FALSE
```

    ## [1] FALSE

``` r
#Es igual a `TRUE` pues el NA se entiende como un valor lógico (`TRUE` or `FALSE`) y por lógica proposicional es siempre `FALSE`.

x * 0
```

    ## [1] NA

``` r
Inf*0
```

    ## [1] NaN

``` r
#En este contraejemplo puede ser útil pensar que el `NA` puede tomar cualquier valor, incluso podría ser un número muy grande; el cual al multiplicarse por cero nos da una indeterminación que `R` define como `NaN` (Not a Number). Por otro lado, si el `NA` fuese un valor pequeño, entonces `NA*0` sería igual a cero. Luego, es mejor pensar en `x*0` como un `NA` porque no sabemos en cual de los dos casos anteriores estamos.
```

# 2. Dplyr - arrange

## 2.1 ¿Cómo podrías usar arrange() para ordenar todos los valores faltantes al comienzo? (Sugerencia: usa is.na()).

``` r
arrange(flights,desc(is.na(dep_time)))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1       NA           1630        NA       NA           1815
    ##  2  2013     1     1       NA           1935        NA       NA           2240
    ##  3  2013     1     1       NA           1500        NA       NA           1825
    ##  4  2013     1     1       NA            600        NA       NA            901
    ##  5  2013     1     2       NA           1540        NA       NA           1747
    ##  6  2013     1     2       NA           1620        NA       NA           1746
    ##  7  2013     1     2       NA           1355        NA       NA           1459
    ##  8  2013     1     2       NA           1420        NA       NA           1644
    ##  9  2013     1     2       NA           1321        NA       NA           1536
    ## 10  2013     1     2       NA           1545        NA       NA           1910
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 2.2 Ordena vuelos para encontrar los vuelos más retrasados. Encuentra los vuelos que salieron más temprano.

``` r
arrange(flights, desc(dep_delay))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     9      641            900      1301     1242           1530
    ##  2  2013     6    15     1432           1935      1137     1607           2120
    ##  3  2013     1    10     1121           1635      1126     1239           1810
    ##  4  2013     9    20     1139           1845      1014     1457           2210
    ##  5  2013     7    22      845           1600      1005     1044           1815
    ##  6  2013     4    10     1100           1900       960     1342           2211
    ##  7  2013     3    17     2321            810       911      135           1020
    ##  8  2013     6    27      959           1900       899     1236           2226
    ##  9  2013     7    22     2257            759       898      121           1026
    ## 10  2013    12     5      756           1700       896     1058           2020
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 2.3 Ordena vuelos para encontrar los vuelos más rápidos (que viajaron a mayor velocidad).

``` r
arrange(flights, desc(distance/air_time))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     5    25     1709           1700         9     1923           1937
    ##  2  2013     7     2     1558           1513        45     1745           1719
    ##  3  2013     5    13     2040           2025        15     2225           2226
    ##  4  2013     3    23     1914           1910         4     2045           2043
    ##  5  2013     1    12     1559           1600        -1     1849           1917
    ##  6  2013    11    17      650            655        -5     1059           1150
    ##  7  2013     2    21     2355           2358        -3      412            438
    ##  8  2013    11    17      759            800        -1     1212           1255
    ##  9  2013    11    16     2003           1925        38       17             36
    ## 10  2013    11    16     2349           2359       -10      402            440
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 2.4 ¿Cuáles vuelos viajaron más lejos? ¿Cuál viajó más cerca?

``` r
arrange(flights,desc(distance))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      857            900        -3     1516           1530
    ##  2  2013     1     2      909            900         9     1525           1530
    ##  3  2013     1     3      914            900        14     1504           1530
    ##  4  2013     1     4      900            900         0     1516           1530
    ##  5  2013     1     5      858            900        -2     1519           1530
    ##  6  2013     1     6     1019            900        79     1558           1530
    ##  7  2013     1     7     1042            900       102     1620           1530
    ##  8  2013     1     8      901            900         1     1504           1530
    ##  9  2013     1     9      641            900      1301     1242           1530
    ## 10  2013     1    10      859            900        -1     1449           1530
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
arrange(flights,distance)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7    27       NA            106        NA       NA            245
    ##  2  2013     1     3     2127           2129        -2     2222           2224
    ##  3  2013     1     4     1240           1200        40     1333           1306
    ##  4  2013     1     4     1829           1615       134     1937           1721
    ##  5  2013     1     4     2128           2129        -1     2218           2224
    ##  6  2013     1     5     1155           1200        -5     1241           1306
    ##  7  2013     1     6     2125           2129        -4     2224           2224
    ##  8  2013     1     7     2124           2129        -5     2212           2224
    ##  9  2013     1     8     2127           2130        -3     2304           2225
    ## 10  2013     1     9     2126           2129        -3     2217           2224
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

# 3. Dplyr - select

## 3.1 Haz una lluvia de ideas sobre tantas maneras como sea posible para seleccionar dep_time, dep_delay, arr_time, and arr_delay de flights.

``` r
select(flights, dep_time, dep_delay, arr_time, arr_delay)
```

    ## # A tibble: 336,776 x 4
    ##    dep_time dep_delay arr_time arr_delay
    ##       <int>     <dbl>    <int>     <dbl>
    ##  1      517         2      830        11
    ##  2      533         4      850        20
    ##  3      542         2      923        33
    ##  4      544        -1     1004       -18
    ##  5      554        -6      812       -25
    ##  6      554        -4      740        12
    ##  7      555        -5      913        19
    ##  8      557        -3      709       -14
    ##  9      557        -3      838        -8
    ## 10      558        -2      753         8
    ## # ... with 336,766 more rows

## 3.2 ¿Qué sucede si incluyes el nombre de una variable varias veces en una llamada a select()?

``` r
#Utilizando ‘help(select)’ se puede emplear para cambiar el nombre de las variables. Contrario a lo pensado con la definición que te da R, aunque se incluya más de una vez una variable al usar la función solo se considerará una vez.
```

## 3.3 ¿Qué hace la función any_of()? ¡¿Por qué podría ser útil en conjunto con este vector?

``` r
valores_de_prueba  <- c ( " any_of" , " month " , "day" ," arr_delay "," arr_time " )

#Esta función ´any_of()´ nos permite indicar las variables que queremos seleccionar con un nombre determinado del vector que las contiene.

#Además, esta función selecciona las variables que están en el vector ´valores_de_prueba´
```

# 4. Dplyr - mutate

## 4.1 Las variables horario_salida y salida_programada tienen un formato conveniente para leer, pero es difícil realizar cualquier cálculo con ellas porque no son realmente números continuos. Transfórmalas hacia un formato más conveniente como número de minutos desde la medianoche.

``` r
#Los datos de estas variables son de tal forma que las 8:46 AM toman el valor 846. 

846%/%100
```

    ## [1] 8

``` r
846%/%100 *60
```

    ## [1] 480

``` r
846 %% 100
```

    ## [1] 46

``` r
846 %/% 100 * 60 + 846 %% 100
```

    ## [1] 526

``` r
mutate(flights, salida_programada_minu = (sched_dep_time%/%100*60 + sched_dep_time%%100))
```

    ## # A tibble: 336,776 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   salida_programada_minu <dbl>

``` r
mutate(flights, horario_salida_minu = (dep_time%/%100*60 + dep_time%%100))
```

    ## # A tibble: 336,776 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   horario_salida_minu <dbl>

## 4.2 Compara tiempo_vuelo con horario_llegada - horario_salida. ¿Qué esperas ver? ¿Qué ves? ¿Qué necesitas hacer para arreglarlo?

``` r
mutate(flights, air_time = (arr_delay - dep_delay))
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 4.3 Compara horario_salida, salida_programada, y atraso_salida. ¿Cómo esperarías que esos tres números estén relacionados?

``` r
flights %>%
  mutate(dep_time, dep_time=dep_time%%100+(dep_time-dep_time%%100)/100*60) %>%
  mutate(sched_dep_time, sched_dep_time=sched_dep_time%%100+(sched_dep_time-sched_dep_time%%100)/100*60) %>%
  select(dep_time, sched_dep_time, dep_delay) %>%
  filter(sched_dep_time + dep_delay != dep_time)
```

    ## # A tibble: 1,207 x 3
    ##    dep_time sched_dep_time dep_delay
    ##       <dbl>          <dbl>     <dbl>
    ##  1      528           1115       853
    ##  2       42           1439        43
    ##  3       86           1370       156
    ##  4       32           1439        33
    ##  5       50           1305       185
    ##  6      155           1439       156
    ##  7       25           1439        26
    ##  8       66           1365       141
    ##  9       14           1439        15
    ## 10       37           1350       127
    ## # ... with 1,197 more rows

## 4.4 Encuentra los 10 vuelos más retrasados utilizando una función de ordenamiento. ¿Cómo quieres manejar los empates? Lee atentamente la documentación de min_rank().

``` r
arrange(flights, arr_delay)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     5     7     1715           1729       -14     1944           2110
    ##  2  2013     5    20      719            735       -16      951           1110
    ##  3  2013     5     2     1947           1949        -2     2209           2324
    ##  4  2013     5     6     1826           1830        -4     2045           2200
    ##  5  2013     5     4     1816           1820        -4     2017           2131
    ##  6  2013     5     2     1926           1929        -3     2157           2310
    ##  7  2013     5     6     1753           1755        -2     2004           2115
    ##  8  2013     5     7     2054           2055        -1     2317             28
    ##  9  2013     5    13      657            700        -3      908           1019
    ## 10  2013     1     4     1026           1030        -4     1305           1415
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 4.5 ¿Qué devuelve 1:3 + 1:10? ¿Por qué?

``` r
#[1]  2  4  6  5  7  9  8 10 12 11
#Warning message:
#In 1:3 + 1:10 :
#  longer object length is not a multiple of shorter object length
#Nos aparece esa expresión ya que los objetos no tienen la misma longitud, por ello R repite el primer vector hasta conseguir una igual longitud, o sea, 1231231231, luego de haber realizado esto se puede hacer la suma de ambas secuencias.
```

## 4.6 ¿Qué funciones trigonométricas proporciona R?

``` r
#Una forma de consultar cuáles son las funciones trigonométricas es utilizando ‘help(Trig)’, siendo las funciones que proporciona R:

# cos(x), sin(x), tan(x), acos(x), asin(x), atan(x), atan2(x,y), cospi(x), sinpi(x) y tanpi(x).
```

# 5. Group by & summarize

## 5.1 Haz una lluvia de ideas de al menos 5 formas diferentes de evaluar las características de un retraso típico de un grupo de vuelos. Considera los siguientes escenarios:

### Un vuelo llega 15 minutos antes 50% del tiempo, y 15 minutos tarde 50% del tiempo.

``` r
filter(flights, arr_delay > 15) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_tarde = quantile(arr_delay, 0.5, na.rm=T))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day vuelo_15min_tarde
    ##    <int> <int> <int>             <dbl>
    ##  1  2013     1     1              33  
    ##  2  2013     1     2              37  
    ##  3  2013     1     3              32  
    ##  4  2013     1     4              36  
    ##  5  2013     1     5              30  
    ##  6  2013     1     6              32  
    ##  7  2013     1     7              41  
    ##  8  2013     1     8              30.5
    ##  9  2013     1     9              28  
    ## 10  2013     1    10              35  
    ## # ... with 355 more rows

``` r
filter(flights, arr_delay < 15) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_antes = quantile(arr_delay, 0.5, na.rm=T))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day vuelo_15min_antes
    ##    <int> <int> <int>             <dbl>
    ##  1  2013     1     1                -4
    ##  2  2013     1     2                -4
    ##  3  2013     1     3                -7
    ##  4  2013     1     4               -12
    ##  5  2013     1     5                -9
    ##  6  2013     1     6                -6
    ##  7  2013     1     7               -12
    ##  8  2013     1     8               -10
    ##  9  2013     1     9                -8
    ## 10  2013     1    10               -13
    ## # ... with 355 more rows

### Un vuelo llega siempre 10 minutos tarde.

``` r
filter(flights, arr_delay == 10) %>%
  group_by(year, month, day, flight)
```

    ## # A tibble: 3,373 x 19
    ## # Groups:   year, month, day, flight [3,370]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      624            630        -6      840            830
    ##  2  2013     1     1      717            720        -3      850            840
    ##  3  2013     1     1      745            745         0     1135           1125
    ##  4  2013     1     1      805            805         0     1015           1005
    ##  5  2013     1     1      811            815        -4     1026           1016
    ##  6  2013     1     1      921            900        21     1237           1227
    ##  7  2013     1     1     1158           1205        -7     1530           1520
    ##  8  2013     1     1     1211           1215        -4     1423           1413
    ##  9  2013     1     1     1455           1459        -4     1655           1645
    ## 10  2013     1     1     1554           1600        -6     1830           1820
    ## # ... with 3,363 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

### Un vuelo llega 30 minutos antes 50% del tiempo, y 30 minutos tarde 50% del tiempo.

``` r
filter(flights, arr_delay > 30) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_30min_tarde = quantile(arr_delay, 0.5, na.rm=T))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day vuelo_30min_tarde
    ##    <int> <int> <int>             <dbl>
    ##  1  2013     1     1              54  
    ##  2  2013     1     2              58  
    ##  3  2013     1     3              51  
    ##  4  2013     1     4              49  
    ##  5  2013     1     5              65  
    ##  6  2013     1     6              52  
    ##  7  2013     1     7              59  
    ##  8  2013     1     8              50  
    ##  9  2013     1     9              48.5
    ## 10  2013     1    10              48  
    ## # ... with 355 more rows

``` r
filter(flights, arr_delay < 30) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_antes = quantile(arr_delay, 0.5, na.rm=T))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

    ## # A tibble: 365 x 4
    ## # Groups:   year, month [12]
    ##     year month   day vuelo_15min_antes
    ##    <int> <int> <int>             <dbl>
    ##  1  2013     1     1                -1
    ##  2  2013     1     2                 0
    ##  3  2013     1     3                -2
    ##  4  2013     1     4               -10
    ##  5  2013     1     5                -8
    ##  6  2013     1     6                -4
    ##  7  2013     1     7               -11
    ##  8  2013     1     8                -9
    ##  9  2013     1     9                -7
    ## 10  2013     1    10               -12
    ## # ... with 355 more rows

### Un vuelo llega a tiempo en el 99% de los casos. 1% de las veces llega 2 horas tarde. ¿Qué es más importante: retraso de la llegada o demora de salida?

``` r
filter(flights, arr_delay > 120) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_2horas_tarde = quantile(arr_delay, 0.01, na.rm=T))
```

    ## `summarise()` has grouped output by 'year', 'month'. You can override using the `.groups` argument.

    ## # A tibble: 364 x 4
    ## # Groups:   year, month [12]
    ##     year month   day vuelo_2horas_tarde
    ##    <int> <int> <int>              <dbl>
    ##  1  2013     1     1               123 
    ##  2  2013     1     2               124.
    ##  3  2013     1     3               127.
    ##  4  2013     1     4               125.
    ##  5  2013     1     5               132.
    ##  6  2013     1     6               122.
    ##  7  2013     1     7               134.
    ##  8  2013     1     8               126.
    ##  9  2013     1     9               124.
    ## 10  2013     1    10               139.
    ## # ... with 354 more rows

``` r
#Demora de salida porque se puede cancelar tu vuelo o puedes perder varias cosas importantes porque tenías ya un vuelo programado ya preestablecido.
```

## 5.2 Sugiere un nuevo enfoque que te dé el mismo output que no_cancelados %>% count(destino) y no_cancelado %>% count(codigo_cola, wt = distancia) (sin usar count()).

``` r
no_cancelados <-filter(flights, !is.na(dep_delay), !is.na(arr_delay))
no_cancelados %>% 
  count(dest)
```

    ## # A tibble: 104 x 2
    ##    dest      n
    ##    <chr> <int>
    ##  1 ABQ     254
    ##  2 ACK     264
    ##  3 ALB     418
    ##  4 ANC       8
    ##  5 ATL   16837
    ##  6 AUS    2411
    ##  7 AVL     261
    ##  8 BDL     412
    ##  9 BGR     358
    ## 10 BHM     269
    ## # ... with 94 more rows

``` r
no_cancelados %>% 
  group_by(dest) %>%
  summarise(length(dest))
```

    ## # A tibble: 104 x 2
    ##    dest  `length(dest)`
    ##    <chr>          <int>
    ##  1 ABQ              254
    ##  2 ACK              264
    ##  3 ALB              418
    ##  4 ANC                8
    ##  5 ATL            16837
    ##  6 AUS             2411
    ##  7 AVL              261
    ##  8 BDL              412
    ##  9 BGR              358
    ## 10 BHM              269
    ## # ... with 94 more rows

## 5.3 Nuestra definición de vuelos cancelados (is.na(atraso_salida) \| is.na (atraso_llegada)) es un poco subóptima. ¿Por qué? ¿Cuál es la columna más importante?

``` r
 funados <- filter(flights, is.na(dep_delay), is.na(arr_delay))
#Esta es una manera poco convencional de conocer los vuelos cancelados porque filtra los valores no disponibles “NA” del atraso de la salida y de la llegada.

flights %>%
  group_by(is.na(dep_delay)) %>%
  summarise(length(dep_delay))
```

    ## # A tibble: 2 x 2
    ##   `is.na(dep_delay)` `length(dep_delay)`
    ##   <lgl>                            <int>
    ## 1 FALSE                           328521
    ## 2 TRUE                              8255

``` r
#Sin embargo, la columna más importante viene a ser el tiempo de vuelo “dep_delay”.
```

## 5.4 Mira la cantidad de vuelos cancelados por día. ¿Hay un patrón? ¿La proporción de vuelos cancelados está relacionada con el retraso promedio?

``` r
#No, no hay un patrón resaltante en la cantidad de vuelos diarios. 
flights %>%
  group_by(is.na(dep_delay)) %>%
  summarise(mean(dep_delay))
```

    ## # A tibble: 2 x 2
    ##   `is.na(dep_delay)` `mean(dep_delay)`
    ##   <lgl>                          <dbl>
    ## 1 FALSE                           12.6
    ## 2 TRUE                            NA

## 5.5 ¿Qué compañía tiene los peores retrasos? Desafío: ¿puedes desenredar el efecto de malos aeropuertos vs. el efecto de malas aerolíneas? ¿Por qué o por qué no? (Sugerencia: piensa en vuelos %>% group_by(aerolinea, destino) %>% summarise(n()))

``` r
arrange(flights, arr_delay) %>%
  group_by(arr_delay, carrier, dest) %>%
  summarise()
```

    ## `summarise()` has grouped output by 'arr_delay', 'carrier'. You can override using the `.groups` argument.

    ## # A tibble: 39,730 x 3
    ## # Groups:   arr_delay, carrier [4,683]
    ##    arr_delay carrier dest 
    ##        <dbl> <chr>   <chr>
    ##  1       -86 VX      SFO  
    ##  2       -79 VX      SFO  
    ##  3       -75 AA      SEA  
    ##  4       -75 UA      LAX  
    ##  5       -74 AS      SEA  
    ##  6       -73 UA      SFO  
    ##  7       -71 B6      LAX  
    ##  8       -71 DL      PDX  
    ##  9       -71 UA      SFO  
    ## 10       -70 B6      LGB  
    ## # ... with 39,720 more rows

## 5.6 ¿Qué hace el argumento sort a count(). ¿Cuándo podrías usarlo?

``` r
#El argumento sort en count nos permite mostrar la cantidad de datos de forma descendente con el valor que posee cada variable. 
#Además,podríamos usarlo si en caso nos pidieran qué día de un mes salieron la mayor cantidad de vuelos.
flights%>%
count(day, sort= TRUE)
```

    ## # A tibble: 31 x 2
    ##      day     n
    ##    <int> <int>
    ##  1    18 11399
    ##  2    11 11359
    ##  3    22 11345
    ##  4    15 11317
    ##  5     8 11271
    ##  6    10 11227
    ##  7    17 11222
    ##  8     3 11211
    ##  9    21 11141
    ## 10    20 11111
    ## # ... with 21 more rows

# 6. Dplyr - transformaciones agrupadas

## 6.1 Remítete a las listas de funciones útiles de mutación y filtrado. Describe cómo cambia cada operación cuando las combinas con la agrupación.

``` r
#data %>% group_by() %>% filter()
#Para el group_by nos ayuda en la forma de agrupar y el filter es para poner a una condición a alguna de nuestras variables.

#data %>% filter() %>% mutate() %>% select()
#filter es para poner una condición a alguna de nuestras variables, mutate es para agregar una columna en función de alguna o algunas columnas existentes y select es para reducir rápidamente a las variables o columnas que solo nos interesan.
```

## 6.2 ¿Qué avión (codigo_cola) tiene el peor registro de tiempo?

``` r
flights %>%
  group_by(tailnum, arr_delay) %>%
  filter(rank(desc(arr_delay)) < 10)
```

    ## # A tibble: 332,907 x 19
    ## # Groups:   tailnum, arr_delay [176,450]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 332,897 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 6.3 ¿A qué hora del día deberías volar si quieres evitar lo más posible los retrasos?

``` r
vuelos_hm=select(flights,hour, minute, dep_delay, arr_delay)

no_cancelados=vuelos_hm %>% 
  filter(!is.na(dep_delay),!is.na(arr_delay))

sin_retraso=no_cancelados%>%
  filter((arr_delay<0) & (dep_delay<0))%>%
  select(hour,minute,dep_delay,arr_delay)
arrange(sin_retraso,hour,minute)
```

    ## # A tibble: 144,346 x 4
    ##     hour minute dep_delay arr_delay
    ##    <dbl>  <dbl>     <dbl>     <dbl>
    ##  1     5      0        -4       -19
    ##  2     5      0        -2       -10
    ##  3     5      0        -6       -11
    ##  4     5      0        -6       -23
    ##  5     5      0        -3        -1
    ##  6     5      0       -10       -14
    ##  7     5      0        -7        -5
    ##  8     5      0        -7        -8
    ##  9     5      0        -7        -3
    ## 10     5      0        -7       -12
    ## # ... with 144,336 more rows

## 6.4 Para cada destino, calcula los minutos totales de demora. Para cada vuelo, calcula la proporción de la demora total para su destino.

``` r
vuelos<-flights
demora<-group_by(vuelos, dest)
summarise(demora, minutos_de_demora= sum(arr_delay, na.rm =TRUE))
```

    ## # A tibble: 105 x 2
    ##    dest  minutos_de_demora
    ##    <chr>             <dbl>
    ##  1 ABQ                1113
    ##  2 ACK                1281
    ##  3 ALB                6018
    ##  4 ANC                 -20
    ##  5 ATL              190260
    ##  6 AUS               14514
    ##  7 AVL                2089
    ##  8 BDL                2904
    ##  9 BGR                2874
    ## 10 BHM                4540
    ## # ... with 95 more rows

``` r
proporcion_prob<-group_by(vuelos, dest)
summarise(proporcion_prob, minutos_de_demora=mean(arr_delay, na.rm=TRUE))
```

    ## # A tibble: 105 x 2
    ##    dest  minutos_de_demora
    ##    <chr>             <dbl>
    ##  1 ABQ                4.38
    ##  2 ACK                4.85
    ##  3 ALB               14.4 
    ##  4 ANC               -2.5 
    ##  5 ATL               11.3 
    ##  6 AUS                6.02
    ##  7 AVL                8.00
    ##  8 BDL                7.05
    ##  9 BGR                8.03
    ## 10 BHM               16.9 
    ## # ... with 95 more rows

## 6.6 Mira cada destino. ¿Puedes encontrar vuelos sospechosamente rápidos? (es decir, vuelos que representan un posible error de entrada de datos). Calcula el tiempo en el aire de un vuelo relativo al vuelo más corto a ese destino. ¿Cuáles vuelos se retrasaron más en el aire?

``` r
flights %>%
  group_by(dest, air_time) %>%
  filter(air_time <= 60)
```

    ## # A tibble: 53,221 x 19
    ## # Groups:   dest, air_time [506]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      557            600        -3      709            723
    ##  2  2013     1     1      559            559         0      702            706
    ##  3  2013     1     1      629            630        -1      721            740
    ##  4  2013     1     1      632            608        24      740            728
    ##  5  2013     1     1      639            640        -1      739            749
    ##  6  2013     1     1      733            736        -3      854            850
    ##  7  2013     1     1      801            805        -4      900            919
    ##  8  2013     1     1      803            810        -7      903            925
    ##  9  2013     1     1      820            830       -10      940            954
    ## 10  2013     1     1      821            825        -4      932            945
    ## # ... with 53,211 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 6.7 Encuentra todos los destinos que son volados por al menos dos operadores. Usa esta información para clasificar a las aerolíneas.

``` r
flights %>%
  group_by(dest, carrier) %>%
  filter(carrier >= 2)
```

    ## # A tibble: 336,776 x 19
    ## # Groups:   dest, carrier [314]
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

## 6.8 Para cada avión, cuenta el número de vuelos antes del primer retraso de más de 1 hora.

``` r
flights %>%
  select(dep_delay, tailnum) %>%
  count(tailnum, dep_delay) %>%
  group_by(tailnum) %>%
  filter(dep_delay > 60) %>%
  summarise(sum(n))
```

    ## # A tibble: 3,360 x 2
    ##    tailnum `sum(n)`
    ##    <chr>      <int>
    ##  1 D942DN         1
    ##  2 N0EGMQ        23
    ##  3 N10156        17
    ##  4 N102UW         2
    ##  5 N104UW         4
    ##  6 N10575        44
    ##  7 N105UW         1
    ##  8 N107US         1
    ##  9 N108UW         2
    ## 10 N110UW         1
    ## # ... with 3,350 more rows
