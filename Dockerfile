# Base image https://hub.docker.com/rundeck
FROM rundeck/rundeck:3.1.2
USER root
RUN echo "Installing R"
RUN apt-get update && apt-get --assume-yes install r-base libcurl4-openssl-dev libxml2-dev libssl-dev 
RUN Rscript -e "install.packages(c('curl','openssl','xml2'),repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages(c('httr','aws.s3'),repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages(c('influxdbr', 'data.table','dplyr', 'zoo', 'httr', 'aws.s3'),repos = 'http://cran.us.r-project.org')"

