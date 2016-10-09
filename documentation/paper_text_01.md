## 1 Introduction
Grammatical Framework (GF) is a functional programming language, created in 1998 (Ranta, 2011) and designed to write (natural) language grammars. As GF is “working from a language-independent representation of meaning” (Wikipedia, 2016) it can be used to generate or parse text in different languages at the same time. One of its functions is to translate between languages. 
Since GF uses a symbolic approach to process and translate language, in most cases its translations are more precise than those of statistical tools we use in everyday life (Brown & Frederking, 1995). For example, the “Google Translate” service (Google, 2016) will produce ungrammatical sentences as soon as the input is too complicated while the GF translator (Grammatical Framework, 2016a) has no problems producing a correct translation (see Table 1) in many cases. 

Table 1

This also means, that GF – other than Google Translate – depends on a large knowledge base of predefined grammar rules to achieve high-quality language processing: Its own standard library, the GF Resource Grammar Library, covers more than 38 different languages (Ranta, 2015) - although many of them are not yet complete - and is still growing. In 2010, it already consisted of more than 500,000 lines of code (Ranta, 2011). 
As Grammatical Framework is an open-source project (Ranta, 2009) and still under development, everyone is invited to use it or even help further develop it. For example, by adding languages to the library, which is the aim of the project described in this paper. 
Our goal is to write a GF resource grammar for the Dothraki language and, eventually, be able to add it to the GF Resource Grammar Library. The work described in this paper is meant to lay a foundation for this goal (see Chapter 2).
Dothraki is a constructed language, developed by the language creator and writer David J. Peterson (Peterson, 2016a). The Dothraki are a fictional race of nomadic horse warriors in the “A Song of Ice and Fire” book series by George R. R. Martin (Martin, 2016). As the series was adapted for television by the television network HBO, the language bits found in Martin’s books had to be extended to a fully functional language (Peterson, 2016b): The Dothraki language. Today, it has a vocabulary of over 3,000 words (Tongues of Ice and Fire Wiki, 2016). We will show a few examples of the Dothraki language grammar in this paper, but more information can be found in the book “Living Language Dothraki” (Peterson, 2014), on Peterson’s blog (2016b) and on the Tongues of Ice and Fire Wiki (2016) among many other sources.
This paper aims to serve as a short documentation and explanation of our project. It will cover the project aim and scope, general information regarding the project as well as its structure and explanations of sample functions and the corresponding Dothraki grammar rules (Chapter 2). We will also discuss problems and limitations and briefly describe future plans before we summarize and evaluate the project in its current state and our experience while working on it (Chapter 3).


## 2 The Project

As mentioned before, the aim of this project is to create a resource grammar for the Dothraki language and add it to the GF Resource Grammar Library, so that other Dothraki fans and/or GF enthusiasts may use it. While there are currently a few Dothraki language learning apps and online translators avaialable (e.g. Cognitus Apps, 2016; Fun Translations, 2016), they are still very limited and lack the quality and range to actually learn the language or provide an accurate translation. By the means of an open-source Dothraki resource grammar, better tools like these or even different projects could be created more easily. 

### 2.1 About Resource Grammars and the Standard Library

The GF Resource Grammar Library covers the morphology and basic syntax of several languages. Here, the idea is to predefine "program details, which require expert knowledge, and make them available for non-expert application programmers" (Ranta, 2009). This way the library users need not have the "specialized linguistic expertise" (Ranta, 2009) to write an application grammar in GF. Considerable work has been and is being done by the GF developers and resource grammar programmers to make this possible:

The idea of using a grammar as a software library is, to our knowledge,
new in GF. It has required a considerable effort in the design and implementa-
tion of the GF programming language: a type system, a module system, com-
pilation  techniques,  and  optimizations. [...] The  effort
made in this work is supplemented by a substantial effort in the library itself.
The code included in the library is more than twice in size compared to the
implementation of GF. (Ranta, 2009)

The provision of the GF resource grammar library as an easy-to-use tool may, on the one hand, be more time consuming, but, on the other hand, enables more people to use it - even without the expert knowledge. Ranta (2011, p. 200) also recommends to add new languages to the library, instead of directly writing an application grammar for them, as they can “serve an unlimited number of applications” and because “the existing library specification will help to identify the linguistic issues and avoid pitfalls.” He estimates, that an interval of three to six months of full-time work is needed for an experienced GF programmer to implement a new resource grammar (p. 222).

Figure 1: Mini Resource Grammar 

As the workload of building a full resource grammar exceeds the time frame for this term paper, the first big milestone of our project is to create a mini resource grammar, similar to the Italian mini resource grammar, an example of Ranta's book (2011, pp. 237-245). This first milestone is to lay the foundation for a full resource grammar. Other than in Ranta's example, we already use the categories and structure of a full resource grammar (see Figure 1) to make a later expansion easier. 

Figure 2: Resource Grammar Structure

### 2.2 Project Structure

Just like the GF repositories (Détrez & Camilleri, 2016), our full project is hosted on GitHub (Henkel & Kuckuck, 2016) so that others may see, use and contribute to it. It consists of the following folders:

* simpleapi
* simpleabstract
* simpledothraki
* simpleenglish
* common

* example

* documentation 
* vocabulary

The “simpleapi” folder (like the “api” folder in the full resource grammar library) contains the outward facing part of the library – the types and functions available to application grammar developers. Those are implemented in terms of more basic functions, which are declared in the abstract grammar(s) contained in the “simpleabstract” folder. For each language, in our case just English and Dothraki, there is one folder (here: “simpledothraki” and “simpleenglish”) which contains the concrete implementations of these abstract grammars. Some of these parts, those shared by all languages, are implemented in the “common” folder. We are planning to remove the “simple” from all folder- and filenames as soon as the resource grammar is complete. Since we already use the structure of a full resource grammar, it should work accordingly. It should be noted, that we are working with the “simpleenglish” resource grammar, to be able to translate Dothraki phrases into English for testing and presenting purposes. Later on, the full English resource grammar, already available via the GF Resource Grammar Library, will be used.
The mini resource grammar can already be used for application grammars. The “example” folder contains application grammar rules to show how the resource grammar can be applied.
There are two more folders: The “documentation” folder is holding two versions of our documentation, one markdown file for readers on GitHub and one print version. Finally, the “vocabulary” folder contains the vocabulary extractor, a supporting python script, written by us to add a relatively large number of words to our dictionary automatically. It takes the source code of the Dothraki vocabulary site (Ice and Fire Wiki, 2016) as input, extracts words and their translations from it and transforms them into the right format, needed for the resource library. For example, the entry "ador [aˈdor], ni. chair" on the website will create the three output strings: "ador_N = mkN "ador" inanimate;", "chair_N = mkN "chair";" and "ador_N = chair_N;" – one entry for the Dothraki linearization, one entry for the English linearization and one entry for the dictionary. This way, we were able to add more than 1644 words to our dictionary, and will be able to add even more as soon as the resource grammar is expanding.

### 2.3 Implementation of Grammatical Categories in Dothraki

In this section we will go into some of the design decisions involved in the implementation of the Dothraki resource grammar.  In order to get a high-level overview, we will first take a look at the linearizations of some of the categories defined in the API part of the abstract resource grammar library, showing how Dothraki grammar can be fit into the GF scheme.

#### 2.3.1 Nouns and Noun Phrases

The relevant categories here are `N` (nouns), `CN` (common nouns), `NP` (noun phrases), `Pron` (pronouns) and `PN` (proper names), which are realized as follows:<sup>1</sup>

		N, CN = {s : Number => Case => Str ; a : Animacy } ;
		NP, Pron = {s : Case => Str ; agr : Agr } ;	
    	PN = {s : Case => Str } ;

<sup>1</sup>In the actual code, some parts of this are defined in the `ResDot` module instead of `CatDot`, for easier reusability.

These implementations follow in a fairly straightforward fashion from the basic features of nouns in the Dothraki language: 

In Dothraki, every noun falls into one of two classes, *animate* and *inanimate* (which play a very similar role to grammatical gender in other languages). The language uses five cases: nominative, accusative, genitive, ablative and allative. Hence, we define:

		Animacy = Anim | Inanim ;
		Case = Nom | Gen | Acc | All | Abl ;

Noun phrases, as well as pronouns, have a fixed number and person, which is stored in the `agr` field of type `Agr`, simply defined as follows:

		Agr = Ag Person Number ;

There does not currently seem to be a need to store animacy in the agreement record. This is unlike English, where the `NP`s gender can affect the verb phrase ("The boy loves himself" but "The girl loves herself") and thus needs to be stored in the `NP`.

Finally, proper names are (so far as we can tell) always animate and third person singular, so none of that information needs to be stored in `PN`.

In order to turn a common noun into a noun phrase, we usually need a determiner. The relevant categories here are `Num` (numerals), `Quant` (quantifiers), `Predet` (predeterminers) and `Det` (determiners, roughly composed of optional predeterminers, a quantifier and a numeral). Numerals in the proper sense, as well as predeterminers, are not yet implemented in our resource grammar (there is a lack of good information on determiner structure in Dothraki), but since the `Num` category is used in the GF Resource Grammar Library not just for representing numerals but also to determine the number of the determiner, we have a dummy implementation in our resource grammar:

		Num = {s: Str ; n : Number} ;
		Quant = {s : QuForm => Case => Str } ;
		Det = {s : Animacy => Case => Str ; n : Number ; s2 : Str } ;
 
The `s` field of `Num` is always empty in our implementation (it is [necessary for technical reasons](https://groups.google.com/d/msg/gf-dev/aRjt_2JfvA0/iTcZbTu5AAAJ) related to the implementation of GFs parser).

Quantifiers in Dothraki (such as "jin" -- "this" and "rek" -- "that") are inflected for animacy, number and case, but the singular and plural inanimate forms are always identical, so `QuForm` is defined as follows:  

		QuForm = QAnim Number | QInanim ;
 
Unlike a `Quant`, a `Det` has a fixed number.

An interesting feature of determiners in Dothraki is that they can appear either before the noun ("jinak adra" -- "this turtle") or after (such as determiners built from possessive pronouns: "adra anni" -- "my turtle"). Conceivably (though we cannot currently say for certain, due to lack of examples and documentation on Dothraki determiner structure), a determiner could even be split into two parts ("my two turtles" -- "akat adrasi anni"?). In anticipation of this, `Det` has two `Str` components, `s` and `s2`. Since possessive pronouns are the only examples of postposed determiners we know so far, and these happen not to inflect with animacy or case, the `s2` part is simply a `Str`, whereas the `s` part is a table of inflected forms.

#### 2.3.2 Verbs and Verb Phrases

The relevant categories here are `V` (intransitive verbs), `V2` (transitive verbs with an `NP` complement) and `VP` (verb phrases), whose lincats are as follows:

		-- in ResDot --
		param VFormPN = Pers1 Number | Pers2 | Pers3 Number ;
		param VForm = 
			APast Polarity Number 
		  | APresent Polarity VFormPN 
		  | AFuture Polarity VFormPN 
		  | ImpFormal Polarity 
		  | ImpInformal Polarity ;

		oper Verb : Type = {
			s : VForm => Str ; 
			inf : Str ; 
			part : Str
		} ;

		-- in CatSimpleDot --
		V = Verb ;
		V2 = Verb ** {objCase : Case} ;
		VPSlash = Verb ** {objCase : Case ; subjpost : Str} ;
		VP = Verb ** {compl : Str; subjpost : Str} ;

The basic structure `Verb` contains the infinitive and participle as well as all conjugated forms of a verb. The somewhat convoluted setup of the `VForm` parameter type is owed to the peculiarities of conjugation in Dothraki: First off, somewhat unusually, in all tenses and moods, verb forms vary with the polarity of the sentence ("Me dothra**e**" -- "He rides", "Me vos dothra**o**" -- "He does not ride"). In the present and future tenses, verbs are inflected for person and number, but the second person singular and plural forms are always identical (hence the definition of `VFormPN`). In the past tense, verbs are inflected for number only, not for person (but unlike in the present and future tenses, second person singular and plural forms *do* differ). There are also formal and informal imperative forms.

Transitive verbs are basically the same as intransitive verbs, but they also assign a case to their `NP` complement (mostly accusative, but other cases do appear), which is stored in the `objCase` field. 

A verb phrase essentially consists of a verb with a complement. There is also a field `subjpost` which again encodes a peculiar feature of Dothraki grammar: A number of constructions, which, in other languages, are rendered by verbal auxiliaries (can, must) or verbs with `VP` complements (try to), are realized in Dothraki via non-inflecting particles (e.g. "laz" and "eth" corresponding to "can" and "must"), which do not otherwise affect the conjugation of the main verb ("Me dothrak" -- "He rides", "Me laz dothrak" -- "He can ride", "Me kis dothrak" -- "He tries to ride"). These have to be regarded as part of the verb phrase but, syntactically, are not preposed to the verb phrase but postposed to the subject of the clause (this makes a difference, e.g., in relative clauses, which have VSO word order instead of the standard SVO word order). The same is true of passive constructions, which are indicated by "nem" postposed to the subject ("Lajak dothrae" -- "The warrior rides", "Hrazef nem dothrae" -- "The horse is ridden"; note that the verb still agrees with the syntactical subject of the clause).

`VPSlash` represents a verb phrase missing a complement and kind of sits between `V2` and `VP`. It is generated from a `V2` (via `SlashV2a : V2 -> SlashVP`) and can then either be turned into a `VP` by adding an object (via `ComplSlash : VPSlash -> NP -> VP`) or into a `ClSlash` (clause missing an object) by adding a subject (via `SlashVP : VPSlash -> NP -> ClSlash`), to be used e.g. in a relative sentence ("the goat which *the warrior stabbed*"). As such it does not have a complement, like `VP`, and retains the `objCase` from `V2`, but it does have the `subjpost` field from `VP` (so we can form e.g. "the goat which the warrior *can stab*" -- "dorvi fin *vindee* lajak *laz*").

In order to implement verbal auxiliaries such as "can" and "must", which are represented as `VV`s in GF, we also have a dummy lincat for `VV`:

		VV = {s : Str} ;

Since "can", "must" etc. are simply uninflected particles in Dothraki, this is enough to represent those. This should of course not be considered a final design, since it is unlikely that all verbs with verb phrase complement can be realized like this in Dothraki. However, there is currently very little documentation available on how other `VV` verbs are realized, so this dummy implementation will have to do for now.

#### 2.3.3 (Relative) Clauses and Sentences

There are no big surprises in the lincats of `Cl` and `QCl` (clauses and question clauses, respectively) or `S` and `QS` (sentences an question sentences):

		S, QS = {s : Str} ;
		Cl, QCl = {s : Tense => Anteriority => Polarity => Str} ;

The lincats of these categories are fairly canonical in many languages and in Dothraki they are basically the same as in English or German.<sup>2</sup>

<sup>2</sup> The main differences between these languages come from whether the linearization also depends on some kind of `Order` parameter, for example distinguishing indirect from direct questions or subordinate from main clauses. It might be necessary to add something like that to our lincat later, if more information about e.g. indirect questions in Dothraki becomes available, but for now there is no indication that we need such an extra parameter.

Relative clauses are more interesting. The relevant categories here are `RP` (relative pronoun), `ClSlash` (a clause missing an object), `RCl` (relative clauses) and `RS` (relative sentence):
		
		RP = {s : QuForm => Case => Str } ;
		RCl = {s : Tense => Anteriority => Polarity => Animacy => Number => Str } ;
		ClSlash = {s : Tense => Anteriority => Polarity => Str; subj: Str ; objCase : Case} ;
		RS = {s : Animacy => Number => Str } ;
  
Relative pronouns in Dothraki inflect according to the animacy and number of the noun phrase they attach to, and the case that the relativized noun phrase would have been assigned in the embedded relative sentence (similar to German). Hence, the linearization of `RS` depends on the animacy and number of the noun phrase it is eventually attached to and `RCl` is to `RS` what `Cl`  is to `S`, i.e. it is a relative sentence, whose tense, anteriority and polarity have not yet been fixed. `ClSlash` has to remember the case of the missing object, so it can assign it to the relative pronoun, if used in a relative sentence (via `RelSlash : RP -> ClSlash -> RCl`). 

There is one more important difference between `Cl` and `ClSlash`. When a clause is constructed from a verb phrase and subject via `PredVP : NP -> VP -> Cl`, the noun phrase is just prepended to the verb phrase. We cannot do this when constructing a `ClSlash` via `SlashVP : NP -> VPSlash -> ClSlash`, because of a quirk in Dothraki word order: Whereas regular main clauses and questions follow SVO word order, relative clauses have VSO word order. So depending on whether a `ClSlash` is eventually turned into a relative sentence (via `RelSlash : RP -> ClSlash -> RCl`) or a question (via `QuestSlash : IP -> ClSlash -> QCl`), we have to choose the word order accordingly ("dorvi fin vindee lajak" -- "the goat which the warrior stabs" vs "Fin lajak vindee?" -- "What does the warrior stab?"). Therefore, `ClSlash` contains the (linearized) subject in a field, `subj`.

#### 2.3.4 Adjectives

The relevant categories here are `A` (adjectives), `AP` (adjectival phrases) and `Comp` ("complement of a copula", though see below):

		A = {s : Degree => Number => ACase => Str ; pred : VForm => Str } ;		
		AP = {s : Number => ACase => Str ; pred : VForm => Str } ;
		Comp = {s : VForm => Str} ; 

There are two basic uses for adjectival phrases: attributive (as in "the strong warrior") and predicative (as in "the warrior is strong"). Attributive use works similarly in Dothraki to e.g. English and German: The adjectival phrase inflects for number and case in agreement with the noun it modifies. In Dothraki the forms for all the cases other than nominative are always identical, however, so we define

		ACase = ANom | AOther ;

instead of duplicating these forms in the table.

In English or German, predicative use of an adjective employs a copula ("to be" or "sein"), which is inflected for tense, whereas the adjective is invariant. The same happens in sentences like "the man is a warrior", where the copula "to be" connects the two noun phrases. Dothraki, however, is an entirely copulaless language. When an adjective is used predicatively, the adjective itself is essentially turned into a verb and inflected for tense and polarity ("the strong warrior" -- "lajak haj"; "The warrior is strong" -- "lajak haja"; "the warrior will be strong" -- "lajak vahaja"; "the warrior was not strong" -- "lajak vos ahajo"). Similarly, in a sentence like "the man is a warrior", the `NP` itself inflects for tense (with the ablative and allative form indicating past and future tense, respectively): "The woman is a warrior" -- "Chiori lajak"; "The woman was a warrior" -- "Chiori lajakoon"; "The woman will be a warrior" -- "Chiori lajakaan".

As a result the category `Comp` (i.e. "strong" in "the warrior is strong" and "a warrior" in "the woman is a warrior") essentially behaves like an intransitive verb in Dothraki. `A` and `AP` have to contain all conjugated forms of the verb as it might be used in a predicative context.<sup>3</sup> 

<sup>3</sup>Indeed our lincats for `A`, `AP` and `Comp`, while very much unlike the lincats in the English and German resource grammars, are quite similar to the lincats in the resource grammar for Japanese, another language, in which the adjective itself is inflected for tense and polarity in predicative use via a complex set of suffixes. As in our resource grammar, this leads to `AP` and `Comp` being structurally very similar to `VP`:

    VP = {
		verb : Speaker => Animateness => Style => TTense => Polarity => Str ;  
		a_stem, i_stem : Speaker => Animateness => Style => Str ;  
		te, ba : Speaker => Animateness => Style => Polarity => Str ;
		prep : Str ; obj : Style => Str ; prepositive : Style => Str ;
		needSubject : Bool} ;
    Comp = {
		verb : Animateness => Style => TTense => Polarity => Str ;
		a_stem, i_stem : Animateness => Style => Str ; 
		te, ba : Animateness => Style => Polarity => Str ;
		obj : Style => Str ; prepositive : Style => Str ; 
		needSubject : Bool} ;
    AP = {
		pred : Style => TTense => Polarity => Str ; 
		attr, adv, dropNaEnging, prepositive : Style => Str ; 
		te, ba : Style => Polarity => Str ; 
		needSubject : Bool} ;


#### 2.3.5 Other categories

Adverbial phrases, like in most other languages, are simply uninflected token strings, as implemented in `CommonX`:

    Adv = {s : Str} ; 
	Prep = {s : Str ; c : Case} ;

Adverbial phrases can be formed from noun phrases using prepositions, which assign case in Dothraki, or sometimes are expressed *only* by case. For example, `to_Prep` from module `Structural` is implemented in Dothraki simply as `{s = [] ; c = All}`: What is expressed in other laguages via the preposition "to", is understood in Dothraki from the modified noun phrase appearing in allative case.

Conjunctions in Dothraki have different forms depending on whether they are used to conjoin noun phrases/sentences, or as phrasal conjunctions to start a sentence:

	Conj = {s : Str; p : Str; n : Number} ;

E.g. the conjunction "and" when used to connect noun phrases is "ma" (as in "ma lajak ma khaleesi" -- "the warrior and the queen"), but translates as "majin", when used as a phrasal conjunction ("Majin lajak zoqwe khaleesies." -- "And the warrior kissed the queen."). 


Figure 3 shows the main categories of the GF Resource Grammar Library and the current status of our implementation. The yellow categories have been fully or at least partially implemented in our resource grammar. For the first milestone, we do not aim to implement every single instance of every category. Instead, we want to first implement the most important categories in a proper way, to make later expansion easier. For example, there are 32 different instances of the “mkCl” function for the clause category “Cl” (Grammatical Framework, 2016b). We did not implement all of them in the current version of our resource grammar, but since there are already some “mkCl” functions included, it is easier to add more functions of the same type later on. 

Figure 3: GF resource Grammar Library Categories

With the current implementation status, it is already possible to parse and translate a wide range of phrases. The following example text is fully supported by the current version of the Dothraki resource grammar:

Beispieltext....

### 2.4 Implementation of syntactical functions in Dothraki

#### 2.4.1 Morphology

Dothraki, generally speaking, has a much richer morphology than English, making the constructors for lexical categories supplied in `ParadigmsSimpleDot` fairly complex. As an example, let us describe the construction of verbs (nouns and adjectives present similar challenges). Here is the constructor `mk2V : Str -> Str -> V` which builds a `V` from the infinitive form and the past singular (the two forms which would often be given in dictionaries):

    mk2V : Str -> Str -> Verb = \zalat,zal -> let {stem = stemV zalat zal} in {
    	inf = zalat ;
    	s = case stem of {
    		fati@(fat + ("a"|"e"|"i"|"o")) => table {
    			APast Pos Sg => zal ;
    			APast Pos Pl => fati + "sh" ;
    			APast Neg Sg => fat + "o" ;
    			APast Neg Pl => fat + "osh" ;
    			
    			APresent pol pn => presForm fati pol pn ; 
    			
    			AFuture Pos pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "a"} + fati) Pos pn ;
    			AFuture Neg pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "o"} + fati) Neg pn ;
    			
    			ImpFormal Pos => stem ;
    			ImpFormal Neg => fat + "o" ;
    			
    			ImpInformal Pos => fati + "s" ;
    			ImpInformal Neg => fat + "os"
    		} ;
    		em => table {
    			APast Pos Sg => zal ;
    			APast Pos Pl => em + "ish" ;
    			APast Neg Sg => em + "o" ;
    			APast Neg Pl => em + "osh" ;
    			
    			APresent pol pn => presForm em pol pn ;
    			
    			AFuture Pos pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "a"} + em) Pos pn ;
    			AFuture Neg pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "o"} + em) Neg pn ;
    			
    			ImpFormal Pos => em + "i" ;
    			ImpFormal Neg => em + "o" ;
    			
    			ImpInformal Pos => em + "as" ;
    			ImpInformal Neg => em + "os"
    		} 
    	} ;
    	part = case stem of {
    		fat + ("a"|"e"|"i"|"o") => stem + "y" ;
    		_ => stem + "ay"
    	}
    } ;

Here `presForm : Str -> Polarity -> VFormPN -> Str` is another function, that generates the present tense forms of a verb. This is reused for the future tense forms, which have the same endings, but are distinguished by a prefix.

    presForm : Str -> Polarity -> VFormPN -> Str = \stem,pol,pn -> case stem of {
    	fati@(fat + ("a"|"e"|"i"|"o")) => case <pol,pn> of {
    		<Pos, Pers1 Sg> => fati + "k" ;
    		<Pos, Pers1 Pl> => fati + "ki" ;
    		<Pos, Pers2> => fati + "e" ;
    		<Pos, Pers3 Sg> => fati + "e" ;
    		<Pos, Pers3 Pl> => fati + "e" ;
    		
    		<Neg, Pers1 Sg> => fat + "ok" ;
    		<Neg, Pers1 Pl> => fat + "oki" ;
    		<Neg, Pers2> => fati + "o" ;
    		<Neg, Pers3 Sg> => fati + "o" ;
    		<Neg, Pers3 Pl> => fati + "o"
   		} ;
   		em => case <pol,pn> of {
    		<Pos, Pers1 Sg> => em + "ak" ;
    		<Pos, Pers1 Pl> => em + "aki" ;
    		<Pos, Pers2> => em + "i" ;
    		<Pos, Pers3 Sg> => em + "a" ;
    		<Pos, Pers3 Pl> => em + "i" ;
    		
    		<Neg, Pers1 Sg> => em + "ok" ;
    		<Neg, Pers1 Pl> => em + "oki" ;
    		<Neg, Pers2> => em + "i" ;
    		<Neg, Pers3 Sg> => em + "o" ;
    		<Neg, Pers3 Pl> => em + "i"
   		}
   	} ;


As can be seen here, suffixes often differ according to whether the stem ends in a vowel or a consonant, which is handled by GF's pattern matching mechanisms. Future tense forms are indicated by a prefix ("v" if the stem starts with a vowel, "a" if the stem starts with a consonant), which we implement employing GF's special "prefix-dependent choice" type.

In case the past singular form of the verb is not explicitly supplied, it needs to be guessed, which can be complicated:

    mk1V : Str -> Verb = \w -> case w of {
    	ezo + "lat" => mk2V w ezo ;
    	riss + "at" => mk2V w (addepenthesis riss) 
    } ;

In general, the past singular form is just the stem of the verb, which mostly is derived by removing the "-lat" or "-at" infinitive ending<sup>4</sup>. However, this is complicated by the rules of epenthesis: The stem of "rissat" is "riss-", but the past singular is "risse", because a Dothraki word cannot end in "-ss". The rules for which consonant clusters may appear at the end of a word are complicated and for the most part captured in the function `addepenthesis : Str -> Str`, which adds an epenthesis "-e" to a string, if it ends in a disallowed consonant cluster:

	addepenthesis : Str -> Str = \w -> case w of {
		_ + ("a"|"e"|"i"|"o") => w ;
		_ + ("w"|"g"|"q") => w + "e" ;
		x + ("y"|"r"|"l") => case x of {
			_ + ("a"|"e"|"i"|"o") => w ;
			_ => w + "e"
		} ;
		x + ("m"|"n") => case x of {
			_ + ("a"|"e"|"i"|"o") => w ;
			y + ("w"|"y"|"r"|"l") => case y of {
				_ + ("a"|"e"|"i"|"o") => w ;
				_ => w + "e"
			} ;
			_ => w + "e"
		} ;
		x + ("th"|"s"|"sh"|"z"|"zh"|"kh"|"f"|"v") => case x of {
			_ + ("a"|"e"|"i"|"o") => w ;
			y + ("w"|"y"|"r"|"l"|"m"|"n") => case y of {
				_ + ("a"|"e"|"i"|"o") => w ;
				_ => w + "e"
			} ;
			_ => w + "e" 
		} ;
		x + ("j"|"ch"|"t"|"d"|"k") => case x of {
			_ + ("a"|"e"|"i"|"o") => w ;
			y + "w"|"y"|"r"|"l"|"m"|"n"|"th"|"s"|"sh"|"z"|"zh"|"kh"|"f"|"v") => case y of {
				_ + ("a"|"e"|"i"|"o") => w ;
				_ => w + "e"
			} ;
			_ => w + "e"
		}
	} ;
  

<sup>4</sup>Some verbs, such as "zalat" end in "-lat" but the "l" is part of the stem, not the infinitive ending. This cannot be guessed and has to be indicated in a dictionary.

This heuristic will give the right result in most (but not all) cases. Like in other resource grammars, there is always the option of supplying an irregular form by hand, if the heuristic fails.

#### 2.4.2 Syntax

Many of the considerations about Dothraki syntax, that have gone into the design of our resource grammar, have already been mentioned in Section 2.3. As one example of how the design of our lincats is used to implement syntactical functions, let us go through the various ways of constructing clauses:

	PredVP np vp = {s = \\t,a,p =>
		np.s!Nom
		++ vp.subjpost 
		++ verbStr vp t a p np.agr
		++ vp.compl ;
	} ;

The function `PredVP : NP -> VP -> Cl` from module `Sentence` is the basic way of constructing a clause from a subject and a verb phrase (23 out of the 31 overloads of `mkCl` from the resource grammar API are implemented in terms of `PredVP`). In our implementation this function concatenates four elements:

1. The nominative form of the subject noun phrase,
2. any particles indicating the mood of the verb phrase (such as "nem" indicating passive voice, or "laz"/"eth" corresponding roughly to "can"/"must" in English)
3. the verb inflected for tense, anteriority, polarity and person/number of the noun phrase,
4. and the complement of the verb phrase.

Conjugation of the verb is implemented in the function `verbStr : Verb -> Tense -> Anteriority -> Polarity -> Agr -> Str` in the module `ResDot`. The argument `vp` in `PredVP` above is of type `VP` which is defined as `VP = Verb ** {compl : Str; subjpost : Str}`. GF has a mostly structural (as opposed to nominative) type system and thus `VP` is automatically subtype of `Verb`, and variables of `VP` type can be used where a `Verb` is expected.

The function `verbStr` is reused in other functions concerned with the constrcution of clauses.

	SlashVP np vpsl = {
		s = \\t,a,p => verbStr vpsl t a p np.agr ;
		subj = np.s!Nom ++ vpsl.subjpost;
		objCase = vpsl.objCase
	} ;

The function `SlashVP : NP -> VPSlash -> ClSlash` is used in several overrides of the API functions `mkClSlash` as well as in some overrides of `mkQCl` and `mkRCl`. Since `VPSlash` is also an extension of `Verb`, we can reuse `verbStr` to conjugate the verb. The subject phrase is not prepended to the verb (for reasons explained in 2.3.2), but instead kept in the field `subj`. Unlike `VP`, a `VPSlash` has no complement, but instead the case of the missing object has to be remembered.

    RelVP rp vp = {
    	s = \\t,a,p,anim,n =>
		rp.s!(anToQuForm anim n)!Nom
		++ vp.subjpost
		++ verbStr vp t a p (Ag P3 n)
		++ vp.compl ;
    } ;

The function `RelVP : RP -> VP -> RCl` is the basic way of creating relative clauses in which the subject of the sentence is being relativized (22 of the 25 overrides of `mkRCl` are based on `RelVP`). This implementation is quite similar to `PredVP`, but with the relative pronoun taking the place of the subject, and being inflected for animacy and number.  The verb agrees in number with the relative pronoun and is always in the third person.

Finally, clauses can be formed using `ExistNP : NP -> Cl`.

    ExistNP np = {s = \\t,a,p => 
		np.s!Gen
		++ (verbStr vekhat_V t a p np.agr)
	} ;

This is for creating sentences such as "Lajaki vekha" -- "There is a warrior". Unusually, the verb "vekhat" assigns genitive case to the subject of the sentence. Apart from that, we again use `verbStr` to conjugate the verb "vekhat" (`vekhat_V` is defined in module `ExtraDot`).



### 2.5 Examples



## 3 Discussion

To conclude our project documentation, we will now discuss problems and limitations as well as briefly describe future plans before we summarize the project in its current state and our experience while working on it.
 
### 3.1 Limitations
(Warum nicht alles auf einmal? Zu viel Arbeit, alles gleichzeitig, keine Möglichkeit zu testen, ….)

For the implementation of a resource grammar, a good grammar source is needed (Grammatical Framework, 2016b). Although the full resource grammar for the Dothraki language is not yet complete, it is becoming harder and harder to find reliable resources regarding further aspects of grammar we would like to implement (e.g. usage of structural words). As it is a constructed language, and relatively new, we hope that further and more precise information will be documented and published with time. 
Yet, even if we had all the information needed for a full implementation, it would not have been possible for us to write a full resource grammar in such a short amount of time, especially as we are still new to the GF programming language and not experienced when it comes to implementing resource grammars. Hence, we focus on providing a good basis of implemented rules, so that we – and others – can expand the project in the future.

(Incompleteness/overgeneration of GF approach (grammar rules vs. natural language)….)
(Regeln versuchen so viel wie mögl. abzudecken, aber nicht immer möglich, siehe Buch? Zitat?...)

### 3.2 Outlook
Expand grammar to a full resource grammar. Community?

### 3.3 Conclusion


## References 
Brown, R., & Frederking, R. (1995). Applying statistical English language modeling to symbolic machine translation. In Proceedings of the sixth international conference on theoretical and methodological issues in machine translation (TMI-95) (pp. 221-239).

Cognitus Apps (2016). Flamingo Dothraki. Retrieved from https://play.google.com/store/apps/details?id=com.cognitusapps.flamingo.dothraki&hl=de

Fun Translations (2016). Dothraki translator. Retrieved from http://funtranslations.com/dothraki

Détrez, G. & Camilleri, J. J. (2016). Grammatical Framework. GitHub.com. Retrieved from https://github.com/GrammaticalFramework

Google (2016). Google Translate. Retrieved from https://translate.google.com/

Google Groups (2016). Problem with strange metavariables in parsing. Retrieved from https://groups.google.com/d/msg/gf-dev/aRjt_2JfvA0/iTcZbTu5AAAJ)

Grammatical Framework (2016a). Translation with GF: Powered by multilingual grammars. Retrieved from http://www.grammaticalframework.org/demos/translation.html

Grammatical Framework (2016b). GF Resource Grammar Library: Synopsis. Retrieved from http://www.grammaticalframework.org/lib/doc/synopsis.html

Martin, G. R. R. (2016). Bibliography. Retrieved from http://www.georgerrmartin.com/bibliography/

Henkel, M. & Kuckuck, B. (2016). Building a resource grammar for Dothraki. GitHub.com. Retrieved from https://github.com/mahen2/dothraki_gf

Peterson, D. J. (2014). Living Language Dothraki: A Conversational Language Course Based on the Hit Original HBO Series Game of Thrones. New York: Living Language.

Peterson, D. J. (2016a). The Art of Language Invention. Retrieved from http://www.artoflanguageinvention.com/

Peterson, D. J. (2016b). About Dothraki. Retrieved from http://www.dothraki.com/about-dothraki/

Ranta, A. (2009). The GF Resource Grammar Library. Linguistic Issues in Language Technology, 2(2), pp. 1-63.

Ranta, A. (2011a). Grammatical Framework: Programming with Multilingual Grammars. Stanford: CSLI Publications.

Ranta, A. (2011b). Grammatical Framework: Programming with Multilingual Grammars. Slides for the GF book. Retrieved from http://www.grammaticalframework.org/gf-book/gf-book-slides.pdf

Ranta, A. (2015). The Status of the GF Resource Grammar Library. Grammatical Framework. Retrieved from http://www.grammaticalframework.org/lib/doc/status.html

Tongues of Ice and Fire Wiki (2016). Vocabulary. Retrieved from http://wiki.dothraki.org/Vocabulary

Wikipedia (2016). Grammatical Framework. Retrieved from https://en.wikipedia.org/wiki/Grammatical_Framework


