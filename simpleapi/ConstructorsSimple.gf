--# -path=.:../simpleabstract

incomplete resource ConstructorsSimple = open GrammarSimple in {  --%

  flags optimize=noexpand ;
  
  oper

    mkText = overload {  --%
      mkText : Phr -> (Punct) -> (Text) -> Text  -- Does she sleep? Yes. --:
        = \phr,punct,text -> case punct of {  --%
          PFullStop => TFullStop phr text ;   --%
          PExclMark => TExclMark phr text ;   --%
          PQuestMark => TQuestMark phr text   --%
          } ;  --%
      mkText : Phr -> Text -> Text  -- But she sleeps. Yes!  --%
        =    \x,t -> TFullStop x t  ;  --%
      mkText : Phr -> Punct -> Text   --%
        = \phr,punct -> case punct of {   --%
          PFullStop => TFullStop phr TEmpty ;   --%
          PExclMark => TExclMark phr TEmpty ;   --%
          PQuestMark => TQuestMark phr TEmpty   --%
          } ;   --%
      mkText : Phr -> Text  -- But she sleeps.  --%
        =    \x -> TFullStop x TEmpty  ;  --%

-- A text can also be directly built from utterances.

      mkText : Utt -> (Punct) -> (Text) -> Text  -- Does she sleep? Yes. --:
        = \u,punct,text -> let phr = (PhrUtt NoPConj u NoVoc) in case punct of {  --%
          PFullStop => TFullStop phr text ;   --%
          PExclMark => TExclMark phr text ;   --%
          PQuestMark => TQuestMark phr text   --%
          } ;  --%
      mkText : Utt -> Text -> Text  -- But she sleeps. Yes!  --%
        =    \u,t -> TFullStop (PhrUtt NoPConj u NoVoc) t  ;  --%
      mkText : Utt -> Punct -> Text   --%
        = \u,punct -> let phr = (PhrUtt NoPConj u NoVoc) in case punct of {   --%
          PFullStop => TFullStop phr TEmpty ;   --%
          PExclMark => TExclMark phr TEmpty ;   --%
          PQuestMark => TQuestMark phr TEmpty   --%
          } ;   --%
      mkText : Utt -> Text  -- But she sleeps.  --%
        =    \u -> TFullStop (PhrUtt NoPConj u NoVoc) TEmpty  ;  --%

-- Utterances in turn can
-- be directly given as sentences, present-tense clauses, questions, or
-- positive imperatives. 

      mkText : S   ->  Text    -- She slept. 
        = \s -> TFullStop (PhrUtt NoPConj (UttS s) NoVoc) TEmpty ; --%  
      mkText : Cl  ->  Text    -- She sleeps. 
        = \c -> TFullStop (PhrUtt NoPConj (UttS (TUseCl TPres ASimul PPos c)) NoVoc) TEmpty ; --%  

-- Finally, two texts can be combined into a text.

      mkText : Text -> Text -> Text  -- Where? Here. When? Here. Now! 
        = \t,u -> {s = t.s ++ u.s ; lock_Text = <>} ; --%
      } ; --%

-- A text can also be empty.

      emptyText : Text  -- (empty text)  --:
        = TEmpty ; --%

--3 Punct: punctuation marks 

-- There are three punctuation marks that can separate phrases in a text.

      fullStopPunct  : Punct   -- .   --:
        = PFullStop ; --%  
      questMarkPunct : Punct   -- ?   --:
        = PQuestMark ; --%
      exclMarkPunct  : Punct   -- !   --:
        = PExclMark ; --%

-- Internally, they are handled with a parameter type. --%

  param Punct = PFullStop | PExclMark | PQuestMark ;  --%

  oper --%

--3 Phr: phrases in a text 

-- Phrases are built from utterances by adding a phrasal conjunction
-- and a vocative, both of which are by default empty.

    mkPhr = overload { --%
      mkPhr : (PConj) -> Utt -> (Voc) -> Phr   -- but sleep, my friend  --: 
      = PhrUtt ; --%
      mkPhr : Utt -> Voc -> Phr -- come here John --%
      = \u,v -> PhrUtt NoPConj u v ; --% 
      mkPhr : PConj -> Utt -> Phr -- but come here --%
      = \u,v -> PhrUtt u v NoVoc ; --%
      mkPhr : Utt -> Phr   -- come here --%
      = \u -> PhrUtt NoPConj u NoVoc   ;  --%

-- A phrase can also be directly built by a sentence, a present-tense
-- clause, a question, or a positive singular imperative. 

      mkPhr : S -> Phr   -- she won't sleep
         = \s -> PhrUtt NoPConj (UttS s) NoVoc ; --%  
      mkPhr : Cl -> Phr   -- she sleeps
         = \s -> PhrUtt NoPConj (UttS (TUseCl TPres ASimul PPos s)) NoVoc ; --%  
      } ; --%


--3 PConj, phrasal conjunctions 

-- Any conjunction can be used as a phrasal conjunction.
-- More phrasal conjunctions are defined in $Structural$.

      mkPConj : Conj -> PConj   -- and   --:
        = PConjConj ; --%
      noPConj : PConj --: --% 
        = NoPConj ; --%


--3 Voc, vocatives 

-- Any noun phrase can be turned into a vocative.
-- More vocatives are defined in $Structural$.

    mkVoc : NP -> Voc  -- my friend   --:
      = VocNP ; --% 
    noVoc : Voc --% 
      = NoVoc ; --% 


    mkUtt = overload { 
      mkUtt : S -> Utt                     -- she slept   --:  
      = UttS ; --%  
      mkUtt : QS -> Utt                    -- who didn't sleep   --:
      = UttQS   ; --%  
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
      mkCl : NP  -> VV -> VP -> Cl        -- she wants to sleep
        = \s,v,vp -> PredVP s (ComplVV v vp) ; --% 
      mkCl : N -> Cl           -- there is a house 
      = \y -> ExistNP (DetArtSg IndefArt (UseN y)) ; --% 
      mkCl : CN -> Cl          -- there is an old house 
      = \y -> ExistNP (DetArtSg IndefArt y) ; --% 
      mkCl : NP -> Cl          -- there are many houses   --:
      = ExistNP ; --% 
      mkCl : NP -> NP -> Cl    -- she is the woman   
      = \x,y -> PredVP x (UseComp (CompNP y)) ; --% 
      mkCl : NP -> VP -> Cl   -- she always sleeps   --:
      = PredVP  ; --%
      mkCl : NP -> A  -> Cl    -- she is old
        = \x,y -> PredVP x (UseComp (CompAP (PositA y))) ; --%   
      mkCl : NP -> AP -> Cl    -- she is very old 
		= \x,y -> PredVP x (UseComp (CompAP y)) ; --% 
      } ; 

     mkRS = overload { --%

      mkRS : RCl  -> RS --%
      = TUseRCl TPres ASimul PPos ; --% 
      mkRS : Tense -> RCl -> RS --%  
      = \t -> TUseRCl t ASimul PPos ; --% 
      mkRS : Ant -> RCl -> RS --%
      = \a -> TUseRCl TPres a PPos ; --% 
      mkRS : Pol -> RCl -> RS --%
      = \p -> TUseRCl TPres ASimul p ; --% 
      mkRS : Tense -> Ant -> RCl -> RS --% 
      = \t,a -> TUseRCl t a PPos ; --% 
      mkRS : Tense -> Pol -> RCl -> RS --%
      = \t,p -> TUseRCl t ASimul p ; --% 
      mkRS : Ant -> Pol -> RCl -> RS --%
      = \a,p -> TUseRCl TPres a p ; --% 
      mkRS : (Tense) -> (Ant) -> (Pol) -> RCl -> RS -- that wouldn't have slept 
      = TUseRCl ; --% 
      mkRS : Temp -> (Pol) -> RCl -> RS -- that wouldn't have slept 
      = UseRCl ; --% 
       } ; --% 
 
 
    mkRCl = overload { --%

-- Relative clauses are built from relative pronouns in subject or object position.
-- The former uses a verb phrase; we don't give
-- shortcuts for verb-argument sequences as we do for clauses.
-- The latter uses the 'slash' category of objectless clauses (see below); 
-- we give the common special case with a two-place verb.

      mkRCl : RP -> VP -> RCl        -- who loves her   --:   
      = RelVP     ; --% 

      mkRCl : RP -> V -> RCl                -- who sleeps   
      = \s,v -> RelVP s (UseV v); --%   
      mkRCl : RP -> V2 -> NP -> RCl         -- who loves her
      = \s,v,o -> RelVP s (ComplV2 v o); --%   
      mkRCl : RP -> NP -> V2 -> RCl        -- whom she loves 
      = \ip,np,v -> RelSlash ip (SlashVP np (SlashV2a v)) ; --%
      mkRCl : RP -> ClSlash -> RCl         -- whom she loves today   --:   
      = RelSlash   ; --% 
      mkRCl : RP -> A  -> RCl    -- who is old
        = \x,y -> RelVP x (UseComp (CompAP (PositA y))) ; --%   
      mkRCl : RP -> AP -> RCl    -- who is very old 
		= \x,y -> RelVP x (UseComp (CompAP y)) ; --% 
      mkRCl : RP -> NP -> RCl    -- who is the man   
        = \x,y -> RelVP x (UseComp (CompNP y)) ; --%   
      } ; --% 

    which_RP : RP                        -- which/who  --:
      = IdRP ; --% 




    mkVP = overload { 
      mkVP : V   -> VP                -- sleep --:
      = UseV      ; --% 
       mkVP : V2  -> NP -> VP          -- love him 
      = ComplV2   ; --% 
      mkVP : VV  -> VP -> VP          -- want to sleep  --:
      = ComplVV   ; --% 
      mkVP : VP -> Adv -> VP          -- sleep here   --: 
      = AdvVP     ; --% 
      mkVP : A -> VP               -- be warm 
      = \a -> UseComp (CompAP (PositA a)) ; --% 
      mkVP : AP -> VP              -- be warm 
      = \a -> UseComp (CompAP a)   ; --% 
       } ; --% 

    passiveVP = overload { --%
      passiveVP : V2 ->       VP   -- be loved
      = PassV2 ; --%  
      passiveVP : V2 -> NP -> VP   -- be loved by her 
      = \v,np -> (AdvVP (PassV2 v) (PrepNP by8agent_Prep np)) ; --%
      -- passiveVP : VPSlash -> VP --: --%

      } ; --% 

   mkComp = overload { --%
     mkComp : AP -> Comp -- very old --:
     = CompAP ; --%
     mkComp : NP -> Comp -- this man --:
     = CompNP ; --%
     } ; --%


    mkNP = overload { 
      mkNP : Det -> CN -> NP      -- the first old man   --:
          =  DetCN    ; --%   
      mkNP : Det -> N -> NP       -- the first man   
          =  \d,n -> DetCN d (UseN n)   ; --%   
      mkNP : PN -> NP             -- John  --:
      	  = UsePN    ; --%  
      mkNP : Pron -> NP           -- he  --:
      	  = UsePron  ; --%  
      mkNP : Conj -> NP -> NP -> NP 
      = \c,x,y -> ConjNP c (BaseNP x y) ; --% 
      mkNP : Conj -> ListNP -> NP --: 
      = \c,xy -> ConjNP c xy ; --% 
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


    mkAP = overload { --%

-- Adjectival phrases can be formed from atomic adjectives by using the positive form or
-- the comparative with a complement

      mkAP : A -> AP           -- warm   --:
      = PositA   ; --%   
};

    DetArtSg : Art -> CN -> NP = \a -> DetCN (DetQuant a sgNum) ; 
    DetArtPl : Art -> CN -> NP = \a -> DetCN (DetQuant a plNum) ; 

    mkCN = overload { --%
      mkCN : N  -> CN            -- house  --:
      = UseN     ; --%  
      mkCN :  N -> RS  -> CN     -- house that she owns 
      = \x,y -> RelCN (UseN x) y   ; --% 
      mkCN : CN -> RS  -> CN     -- big house that she loves --:
      = RelCN    ; --% 
      mkCN :  N -> Adv -> CN     -- house on the hill 
      = \x,y -> AdvCN (UseN x) y  ; --% 
      mkCN : CN -> Adv -> CN     -- big house on the hill 
      = AdvCN    ; --% 
       
      mkCN :  A ->  N  -> CN     -- big house  
      = \x,y -> AdjCN (PositA x) (UseN y); --%  
      mkCN :  A -> CN  -> CN     -- big blue house  
      = \x,y -> AdjCN (PositA x) y; --%  
      mkCN : AP ->  N  -> CN     -- very big house  
      = \x,y -> AdjCN x (UseN y) ; --%  
      mkCN : AP -> CN  -> CN     -- very big blue house  
      = AdjCN    ; --%  
      mkCN : CN -> AP  -> CN     -- very big blue house --: --%
      = \x,y -> AdjCN y x    ; --% 
      mkCN :  N -> AP  -> CN     -- very big house --%
      = \x,y -> AdjCN y (UseN x)    ; --% 
      } ; --% 
      
    mkAdv = overload { --%

      mkAdv : Prep -> NP -> Adv          -- in the house --:   
      = PrepNP       ; --%   

      } ; --% 
	  
	  
    mkQS = overload { --%

-- Just like a sentence $S$ is built from a clause $Cl$, 
-- a question sentence $QS$ is built from
-- a question clause $QCl$ by fixing tense, anteriority and polarity. 
-- Any of these arguments can be omitted, which results in the 
-- default (present, simultaneous, and positive, respectively).

      mkQS : QCl  -> QS  --%
      = TUseQCl TPres ASimul PPos ; --%  
      mkQS : Tense -> QCl -> QS  --%  
      =  \t -> TUseQCl t ASimul PPos ; --% 
      mkQS : Ant -> QCl -> QS  --%
      = \a -> TUseQCl TPres a PPos ; --% 
      mkQS : Pol -> QCl -> QS  --%
      = \p -> TUseQCl TPres ASimul p ; --%  
      mkQS : Tense -> Ant -> QCl -> QS --%
      = \t,a -> TUseQCl t a PPos ; --% 
      mkQS : Tense -> Pol -> QCl -> QS --%
      = \t,p -> TUseQCl t ASimul p ; --% 
      mkQS : Ant -> Pol -> QCl -> QS --%
      = \a,p -> TUseQCl TPres a p ; --% 
      mkQS : (Tense) -> (Ant) -> (Pol) -> QCl -> QS -- who wouldn't have slept 
      = TUseQCl ; --%

-- Since 'yes-no' question clauses can be built from clauses (see below), 
-- we give a shortcut
-- for building a question sentence directly from a clause, using the defaults
-- present, simultaneous, and positive.

      mkQS : Cl -> QS                    
      = \x -> TUseQCl TPres ASimul PPos (QuestCl x) ; --%  
      } ; --% 

	  
     mkQCl = overload { --%

      mkQCl : Cl -> QCl -- does she sleep  --:  
      = QuestCl ; --%  

	 } ; --%
	  
	TUseCl  : Tense -> Ant -> Pol ->  Cl ->  S = \t,a -> UseCl  (TTAnt t a) ; 
    TUseQCl : Tense -> Ant -> Pol -> QCl -> QS = \t,a -> UseQCl (TTAnt t a) ; 
    TUseRCl : Tense -> Ant -> Pol -> RCl -> RS = \t,a -> UseRCl (TTAnt t a) ; 
	ComplV2 : V2 -> NP -> VP = \v,np -> ComplSlash (SlashV2a v) np ;

}  
