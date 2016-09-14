--# -path=.:../simpleabstract:prelude

concrete IdiomSimpleDot of IdiomSimple = CatSimpleDot ** open Prelude, ResDot, VerbSimpleDot, SentenceSimpleDot, ExtraDot in {

  flags optimize=all_subs ;

  lin
    ExistNP np = PredVP np (UseV vekhat_V);
}

