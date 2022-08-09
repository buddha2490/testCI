# SCSRE-223 - Using a pinned old base image as newer versions aren't able to establish a
#             connection with the backend. See ticket for more details.
# Using R version 4.0.4
FROM rocker/shiny@sha256:4c035e99f19200a18cc24036e0b5f4fbd2bed5f9e68b58a713ba204dde7c342f

RUN R -e "install.packages(c('utf8'))"
RUN R -e "install.packages(c('ggplot2'))"
RUN R -e "install.packages(c('tidyverse'))"
RUN R -e "install.packages(c('googledrive'))"
RUN R -e "install.packages(c('googlesheets4'))"
RUN R -e "install.packages(c('shiny'))"
RUN R -e "install.packages(c('shinyjs'))"
RUN R -e "install.packages(c('shinyBS'))"
RUN R -e "install.packages(c('shinyWidgets'))"
RUN R -e "install.packages(c('shinyalert'))"
RUN R -e "install.packages(c('DT'))"
RUN R -e "install.packages(c('shinydashboard'))"
RUN R -e "install.packages(c('shinythemes'))"
RUN R -e "install.packages(c('dplyr'))"
RUN R -e "install.packages(c('stringr'))"
RUN R -e "install.packages(c('bslib'))"
RUN R -e "install.packages(c('scales'))"
RUN R -e "install.packages(c('googlesheets4'))"
RUN R -e "install.packages(c('googledrive'))"
RUN R -e "install.packages(c('rhandsontable'))"
RUN R -e "install.packages(c('shinyalert'))"
RUN R -e "install.packages(c('plotly'))"
RUN R -e "install.packages(c('shinydashboard'))"
RUN R -e "install.packages(c('data.table'))"
RUN R -e "install.packages(c('DBI'))"
RUN R -e "install.packages(c('RSQLite'))"
RUN R -e "install.packages(c('tableHTML'))"
RUN R -e "install.packages(c('parallel'))"
RUN R -e "install.packages(c('jsonlite'))"
RUN R -e "install.packages(c('rjson'))"
RUN R -e "install.packages(c('tidyr'))"
RUN R -e "install.packages(c('rmarkdown'))"
RUN R -e "install.packages(c('knitr'))"
RUN R -e "install.packages(c('openxlsx'))"
RUN R -e "install.packages(c('reticulate'))"


RUN apt-get update && apt-get install libxml2-dev -y

ENV SHINY_LOG_LEVEL=TRACE
ENV SHINY_LOG_STDERR=1

RUN rm -rf /srv/shiny-server/*
  COPY apps /srv/shiny-server/apps
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf