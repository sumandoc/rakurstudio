FROM rocker/rstudio
ENV RAKUDO=2019.07
ENV PATH=/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/site/bin:/home/rstudio/.perl6/bin:$PATH


LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"


RUN apt-get update && apt-get install -y --no-install-recommends curl libreadline7 \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/nxadm/rakudo-pkg/releases/download/v${RAKUDO}/rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && dpkg -i rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && rm rakudo-pkg-Debian9_${RAKUDO}-01_amd64.deb \
    && echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron \
    && sed 's+/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games+/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/site/bin:/home/rstudio/.perl6/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin+' /etc/profile \
    && zef install Readline
