FROM debian:sid

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get -y install wget unzip apt-utils htmldoc libxml-writer-perl libarchive-zip-perl libjson-perl
RUN apt-get -y install --reinstall make
RUN wget http://search.cpan.org/CPAN/authors/id/M/MF/MFRANKL/HTML-HTMLDoc-0.10.tar.gz -P /tmp/html-dist
RUN tar xvf /tmp/html-dist/HTML-HTMLDoc-0.10.tar.gz -C /tmp/html-dist
RUN cd /tmp/html-dist/HTML-HTMLDoc-0.10 && perl Makefile.PL && make && make install
RUN wget http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-0.95.tar.gz -P /tmp/excel-writer-dist
RUN tar xvf /tmp/excel-writer-dist/Excel-Writer-XLSX-0.95.tar.gz -C /tmp/excel-writer-dist
RUN cd /tmp/excel-writer-dist/Excel-Writer-XLSX-0.95 && perl Makefile.PL && make && make install
RUN wget https://github.com/d4t4king/lynis-report-converter/archive/master.zip -P /tmp/lynis-converter-dist
RUN unzip /tmp/lynis-converter-dist/master.zip -d /opt
RUN cd /opt/lynis-report-converter-master/ && perl Makefile.PL && make && make install
RUN apt-get autoremove -y && rm -rf /tmp/*

CMD printf 'Lynis report converter is started' && tail -f /var/log/wtmp
