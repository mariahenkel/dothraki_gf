abstract VerbSimple = CatSimple ** {

  flags coding = utf8 ;

  data
    UseV     : V   -> VP ;        -- sleep
	
    SlashV2a : V2        -> VPSlash ;  -- love (it)

    ComplSlash : VPSlash -> NP -> VP ; -- love it
    AdvVP    : VP -> Adv -> VP ;        -- sleep here
    
    UseComp  : Comp -> VP ;            -- be warm
    CompNP   : NP  -> Comp ;            -- (be) the man


}
