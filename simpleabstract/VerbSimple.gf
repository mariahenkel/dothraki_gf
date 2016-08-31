abstract VerbSimple = CatSimple ** {

  flags coding = utf8 ;

  data
    UseV     : V   -> VP ;        -- sleep
	
    SlashV2a : V2        -> VPSlash ;  -- love (it)

    ComplSlash : VPSlash -> NP -> VP ; -- love it

}
