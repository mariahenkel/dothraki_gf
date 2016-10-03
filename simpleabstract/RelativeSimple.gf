--1 Relative clauses and pronouns

abstract RelativeSimple = CatSimple ** {

  fun


-- The more proper ways are from a verb phrase 
-- (formed in [``Verb`` Verb.html]) or a sentence 
-- with a missing noun phrase (formed in [``Sentence`` Sentence.html]).

    RelVP    : RP -> VP -> RCl ;      -- who loves John

    RelSlash : RP -> ClSlash -> RCl ; -- whom John loves

-- Relative pronouns are formed from an 'identity element' by prefixing
-- or suffixing (depending on language) prepositional phrases or genitives.

    IdRP  : RP ;                      -- which

}

