####base r###


#installing libs
#install.packages("readr")
#install.packages("tidytext")
#install.packages("tidyverse")
#install.packages("quanteda")  


text_file <- "dat/quijote.txt"
####readLines base r
readLines(text_file, n=10)
#?readLines
#help -> ?function
readLines(text_file, n=10, encoding = "UTF-8", skipNul = TRUE)


library(readr)

quijote_lines <- readr::read_lines(text_file)
str(quijote_lines)

?substr

######obtener substring de un vector de caracteres

substr(quijote_lines, 3, 15)

readr::read_lines(text_file, n_max=5)



library(tidytext)
library(tidyverse)

quijote_frame <- data_frame(txt = quijote_lines)
quijote_tibble <- tibble(txt = quijote_lines)

quijote_words <- unnest_tokens(quijote_frame, output = word, input = txt, token = "words")
quijote_count <- count(quijote_words, word, sort = TRUE)
view(quijote_count)

library(quanteda)

stop_words <- data_frame(word=quanteda::stopwords(language = "es"))

quijote_words_clean <- anti_join(quijote_words, stop_words)
quijote_count_clean <- count(quijote_words_clean, word, sort = TRUE)
view(quijote_count_clean)
quijote_count_clean <- count(quijote_words_clean, word, sort = FALSE)
view(quijote_count_clean)

horas <- read_csv("dat/hour.csv")
view(horas)
read_delim("dat/hour.csv", delim = ";")

library(readxl)
bancos_activos <- readxl::read_excel("dat/bancos.xlsx")
bancos_activos

bancos_agencias <- read_excel("dat/bancos.xlsx", sheet=2)
bancos_agencias

??lappy
