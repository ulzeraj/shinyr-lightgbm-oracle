FROM oraclelinux:7-slim
EXPOSE 3838
RUN yum install -y oracle-release-el7 oracle-epel-release-el7 && yum update -y
RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN yum localinstall http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-43.el7.noarch.rpm
RUN yum localinstall http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-43.el7.noarch.rpm
RUN yum localinstall http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-5.el7.x86_64.rpm
RUN yum install -y oracle-instantclient18.3-basic gzip git-core gcc gcc-c++ make \
    oracle-instantclient18.3-devel oracle-instantclient18.3-sqlplus tar cmake \
    oracle-instantclient18.3-odbc oracle-instantclient18.3-jdbc openssl openssl-devel \
    libcurl libcurl-devel libaio libaio-devel libxml2 libxml2-devel R && ldconfig && \
    rm -rf /var/cache/yum

RUN R -e "install.packages('ROracle')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('VIM')"
RUN R -e "install.packages('pacman')"
RUN R -e "install.packages('readxl')"
RUN R -e "install.packages('writexl')"
RUN R -e "install.packages('gdata')"
RUN R -e "install.packages('ggmap')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('DT')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('xts')"
RUN R -e "install.packages('forecast')"
RUN R -e "install.packages('tictoc')"
RUN R -e "install.packages('timeSeries')"
RUN R -e "install.packages('stringr')"
RUN R -e "install.packages('scales')"
RUN R -e "install.packages('data.table')"
RUN R -e "install.packages('shinydashboard')"
RUN R -e "install.packages('leaflet')"
RUN R -e "install.packages('plotly')"
RUN R -e "install.packages('tidyr')"
RUN R -e "install.packages('lattice')"
RUN R -e "install.packages('magrittr')"
RUN R -e "install.packages('Matrix')"
RUN R -e "install.packages('R6')"
RUN R -e "install.packages('jsonlite')"
RUN R -e "install.packages('roxygen2')"
RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('testthat')"
RUN R -e "install.packages('shiny', repos='https://cran.rstudio.com/')"
RUN git clone --recursive https://github.com/Microsoft/LightGBM
RUN cd LightGBM && Rscript build_r.R
RUN yum localinstall --nogpgcheck https://download3.rstudio.org/centos6.3/x86_64/shiny-server-1.5.9.923-x86_64.rpm
CMD ["/usr/bin/shiny-server"]