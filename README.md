# mapSeverityScores

Install, load and use the most recent version of mapSeverityScores

``` r
library(devtools)
install_github("huebenthal-cau/mapSeverityScores")
library(mapSeverityScores)
library(tidyverse)

x<-0:103
y<-scorad2easi(x=x, type="nls")

ggplot(data.frame(scorad=x, easi=y), aes(scorad, easi)) + 
geom_point()
```
