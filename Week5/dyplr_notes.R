library(dplyr)
library(highcharter)
library(readr)

df <- read.csv2('dplyr-spotify.csv')


### ver dataset
View(df)

### base r
str(df)

###dplyr
glimpse(df)

### renombrar columnas

names(df)[4] <- 'top_gen'
names(df)

### dplyr
dplyr::rename(df, top_genre= top_gen)

### anidando 
head(dplyr::select(df, artist, year))

### usando pipe
df %>%
  dplyr::select(artist, year) %>% 
  head()

### renombrar con pipe

df %>% 
  dplyr::rename(top_genre= top_gen)

###
df %>% 
  dplyr::select(1,2) %>% 
  head() %>% 
  View()

### todas las columnas menos 1
head(df[-1])

### dyplr
df %>% 
  select(-X1) %>% 
  head()

### columnas de rexto a factores

df<- mutate_if(df, is,character, as.factor)
glimpse(df)

###
df %>% 
  dplyr::select(1,2) %>% 
  head() %>% 
  View()

### todas las columnas menos 1
head(df[-1])

### dyplr
df %>% 
  select(-X1) %>% 
  head()


### 
df %>% 
  select(artist, title, year) %>% 
  filter(year == 2010) %>% 
  head() %>% 
  View()

### Cuantos artistas hay por año
df %>% 
  select(year, artist) %>% 
  group_by(year) %>% 
  summarise(artistas = n())
#n -> group size (count)

df %>% 
  select(year, artist) %>% 
  group_by(year) %>% 
  summarise(artistas_unicos = n_distinct(artist))

### artistas unicos
df %>% 
  summarise(artistas_unicos = n_distinct(artist))
### suma
df %>% 
  summarise(artistas_unicos = n_distinct(artist)) %>% 
  sum()


### canciones unicas
df %>% 
  summarise(canciones_unicas = n_distinct(title))

### cuantas aparecen mas de una vez
a <- df %>% 
  summarise(canciones_unicas = n_distinct(title)) 
b <- df %>% 
  summarise(artistas = n())
b-a


a <- df %>% 
  group_by(artist, title) %>% 
  summarise(count = n()) %>% 
  filter(count > 1)

a[,1] # artistas
a[,2] # canciones



a <- df %>% 
  group_by(artist, title) %>% 
  summarise(count = ifelse(n()>1,n(), NA)) %>% 
  na.omit()
a[,1] # artistas
a[,2] # canciones

#En distintos años
a <- df %>% 
  group_by(artist, title) %>% 
  summarise(count = n_distinct(year)) %>% 
  filter(count >1)

# artistas con mas de una cancion en mas de un año
a <- df %>% 
  group_by(artist, title) %>% 
  summarise(count = n_distinct(year)) %>% 
  filter(count >1) %>% 
  group_by(artist) %>% 
  summarise(count_artist = n()) %>% 
  filter(count_artist>1)
  
### Highcharter
df<-mutate_if(df,is.character, as.factor)
df$title <- iconv(df$title, to = "UTF-8")
df$artist <- iconv(df$artist, to = "UTF-8")

df %>% 
  select(year, artist) %>% 
  group_by(year) %>% 
  summarise(n=n_distinct(artist)) %>% 
  hchart("column", hcaes(x=year,y = n)) %>% 
  hc_title("Artistas distintos por año") %>% 
  hc_subtitle(text="<i>2019 tuvo la menor variedad, mientras 2015  ha sido el año con mas diversidad de artistas<i>")
  

