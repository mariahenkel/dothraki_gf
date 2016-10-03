abstract VerbSimple = CatSimple ** {

  flags coding = utf8 ;

  data
    UseV     : V   -> VP ;        -- sleep
	
    ComplVV  : VV  -> VP -> VP ;  	-- want to run
    SlashV2a : V2        -> VPSlash ;  -- love (it)

    ComplSlash : VPSlash -> NP -> VP ; -- love it
    AdvVP    : VP -> Adv -> VP ;        -- sleep here
    
    UseComp  : Comp -> VP ;            -- be warm
    CompNP   : NP  -> Comp ;            -- (be) the man
    CompAP   : AP  -> Comp ;            -- (be) small

    PassV2   : V2 -> VP ;               -- be loved

}
