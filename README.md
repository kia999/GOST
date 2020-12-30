# GOST
BibTEX support for GOST standard bibliographies
-------------------------------------------------------------------
GOST is a bundle of BibTEX styles to format references according to
the State Standards on information, librarianship and publishing
(GOST) issued by The Russian Federation and Interstate Committee
of former USSR States.

Current version is 1.2k, 2020.12.25.

Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

E-mail: kia999@mail.ru
-------------------------------------------------------------------
The System of State Standards includes:
```
GOST 7.80 -2000  Bibliographic record.
                 Heading. General requirements and rules.
GOST 7.83 -2001  Electronic editions. Basic types and imprint.
GOST 7.1  -2003  Bibliographic record.
                 Bibliographic description.
                 General requirements and rules.
GOST 7.11 -2004  Bibliographic description and references.
                 Rules for the abbreviation of words and word
                 combinations in foreign European languages.
GOST 7.0.5-2008  Bibliographic reference.
                 General requirements and rules of making.
```
Etc.

Currently, GOST contains 16 BibTeX styles to format bibliography in English,
Russian and Ukrainian according to GOST 7.0.5-2008 and GOST 7.1-2003. Both
8-bit and Unicode (UTF-8) versions of each BibTeX style, in each case
offering a choice of sorted and unsorted.

All styles in the GOST bundle are derived from single master file
`gost.dtx` by applying different set of options as shown in the table below.

 Style         | utf8 | strict | eprint | long | sort | natbib
:--------------|:----:|:------:|:------:|:----:|:----:|:------:
 gost2003      |      |   +    |    +   |      |      |
 gost2003s     |      |   +    |    +   |      |   +  |
 gost2008      |      |        |    +   |      |      |
 gost2008n     |      |        |    +   |      |      |   +
 gost2008l     |      |        |    +   |   +  |      |
 gost2008s     |      |        |    +   |      |   +  |
 gost2008ns    |      |        |    +   |      |   +  |   +
 gost2008ls    |      |        |    +   |   +  |   +  |
 ugost2003     |  +   |   +    |    +   |      |      |
 ugost2003s    |  +   |   +    |    +   |      |   +  |
 ugost2008     |  +   |        |    +   |      |      |
 ugost2008n    |  +   |        |    +   |      |      |   +
 ugost2008l    |  +   |        |    +   |   +  |      |
 ugost2008s    |  +   |        |    +   |      |   +  |
 ugost2008ns   |  +   |        |    +   |      |   +  |   +
 ugost2008ls   |  +   |        |    +   |   +  |   +  |
 **Style**   |**utf8**|**strict**|**eprint**|**long**|**sort**|**natbib**

`Gost2008` style is recommended for most applications. It corresponds to the
currently effective Standard 7.0.5-2008. Librarians should use the style
`gost2003` instead of `gost2008` to compile a library catalog to meet the
Standard 7.1-2003. Use of other styles is best explained through
the meaning of options used to compile those styles from the master source.

The `strict` option provides conformance to the Standard 7.1-2003. The
bibstyles compiled with that option bear the name `gost2003` with possible
suffixes `s`, `l`, `n` as explained below. These styles are intended
primarily for the librarians who compose a library catalog.

The bibstyles compiled without `strict` option meets the Standard 7.0.5-2008
which can be thought off as a relaxed version of the Standards 7.1-2003. These
bibstyles bear the name `gost2008` with possible suffixes `s`, `l`, `n`.

If the number of authors exceeds 4, modern styles cut the list of authors
to at most 4 persons as prescibed by the Standards. Option
`long` overrides this rule to provide backward compatibility with the
package disser by Stanislab Kruchinin. Two styles, `gost2008l` and
`gost2008ls`, compiled with the option `long` mimic behavior of the styles
`gost705` and `gost705s` from the disser package. Major
effect of the `long` option is that the list of authors always
precedes book or article title no matter how long is it.
Modern styles compiled without `long` place long list of authors behind
the title. The names of styles compiled with the option `long` has the
suffix `l`. Recall that those styles do not conform effective Standards and
their use is discouraged.

The `eprint` option enables formatting electronic publications. In particular,
it enables `eprint`, `eprinttype`, `eprintclass`, and `doi` fields for a
bibliographic entry. The styles generated without the `eprint` option,
ignore the these fields. Starting from the
version 1.2 of the GOST package, all modern styles are compiled with this
option included, and the suffix `e` which designated
this option in earlier  versions is not appended to the name of style
any more.

The `natbib` option provides compatibility with the `natbib` package. The names
of styles compiled with the option `natbib` bear the suffix `n`. Currently
4 styles with that option are available for beta testing.

The `sort` option enables sorting bibliographic references by author names
and references titles. The names of styles compiled with the option `sort`
bear the suffix `s`.

Finally, the `utf8` option produces bibliographic styles in unicode rather
that in 8-bit encoding. Names of those styles bear the prefix `u`.

Beyond bibliographic style, GOST bundle contains CS files (codepage and
sorting order).

Encoding         |   CSF                |Sorting order
-----------------|----------------------|-----------------------
 cp866           |   ruscii.csf         |Cyrillic first, Latin
 cp1251          |   cp1251.csf         |Cyrillic first, Latin
 koi8-u          |   koi8u.csf          |Cyrillic first, Latin
 utf8            |   utf8cyrillic.csf   |Cyrillic first, Latin

In addition, BibTeX8 distribution comes with few more CSFs.

 Encoding        |   CSF                |Sorting order
-----------------|----------------------|-----------------------
 cp866           |   cp866rus.csf       |Latin first, Cyrillic

## How to use

1. Select bibliography style by adding appropriate `\bibliographystyle`
declaration to your source file \file{<filename>.tex}, e.g.
```tex
\bibliographystyle{gost2008}
\bibliography{database}
```

2. Add the field `language="ukrainian"` or `language="russian"` to the
bibliographic entries in Ukrainian or Russian languages in your
database; English is the default language. German, Italian and
French are partially supported.

3. To compile list of references from your database use `bibtex8.exe`
rather than `bibtex.exe`. Depending on the codepage of your
bibliographic database, indicate one of the CS files
listed above as option to `bibtex8.exe`. Run LaTeX, then run
`bibTeX8` and LaTeX again:
```console
latex <filename>.tex
bibtex8 -B -c <csf_file>.csf <filename>.aux
latex <filename>.tex
```

4. For details on preparing bibliographic database see examples in
`gost*.pdf` and `ugost*.pdf`.

5. `ugost*` styles are primarily intended for use
with unicode compilers (`xelatex` and `lualatex`). They
should be preferred as well when using 8bit compilers
(`latex` and `pdflatex`) if source file is in `utf8` encoding.

6. Neither `bibtex.exe` nor `bibtex8.exe` provides
correct sorting order of unicode text. It means that using
`ugost2008s` or `ugost2008ns` may produce unexpected result
for documents in `utf8` encoding.

7. `Bibtex8` fails to change case of a string if it contains Cyrillic
letter in unicode. Therefore `ugost2008*` styles do not change case of
titles and other parts of bibliographic record while 8-bit styles
do the case change where appropriate.

8. Either `bibtex.exe` or `bibtex8.exe` fail to cut Cyrillic names to
initials. Therefore `ugost2008*` styles do not modify name of
authors.

9. Package `natbib` is required when choosing styles with
suffix `n` in their names.

## Customization

Every GOST style defines few commands to format some parts of a
reference. You can redefine these commands prior to
the `\bibliography{<bibtex_style>}` command. Initial
definitions are listed below.
```tex
\providecommand*{\url}[1]{{\small #1}}
\providecommand*{\BibUrl}[1]{\url{#1}}
\providecommand{\BibAnnote}[1]{}
\providecommand*{\BibEmph}[1]{#1}
```

By default, gost styles separate logical parts of a bibliography
record by a period and cyrdash (`. "---`). It is legitimate to drop
that dash by overriding the command `\BibDash` as follows
```tex
\providecommand*{\BibDash}{}
```

By default, `\BibDash` is equivalent to the shorthand `"---`
defined by the babel package with the option `russian`.
It prints a so called Cyrillic dash (`\cyrdash`),
which is 20 % shorter then ordinary LaTeX dash (`---`), and puts
unbreakable space before `\cyrdash` so that dash never appears
in the beginning of a line.

## Where to get from

1. [http://ctan.org/pkg/gost](http://ctan.org/pkg/gost).

2. [http://github.com/kia999/gost](http://github.com/kia999/gost)

Run
```pdflatex.exe gost.ins```
   to produce .bst styles. You might need to install LH or cm-super fonts.

Run
```pdllatex.exe gost.dtx
makeindex -r -s gind.ist gost
makeindex -r -s gglo.ist -o gost.gls gost.glo
pdflatex gost.dtx
pdflatex gost.dtx
```
to produce .bst styles and documentation.

## Version history

### Version 1.2k (2020.12.25)
1. All stuff is now generated from `gost.dtx`.

2. Limited support of the `date` field added.

3. Formatting of `doi` field updated: `http://dx.doi.org` changed
to `https://doi.org`.

4. Documentation and examples update (thanks to Leonid Sinev).

5. Formatting of @inproceedings and @proceedings improved.


### Version 1.2i (2017.01.12)

1. Documentation and examples update (thanks to Leonid Sinev).

2. Restored `@MastersThesis` instead of `@MasterThesis` (thanks to Leonid Sinev).

3. `media="eresource"` is introduced in addition to `media="online"` and
`media="text"`; if present, the `media` field is not ignored any more in
modern bst-styles compiled without the `strict` option.

4. `location` field is introduced as an alias of `address` field.

5. `@DSCISTHESIS` entry renamed to `@DOCTHESIS`.

6. `school` field in `@THESIS` and similar entries is replaced by
`institution` to comply with `biblatex-gost` style.

7. `specialitycode` is added for `@THESIS` and similar entries;
   number is treated as alias of specialitycode.

8. `type` field in `@THESIS` and similar entries can now accept three values
   (`mathesis`, `phdthesis`, `docthesis`) which are translated to built-in
   language-sensitive strings; any other value is reproduced literally.

### Version 1.2h (2016.08.21)

1. Minor changes in documentation.

### Version 1.2g (2016.07.25)

1. Minor changes in documentation.

### Version 1.2f (2016.07.11)

1. Support for `@patent` entry added (thanks to Stanislav Kruchinin).
2. medium field renamed to media field.

### Version 1.2e (2016.07.07)

1. Hard coded "URL" string replaced with a language sensitive string
   (thanks to Roman Budnyi).

### Version 1.2d (2016.02.18)

1. jan, feb, mar, e.t.c. month macros fixed;
2. New macro format.month.
3. \cyrdash is now faked via \ProvideTextCommandDefault if not defined.

### Version 1.2c (2015.01.10)

1. langid field added; language field supported for backward compatibility.
2. eid field added, it has priority over pages field;
3. Fix Gost2003: "--- replaced by \BibDash;
4. Spacing around \BibDash improved.

### Version 1.2b (2014.01.19)

1. numpages renamed to pagetotal.

### Version 1.2a (2012.08.31)

1. \cyrdash is now defined via \ProvideTextCommand rather than \providecommand.

### Version 1.2 (2012.02.22)

1. Code refactoring. All styles are now generated from single source file.
2. Support for GOST-7.1-2003. The field `medium` is added to reflect type
   of material. For most entry types `medium` defaults to `text`.
3. Support for `natbib` package.
4. All modern styles are now compiled with the `eprint` option.

### Version 1.1 (2012.01.21)

1. Support for GOST 7.0.5-2008 and GOST 7.1-2003 is provided.
2. `@Online` entry is added to format a reference to electronic
   resource on Internet.
3. `@MastersThesis` entry is added to format a reference to master's thesis.
   `@DSciThesis` entry is added to format a reference to doctor of
   sciences thesis.
4. `Urldate`, `eprint`, `eprintclass`, `eprinttype` fields are added.

### Earlier version history

2012.08.31 \cyrdash is now defined via \ProvideTextCommand.
2012.02.22 Support for |natbib| package.
2012.02.02 Adaptation to GOST 7.0.5, electronic publishing.
2005.08.12 First version uploaded to CTAN.
2003.06.06 First public version.

### Older versions

See `gost.pdf`.

### Bug reports

Please, submit feature requests and issue reports via
  [https://github.com/kia999/GOST/issues](https://github.com/kia999/GOST/issues).

Happy BibTeXing!
