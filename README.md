Lynis report converter
===
Tool repository - https://github.com/d4t4king/lynis-report-converter

Example usage:
```sh
$ docker run --name lynis_converter kuznetsovv/lynis-report-converter
$ docker cp /var/log/lynis-report.dat lynis_converter:/var/log/lynis-report.dat
$ docker exec lynis_converter ./opt/lynis-report-converter-master/lynis-report-converter.pl -j >> result.json
$ docker stop lynis_converter
```