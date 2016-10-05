--# -path=.:../simpleabstract:../common:prelude

concrete GrammarSimpleDot of GrammarSimple =
  NounSimpleDot, 
  VerbSimpleDot, 
  AdverbSimpleDot,
  SentenceSimpleDot,
  PhraseSimpleDot,
  QuestionSimpleDot,
  RelativeSimpleDot,
  ConjunctionSimpleDot,
  TextX - [IAdv],
  StructuralSimpleDot,
  IdiomSimpleDot,
  AdjectiveSimpleDot,
  TenseX - [IAdv]
  ** open ResDot, Prelude in {
	flags startcat = Phr ; unlexer = text ; lexer = text ;
}