install.packages("nycflights13", dependencies = T)
library(nycflights13)
library(tidyverse)

#1.2
flights
?flights
View(flights)
filter(flights, between(month, 7, 9))

#1.4
x <- c(NA)
is.na(x)
x^0
x | TRUE
x & FALSE
x*0
Inf*0

#2.3
arrange(flights, desc(distance/air_time))

#3.1
select(flights, dep_time, dep_delay, arr_time, arr_delay)

#4.1
848%/%100
848%/%100 *60
848 %% 100
848 %/% 100 * 60 + 848 %% 100

mutate(flights, salida_programada_min = (sched_dep_time%/%100*60 + sched_dep_time%%100))
mutate(flights, horario_salida_min = (dep_time%/%100*60 + dep_time%%100))


arrange(flights, arr_delay)


filter(flights, arr_delay > 15) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_tarde = quantile(arr_delay, 0.5, na.rm=T))

filter(flights, arr_delay < 15) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_antes = quantile(arr_delay, 0.5, na.rm=T))


filter(flights, arr_delay == 10) %>%
  group_by(year, month, day)


filter(flights, arr_delay > 30) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_30min_tarde = quantile(arr_delay, 0.5, na.rm=T))

filter(flights, arr_delay < 30) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_15min_antes = quantile(arr_delay, 0.5, na.rm=T))


filter(flights, arr_delay > 120) %>%
  group_by(year, month, day) %>%
  summarise(vuelo_2horas_tarde = quantile(arr_delay, 0.01, na.rm=T))


flights %>%
  group_by(carrier, dest, arr_delay) %>%
  summarise(Peores_retrasos = n(arr_delay))
  
arrange(flights, arr_delay) %>%
  group_by(arr_delay, carrier, dest) %>%
  summarise()


flights %>%
  select(dep_delay)


flights %>%
  mutate(retraso_del_vuelo_anter = lag(dep_delay))


flights %>%
  group_by(year, month, day) %>% 
  filter(rank(desc(arr_delay)) < 10)

flights %>%
  group_by(dest) %>%
  filter(n() > 365) %>%
  view()

?min_rank





flights %>%
  select(dep_delay, tailnum) %>%
  count(tailnum, dep_delay) %>%
  group_by(tailnum) %>%
  filter(dep_delay > 60) %>%
  summarise(sum(n))








