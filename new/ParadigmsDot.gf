resource ParadigmsDot = open ResDot, CatDot in {
	oper
	-- Declarations
		Animacy : Type ;
		
		animate : Animacy ;
		inanimate : Animacy ;
		
		mkN : Str -> Animacy -> N ;
		
		mkV2 : Str -> V2 ;
		
		Animacy = ResDot.Animacy ;
		animate = Anim ;
		inanimate = Inanim ;
		
	-- Implementation
		mkN = \s,a -> lin N ({
			s = table {
				x => s
			} ;
			a = a
		}) ;
		
		mkV2 = \s -> lin V2 ({s = s}) ;
}