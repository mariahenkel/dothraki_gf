### 1 Introduction
Grammatical Framework (GF) is a functional programming language, created in 1998 (Ranta, 2011) and designed to write (natural) language grammars. As GF is “working from a language-independent representation of meaning” (Wikipedia, 2016) it can be used to generate or parse text in different languages at the same time. One of its functions is to translate between languages. 
Since GF uses a symbolic approach to process and translate language, in most cases its translations are more precise than those of statistical tools we use in everyday life (Brown & Frederking, 1995). For example, the “Google Translate” service (Google, 2016) will produce ungrammatical sentences as soon as the input is too complicated while the GF translator (Grammatical Framework, 2016a) has no problems producing a correct translation (see Table 1) in many cases. 

Table 1

This also means, that GF – other than Google Translate – depends on a large knowledge base of predefined grammar rules to achieve high-quality language processing: Its own standard library, the GF Resource Grammar Library, covers more than 38 different languages (Ranta, 2015) - although many of them are not yet complete - and is still growing. In 2010, it already consisted of more than 500,000 lines of code (Ranta, 2011). 
As Grammatical Framework is an open-source project (Ranta, 2009) and still under development, everyone is invited to use it or even help further develop it. For example, by adding languages to the library, which is the aim of the project described in this paper. 
Our goal is to write a GF resource grammar for the Dothraki language and, eventually, be able to add it to the GF Resource Grammar Library. The work described in this paper is meant to lay a foundation for this goal (see Chapter 2).
Dothraki is a constructed language, developed by the language creator and writer David J. Peterson (Peterson, 2016a). The Dothraki are a fictional race of nomadic horse warriors in the “A Song of Ice and Fire” book series by George R. R. Martin (Martin, 2016). As the series was adapted for television by the television network HBO, the language bits found in Martin’s books had to be extended to a fully functional language (Peterson, 2016b): The Dothraki language. Today, it has a vocabulary of over 3,000 words (Tongues of Ice and Fire Wiki, 2016). We will show a few examples of the Dothraki language grammar in this paper, but more information can be found in the book “Living Language Dothraki” (Peterson, 2014), on Peterson’s blog (2016b) and on the Tongues of Ice and Fire Wiki (2016) among many other sources.
This paper aims to serve as a short documentation and explanation of our project. It will cover the project aim and scope, general information regarding the project as well as its structure and explanations of sample functions and the corresponding Dothraki grammar rules (Chapter 2). We will also discuss problems and limitations and briefly describe future plans before we summarize and evaluate the project in its current state and our experience while working on it (Chapter 3).


### 2 The Project

As mentioned before, the aim of this project is to create a resource grammar for the Dothraki language and add it to the GF Resource Grammar Library, so that other Dothraki fans and/or GF enthusiasts may use it. While there are currently a few Dothraki language learning apps and online translators avaialable (e.g. Cognitus Apps, 2016; Fun Translations, 2016), they are still very limited and lack the quality and range to actually learn the language or provide an accurate translation. By the means of an open-source Dothraki resource grammar, better tools like these or even different projects could be created more easily. 

#### 2.1 About Resource Grammars and the Standard Library

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

#### 2.2 Project Structure and implemented Categories

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


Figure 3 shows the main categories of the GF Resource Grammar Library and the current status of our implementation. The yellow categories have been fully or at least partially implemented in our resource grammar. For the first milestone, we do not aim to implement every single instance of every category. Instead, we want to first implement the most important categories in a proper way, to make later expansion easier. For example, there are 32 different instances of the “mkCl” function for the clause category “Cl” (Grammatical Framework, 2016b). We did not implement all of them in the current version of our resource grammar, but since there are already some “mkCl” functions included, it is easier to add more functions of the same type later on. 

Figure 3: GF resource Grammar Library Categories

With the current implementation status, it is already possible to parse and translate a wide range of phrases. The following example text is fully supported by the current version of the Dothraki resource grammar:

Beispieltext....

#### 2.3 Operating Instructions and Examples
Anleitung... + Output Examples...

#### 2.4 Specifics

Besonderheiten + Dothraki Grammar Explanation...


### 3 Discussion
#### 3.1 Limitations
#### 3.2 Outlook
#### 3.3 Conclusion

### References 
(add *new* references here)

