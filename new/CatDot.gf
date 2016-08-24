concrete CatDot of Cat = CommonX ** open ResDot in {
	oper
		Verb : Type = {s: Str};
		TNoun : Type = {s : NForm => Str ; a : Animacy } ;
		
	lincat
		N, CN = TNoun ;
		S, QS, RS, SSlash = {s : Str} ;
	    Cl, QCl = {s : Tense => Anteriority => Polarity => Str} ;
	    ClSlash = {
	      s : Tense => Anteriority => Polarity => Str ;
	      c2 : Str
	      } ;
	    Imp = {s : Polarity => ImpForm => Str} ;
		
		
		-- Question
	
	    IP = {s : Str ; n : Number} ;
	    IComp = {s : Str} ;    
	    IDet = {s : Str ; n : Number} ;
	    IQuant = {s : Number => Str} ;
	
	-- Relative
	
	    RCl = {
	      s : Tense => Anteriority => Polarity => Str ; 
	      } ;
	    RP = {s : Str} ;
	
	-- Verb
	
	    VP, VPSlash = {s: Str} ;
	    Comp = {s : Str} ; 
	
	-- Adjective
	
	    AP = {s : Str} ; 
	
	-- Noun
	
	    NP, Pron, Det, Predet, Ord, Num, Card, Quant, DAP = {s : Str } ;
	
	-- Numeral
	
		Numeral, Digits = {s : Str} ;
	
	-- Structural
	
		Conj, Subj, Prep = {s : Str};
	
	-- Open lexical classes, e.g. Lexicon
	
	
	    V, VS, VQ, VA = Verb ; -- = {s : VForm => Str} ;
	    V2, V2A, V2Q, V2S = Verb ** {c2 : Str} ;
	    V3 = Verb ** {c2, c3 : Str} ;
	    VV = {s : Str ; p : Str} ;
	    V2V = Verb ** {c2,c3 : Str} ;
	
		A, A2 = {s : Str} ;
	
	    N2 = TNoun ** {c2 : Str} ;
	    N3 = TNoun ** {c2,c3 : Str} ;
	    PN = TNoun ;
	
	{-
	  lindef
	    SSlash = \s -> {s = s; c2 = ""} ;
	    ClSlash = \s -> {s = \\t,a,p,o => s; c2 = ""} ;
	
	    VP = \s -> predV {s = \\_ => s; p = ""; isRefl = False} ;
	    VPSlash = \s -> predV {s = \\_ => s; p = ""; isRefl = False} ** {c2 = ""; gapInMiddle = False} ;
	
	    V, VS, VQ, VA = \s -> {s = \\_ => s; p = ""; isRefl = False} ;
	    V2, V2A, V2Q, V2S = \s -> {s = \\_ => s; p = ""; isRefl = False; c2=""} ;
	    V3 = \s -> {s = \\_ => s; p = ""; isRefl = False; c2,c3=""} ;
	    VV = \s -> {s = \\_ => s; p = ""; isRefl = False; typ = VVInf} ;
	    V2V = \s -> {s = \\_ => s; p = ""; isRefl = False; c2,c3="" ; typ = VVInf} ;
	
	    A = \s -> {s = \\_ => s} ;
	    A2 = \s -> {s = \\_ => s; c2 = ""} ;
	
	    N = \s -> {s = \\_,_ => s; g = Neutr} ;
	    N2 = \s -> {s = \\_,_ => s; c2 = ""; g = Neutr} ;
	    N3 = \s -> {s = \\_,_ => s; c2,c3 = ""; g = Neutr} ;
	
	  linref
	    SSlash = \ss -> ss.s ++ ss.c2 ;
	    ClSlash = \cls -> cls.s ! Pres ! Simul ! CPos ! oDir ++ cls.c2 ;
	
	    VP = \vp -> infVP VVAux vp Simul CPos (agrP3 Sg) ;
	    VPSlash = \vps -> infVP VVAux vps Simul CPos (agrP3 Sg) ++ vps.c2;
	
	    Conj = \conj -> conj.s1 ++ conj.s2 ;
	
	    V, VS, VQ, VA = \v -> infVP VVAux (predV v) Simul CPos (agrP3 Sg);
	    V2, V2A, V2Q, V2S = \v -> infVP VVAux (predV v) Simul CPos (agrP3 Sg) ++ v.c2;
	    V3 = \v -> infVP VVAux (predV v) Simul CPos (agrP3 Sg) ++ v.c2 ++ v.c3;
	    VV = \v -> infVP VVAux (predVV v) Simul CPos (agrP3 Sg) ;
	    V2V = \v -> infVP VVAux (predVc v) Simul CPos (agrP3 Sg) ;
	
	    A = \a -> a.s ! AAdj Posit Nom ;
	    A2 = \a -> a.s ! AAdj Posit Nom ++ a.c2 ;
	
	    N = \n -> n.s ! Sg ! Nom ;
	    N2 = \n -> n.s ! Sg ! Nom ++ n.c2 ;
	    N3 = \n -> n.s ! Sg ! Nom ++ n.c2 ++ n.c3 ;
	-}
}