#' Map OSCORAD to EASI
#'
#' @description
#' Map OSCORAD to EASI using models of varying complexity
#' 
#' @details
#' Depending on the choice of ‘type’, 
#' a linear model ('"lm"', lm(y~x)), 
#' a non-linear model ('"nlm"', nls(y~b0+b1⋅x+b2⋅x2)) or 
#' locally estimated scatterplot smoothing ('"loess"', loess(y~x)) 
#' is used to predict EASI.
#' 
#' @export
#' 
#' @param x a vector of OSCORAD values
#' @param type model type used for mapping, defaults to ‘"nlm"’
#' 
#' @return 
#' a vector of predicted EASI values
#'
#' @author
#' Matthias Hübenthal <<mhuebenthal@dermatology.uni-kiel.de>>, 
#' Chengliang Dai <<chengliang.dai@ucb.com>> 
#' et al.
#'
#' @references
#' Hübenthal M, Dai C et al..
#' “Mapping OSCORAD and SCORAD to EASI to facilitate large-scale meta-analyses of omics data”
#' (in preparation)
#' 
#' @examples
#' x<-sample(0:83, size=10, replace=T)
#' y<-oscorad2easi(x=x, type="nls")
oscorad2easi<-function(x, type="nls"){
	if(!type%in%c("lm", "nls", "loess")){
		stop("invalid 'type' argument")
	}
	predict(mapSeverityScores:::oscorad2easi_m[[paste0("easi.", type)]], newdata=data.frame(oscorad=x))
}

#' Map SCORAD to EASI
#'
#' @description
#' Map SCORAD to EASI using models of varying complexity
#' 
#' @details
#' Depending on the choice of ‘type’, 
#' a linear model ('"lm"', lm(y~x)), 
#' a non-linear model ('"nlm"', nls(y~b0+b1⋅x+b2⋅x2)) or 
#' locally estimated scatterplot smoothing ('"loess"', loess(y~x)) 
#' is used to predict EASI.
#' 
#' @export
#' 
#' @param x a vector of SCORAD values
#' @param type model type used for mapping, defaults to ‘"nlm"’
#' 
#' @return 
#' a vector of predicted EASI values
#'
#' @author
#' Matthias Hübenthal <<mhuebenthal@dermatology.uni-kiel.de>>, 
#' Chengliang Dai <<chengliang.dai@ucb.com>>, 
#' et al.
#'
#' @references
#' Hübenthal M, Dai C et al..
#' “Mapping OSCORAD and SCORAD to EASI to facilitate large-scale meta-analyses of omics data”
#' (in preparation)
#' 
#' @examples
#' x<-sample(0:103, size=10, replace=T)
#' y<-scorad2easi(x=x, type="nls")
scorad2easi<-function(x, type="nls"){
	if(!type%in%c("lm", "nls", "loess")){
		stop("invalid 'type' argument")
	}
	predict(mapSeverityScores:::scorad2easi_m[[paste0("easi.", type)]], newdata=data.frame(scorad=x))
}
