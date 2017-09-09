FROM rocker/verse 

RUN apt-get update \
  && apt-get install -y build-essential \
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/rakudo/rakudo.git \
  && cd rakudo && perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar \
  && make && make install && cd .. && rm -rf rakudo
  


RUN git clone https://github.com/ugexe/zef.git && cd zef && perl6 -I. bin/zef install . && cd .. && rm -rf zef
ENV PATH /usr/share/perl6/site/bin:$PATH
RUN zef install Linenoise
