incomplete resource ConstructorsSimple = open GrammarSimple in {  --%

  flags optimize=noexpand ;  --%


    mkUtt = overload { 
      mkUtt : S -> Utt                     -- she slept   --:  
      = UttS ; --%  
      mkUtt : Cl -> Utt                    -- she sleeps  
      = \c -> UttS (TUseCl TPres ASimul PPos c) ; --%  
    } ; --%

      positivePol : Pol   -- she sleeps [default]   --: 
        = PPos ; --%
      negativePol : Pol   -- she doesn't sleep    --:
        = PNeg ; --%

      simultaneousAnt : Ant   -- she sleeps [default]   --: 
        = ASimul ; --%
      anteriorAnt : Ant   -- she has slept       --# notpresent  --: 
        = AAnter ; --# notpresent --%

      presentTense     : Tense  -- she sleeps [default]   --:
        = TPres ; --% 
      pastTense        : Tense  -- she slept           --# notpresent  --: 
        = TPast ; --# notpresent --% 
      futureTense      : Tense  -- she will sleep        --# notpresent  --:
        = TFut ; --# notpresent --% 
      conditionalTense : Tense  -- she would sleep       --# notpresent   --:
        = TCond ; --# notpresent --% 

      mkTemp : Tense -> Ant -> Temp -- e.g. past + anterior
        = TTAnt ; --%

    mkS = overload {  --%
      mkS : Cl  -> S  --%  
      = TUseCl TPres ASimul PPos ;   --%    
      } ; 

    mkCl = overload { 
      mkCl : NP -> V -> Cl                -- she sleeps   
      = \s,v -> PredVP s (UseV v); --%   
      mkCl : NP -> V2 -> NP -> Cl         -- she loves him
      = \s,v,o -> PredVP s (ComplV2 v o); --%   
      } ; 

    mkVP = overload { 
      mkVP : V   -> VP                -- sleep --:
      = UseV      ; --% 
      mkVP : V2  -> NP -> VP          -- love him 
      = ComplV2   ; --% 
      } ; --% 

    mkNP = overload { 
      mkNP : Det -> CN -> NP      -- the first old man   --:
          =  DetCN    ; --%   
      mkNP : Det -> N -> NP       -- the first man   
          =  \d,n -> DetCN d (UseN n)   ; --%   
      } ; --% 


      the_Det   : Det -- the (house)
        = theSg_Det ; --% 
      a_Det     : Det -- a (house)
        = aSg_Det ; --% 
      theSg_Det : Det -- the (houses)
        = DetQuant DefArt NumSg ; --% 
      thePl_Det : Det -- the (houses)
        = DetQuant DefArt NumPl ; --% 
      aSg_Det   : Det -- a (house)
        = DetQuant IndefArt NumSg ; --% 
      aPl_Det   : Det -- (houses)
        = DetQuant IndefArt NumPl ; --% 

    the_Quant : Quant    -- the --:
      = DefArt ; --% 
    a_Quant   : Quant    -- a  --:
      = IndefArt ; --%


    mkCN = overload { --%
      mkCN : N  -> CN            -- house  --:
      = UseN     ; --%  
      } ; --%  

}  
