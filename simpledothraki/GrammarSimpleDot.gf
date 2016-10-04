--# -path=.:../simpleabstract:../common:prelude

concrete GrammarSimpleDot of GrammarSimple =
  NounSimpleDot, 
  VerbSimpleDot, 
  AdverbSimpleDot,
  SentenceSimpleDot,
  PhraseSimpleDot,
  QuestionSimpleDot,
  RelativeSimpleDot,
  TextX,
  StructuralSimpleDot,
  IdiomSimpleDot,
  AdjectiveSimpleDot,
  TenseX
  ** open ResDot, Prelude in {
	flags startcat = Phr ; unlexer = text ; lexer = text ;
}