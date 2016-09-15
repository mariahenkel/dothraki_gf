--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []} ;
    
    AdvVP vp adv = vp ** {compl = vp.compl ++ adv.s} ;
    SlashV2a v = v ;
	
    ComplSlash vpSlash np = vpSlash ** {compl = np.s!vpSlash.objCase} ;

  --  CompNP np = {s = \\_ => np.s ! Acc} ;   -- check if this is really acc, i dont think so (think: nom-pres, past and future all and abl)
  --  UseComp comp = ???
  --  UseComp comp = insertObj comp.s (predAux auxBe) ;
	
}