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

As mentioned before, the aim of this project is to create a resource grammar for the Dothraki language and add it to the GF Resource Grammar Library, so that other Dothraki fans and/or GF enthusiasts may use it. While there are currently a few Dothraki language learning apps or online translators avaialable (e.g. Cognitus Apps, 2016; Fun Translations, 2016), they are still very limited and lack the quality and range to actually learn the language or supply an accurate translation. By the means of an open-source Dothraki resource grammar, better tools like these or even other projects could be created. 

#### 2.1 About Resource Grammars and the Standard Library
The GF Resource Grammar Library 
Here, the idea is to predefine "program details, which require expert knowledge, and make them available for non-expert application programmers" (Ranta, 2009). 
#### 2.2 Aim, Scope and ....
#### 2.3 Program Structure and Functions
#### 2.4 Examples

### 3 Discussion
#### 3.1 Limitations
#### 3.2 Outlook
#### 3.3 Conclusion

### References 
(add *new* references here)
