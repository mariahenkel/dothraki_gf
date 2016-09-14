--# -path=.:../simpleabstract:../common

resource MorphoSimpleDot = open Prelude, (Predef=Predef), ResDot in {
	oper
		mkPron : (_,_,_,_,_:Str) -> Person -> Number -> {s : Case => Str ; p : Person ; n : Number} = \anha,anna,anni,anhaan,anhoon,p,n -> {
			s = table {
				Nom => anha ;
				Acc => anna ;
				Gen => anni ;
				All => anhaan ;
				Abl => anhoon 
			} ;
			p = p ;
			n = n
		} ;

} ;

