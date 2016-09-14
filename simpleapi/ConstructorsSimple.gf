--# -path=.:../simpleabstract

incomplete resource ConstructorsSimple = open GrammarSimple in {  --%

  flags optimize=noexpand ;
  
  oper

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
      mkS : Tense -> Cl -> S    --%  
      = \t -> TUseCl t ASimul PPos ;   --%  
      mkS : Ant -> Cl -> S   --%  
      = \a -> TUseCl TPres a PPos ;   --%   
      mkS : Pol -> Cl -> S    --%  
      = \p -> TUseCl TPres ASimul p ;   --%    
      mkS : Tense -> Ant -> Cl -> S   --%  
      = \t,a -> TUseCl t a PPos ;   --%  
      mkS : Tense -> Pol -> Cl -> S   --%  
      = \t,p -> TUseCl t ASimul p ;   --%  
      mkS : Ant -> Pol -> Cl -> S   --%  
      = \a,p -> TUseCl TPres a p ;   --%  
      mkS : (Tense) -> (Ant) -> (Pol) -> Cl  -> S -- she wouldn't have slept
      = \t,a -> TUseCl t a ;   --%  
      mkS : Temp -> Pol -> Cl -> S -- she wouldn't have slept  --:
      = UseCl ; --%
      } ;

    mkCl = overload { 
      mkCl : NP -> V -> Cl                -- she sleeps   
      = \s,v -> PredVP s (UseV v); --%   
      mkCl : NP -> V2 -> NP -> Cl         -- she loves him
      = \s,v,o -> PredVP s (ComplV2 v o); --%   
      mkCl : N -> Cl           -- there is a house 
      = \y -> ExistNP (DetArtSg IndefArt (UseN y)) ; --% 
      mkCl : CN -> Cl          -- there is an old house 
      = \y -> ExistNP (DetArtSg IndefArt y) ; --% 
      mkCl : NP -> Cl          -- there are many houses   --:
      = ExistNP ; --% 
      } ; 

    mkVP = overload { 
      mkVP : V   -> VP                -- sleep --:
      = UseV      ; --% 
      } ; --% 

    mkNP = overload { 
      mkNP : Det -> CN -> NP      -- the first old man   --:
          =  DetCN    ; --%   
      mkNP : Det -> N -> NP       -- the first man   
          =  \d,n -> DetCN d (UseN n)   ; --%   
      mkNP : Pron -> NP           -- he  --:
      	  = UsePron  ; --%  
      } ; --% 

      i_NP : NP          -- I
      = mkNP i_Pron ;
      you_NP : NP        -- you (singular)
      = mkNP youSg_Pron ;
      youPol_NP : NP     -- you (polite singular)
      = mkNP youPol_Pron ;
      he_NP : NP         -- he
      = mkNP he_Pron ;
      she_NP : NP        -- she
      = mkNP she_Pron ;
      it_NP : NP         -- it
      = mkNP it_Pron ;
      we_NP : NP         -- we
      = mkNP we_Pron ;
      youPl_NP : NP      -- you (plural)
      = mkNP youPl_Pron ;
      they_NP : NP       -- they
      = mkNP they_Pron ;

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
        
	  this_Det : Det 
	  = (DetQuant this_Quant sgNum) ; --% 
	  that_Det : Det 
	  = (DetQuant that_Quant sgNum) ; --% 
	  these_Det : Det 
	  = (DetQuant this_Quant plNum) ; --% 
	  those_Det : Det 
	  = (DetQuant that_Quant plNum) ; --% 

    sgNum : Num = NumSg ;  
    plNum : Num = NumPl ;  

    the_Quant : Quant    -- the --:
      = DefArt ; --% 
    a_Quant   : Quant    -- a  --:
      = IndefArt ; --%

    Art : Type = Quant ; 
      the_Art : Art = DefArt ;   -- the 
      a_Art : Art  = IndefArt ;   -- a 


    DetArtSg : Art -> CN -> NP = \a -> DetCN (DetQuant a sgNum) ; 
    DetArtPl : Art -> CN -> NP = \a -> DetCN (DetQuant a plNum) ; 

    mkCN = overload { --%
      mkCN : N  -> CN            -- house  --:
      = UseN     ; --%  
      } ; --%  

	  
	TUseCl  : Tense -> Ant -> Pol ->  Cl ->  S = \t,a -> UseCl  (TTAnt t a) ; 
	ComplV2 : V2 -> NP -> VP = \v,np -> ComplSlash (SlashV2a v) np ;

}  
