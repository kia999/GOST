%%
%% This is file `gost2008ns.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gost.dtx  (with options: `bst,modern,natbib,eprint,sort')
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% Maintained by Igor A. Kotelnikov.
%% 
%% Current version: 1.2h, 2016.09.21
%% 
%% Please, send bug report via e-mail:
%%   kia999 at mail dot ru <Igor Kotelnikov>
%% or
%%   polyama at yahoo dot com <Maksym Polyakov>
%% 




%%
%% This bibstyle attempts to format bibliography according to
%% GOST 7.0.5-2008 for bibliographic reference.
%%-------------------------------------------------------------------
%% This is an author-year citation style bibliography.
%% It requires a special package file to function properly
%% such as natbib.sty by Patrick W. Daly.
%% The form of the \bibitem entries is
%%   \bibitem[Jones et al.(1990)]{key}...
%%   \bibitem[Jones et al.(1990)Jones, Baker, and Smith]{key}...
%% where the label part (in brackets) consists of the author names,
%% as they should appear in the citation, with the year in parentheses following.
%% There must be no space before the opening parenthesis!
%% A full list of authors may also follow the year.
%% In natbib.sty, it is possible to define the type of enclosures that is
%% really wanted (brackets or parentheses), but in either case, there must
%% be parentheses in the label.
%% The \cite command functions as follows:
%%   \citet{key}              => Jones et al. (1990)
%%   \citet*{key}             => Jones, Baker, and Smith (1990)
%%   \cite{key}              => (Jones et al., 1990)
%%   \cite*{key}             => (Jones, Baker, and Smith, 1990)
%%   \cite[chap. 2]{key}     => (Jones et al., 1990, chap. 2)
%%   \cite[e.g.][]{key}      => (e.g. Jones et al., 1990)
%%   \cite[e.g.][p. 32]{key} => (e.g. Jones et al., p. 32)
%%   \citeauthor{key}         => Jones et al.
%%   \citeauthor*{key}        => Jones, Baker, and Smith
%%   \citeyear{key}           => 1990
%%---------------------------------------------------------------------

ENTRY
  { address
    annote
    author
    booktitle
    bookauthor
    chapter
    edition
    editor
    compiler
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    eid % new in v1.2c
    publisher
    school
    series
    title
    %medium % new in v1.2; renamed to media.
    media % new in v1.2f
    type
    volume
    year
    language
    langid % new in v1.2c
    booklanguage
    date         % new in v1.2f; not implemented yet...
    pagetotal
    url
    urldate
    isbn
    doi
    eprinttype   % = archivePrefix
    eprintclass  % = primaryClass
    eprint
    % new in v1.2f:
    % appear in biblatex:
    addendum
    holder
    location
    subtitle
    titleaddon
    version
    % Appear in biblatex-gost:
    authorcountry   % ??
    credits         % statement of responsibility, other than provided in Biblatex
    ipc             % Code of the International Patent Classification
    %media          % General material designation NOTE: medium in the above
    requestnumber   % Registration number of the application to the patent document
    publicationdate % Date of publication
    publication     %  and information on the official gazette, which published patent
    prioritydate    % Information about the convention priority: the date of filing of the application,
    prioritynumber  %   number and
    prioritycountry %   country name of convention priority.
    requestdate     % ??
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block
after.dblslash after.slash after.colon after.semicolon }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.dblslash :=
  #5 'after.slash :=
  #6 'after.colon :=
  #7 'after.semicolon :=
}

STRINGS { s t }

STRINGS { curlanguage }

FUNCTION {change.language}
{ booklanguage empty$
    { "" }
    { booklanguage  'curlanguage :=
      "\selectlanguageifdefined{"
      curlanguage *
      "}" *
    }
  if$
}

FUNCTION {output.nonnull}
{
  swap$
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          " \BibDash " write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { output.state after.dblslash =
                { "~//" * change.language * " " * write$ }
                { output.state after.slash =
                    { "~/ " * write$ }
                    { output.state after.colon =
                        { "~: " * write$ }
                        { output.state after.semicolon =
                            { "~; " * write$ }
                        { add.period$ " " * write$ }
                       if$
                        }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.dblslash}
{ output.state before.all =
    'skip$
    { after.dblslash 'output.state := }
  if$
}

FUNCTION {new.slash}
{ output.state before.all =
    'skip$
    { after.slash 'output.state := }
  if$
}

FUNCTION {new.colon}
{ output.state before.all =
    'skip$
    { after.colon 'output.state := }
  if$
}

FUNCTION {new.semicolon}
{ output.state before.all =
    'skip$
    { after.semicolon 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{ " " * before.all 'output.state :=
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.dblslash.checka}
{ empty$
    'skip$
    'new.dblslash
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\BibEmph{" swap$ * "}" * }
  if$
}

FUNCTION {bracify}
{ duplicate$ empty$
    { pop$ "{}" }
    { "{" swap$ * "}" * }
  if$
}

FUNCTION {enclose.square.brackets}
{
  duplicate$ empty$
    { pop$ "" }
    { "[" swap$ * "]" * }
  if$
}

FUNCTION {enclose.round.brackets}
{
  duplicate$ empty$
    { pop$ "" }
    { "(" swap$ * ")" * }
  if$
}

FUNCTION {space.word}
{ " " swap$ * " " * }

FUNCTION {bbl.edby}    %  { "\bbledby{}" }
{ curlanguage "english" =
   {"Ed.\ by"}
   { curlanguage "ukrainian" =
      {"{\cyr\CYRP\cyrii\cyrd\ \cyrr\cyre\cyrd.}"}
      { curlanguage "russian" =
         {"{\cyr\CYRP\cyro\cyrd\ \cyrr\cyre\cyrd.}"}
         { curlanguage "german" =
            { "ed." }
            {"language is not defined: " language "edby" * * warning$ "Ed.\ by"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.cmplr}
{ curlanguage "english" =
   { "Compiler"}
   { curlanguage "german" =
      { "Hrsg." }
      { curlanguage "ukrainian" =
         {"{\cyr\CYRU\cyrk\cyrl.}"}
         { curlanguage "russian" =
            {"{\cyr\CYRS\cyro\cyrs\cyrt.}"}
            {"language is not defined: " language  "cmplr" * * warning$ "Compiler"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.edition} %  { "\bbledition{}" }
{ curlanguage "english" =
   {"edition"}
   { curlanguage "ukrainian" =
      {"{\cyr\cyrv\cyri\cyrd.}"}
      { curlanguage "russian" =
         {"{\cyr\cyri\cyrz\cyrd.}"}
         { curlanguage "german" =
            {" {aus.}" } %%%% { "Aufl." } ??
            { curlanguage "italian" =
               {"edizione"}
               { curlanguage "french" =
                  {"\'{e}dition"}
                  {"language is not defined: " language  "edition" * * warning$ "edition"}
               if$}
            if$}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.vvolume} %  { "\bblVolume{}" }
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"Volume"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "\CYRT\cyro\cyrm" }
      { curlanguage "german" =
         {"{Band}"} %%%% { "Volumen" }
         {"language is not defined: " language  "vvolume" * * warning$ "Volume"}
      if$}
   if$}
if$}

FUNCTION {bbl.vvol}    %  { "\bblVol{}" }
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"Vol."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"\CYRT."}
      { curlanguage "german" =
         {"{Bd.}"} %%%% { "Vol." }
         {"language is not defined: " language  "vvol" * * warning$ "Vol."}
      if$}
   if$}
if$}

FUNCTION {bbl.iissue}  %  { "\bblIssue{}" }
{ curlanguage "english" =
   {"Issue"}
   { curlanguage "ukrainian" =
      {"\CYRV\cyri\cyrp\cyru\cyrs\cyrk"}
      { curlanguage "russian" =
         {"\CYRV\cyrery\cyrp\cyru\cyrs\cyrk"}
         { curlanguage "german" =
            {"{Heft}"} %%%% { "Ausgabe" }
            {"language is not defined: " language "iissue" * * warning$ "Issue"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.iiss}  %  { "\bblIss{}" }
{ curlanguage "english" =
   {"Iss."}
   { curlanguage "ukrainian" =
      {"\CYRV\cyri\cyrp."}
      { curlanguage "russian" =
         {"\CYRV\cyrery\cyrp."}
         { curlanguage "german" =
            {"{H.}"}
            {"language is not defined: " language "iiss" * * warning$ "Iss."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.of}      %  { "\bblof{}" }
{ curlanguage "english" =
   {"of"}
   { curlanguage "german" =
      { "von" }
      { curlanguage "ukrainian" =
         { "{\cyr\cyrii\cyrz}" }
         { curlanguage "russian" =
            { "{\cyr\cyri\cyrz}" }
            {"language is not defined: " language "of" * * warning$ "of"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.etal}      %  { "\bblof{}" }
{ curlanguage "english" =
   {"et~al."}
   { curlanguage "german" =
      { "u.~a." }
      { curlanguage "ukrainian" =
         {"{\cyr\cyrt\cyra~\cyrii\cyrn.}"}
         { curlanguage "russian" =
            {"{\cyr\cyri~\cyrd\cyrr.}"}
            {"language is not defined: " language  "et~al" * * warning$ "et~al."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.and}      %  { "\bbland{}" }
{ curlanguage "english" =
   {"and"}
   { curlanguage "german" =
      { "und" }
      { curlanguage "ukrainian" =
         {"{\cyrii}"}
         { curlanguage "russian" =
            {"{\cyri}"}
            {"language is not defined: " language  "and" * * warning$ "and"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.nnumber} %  { "\bblNumber{}" }
{ curlanguage "english" =
   {"Number"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "\CYRN\cyro\cyrm\cyre\cyrr" }
      { curlanguage "german" =
         {"{Heft}"} %%% { "Anzahl" }
         {"language is not defined: " language  "nnumber" * * warning$ "Number"}
      if$}
   if$}
if$}

FUNCTION {bbl.number}  %  { "\bblnumber{}" }
{ curlanguage "english" =
   {"number"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{\cyr\cyrn\cyro\cyrm\cyre\cyrr}"}
      { curlanguage "german" =
         {"{Heft}"} %%% { "anzahl" }???
         {"language is not defined: " language  "number" * * warning$ "number"}
      if$}
   if$}
if$}

FUNCTION {bbl.nr}     %   { "\bblno{}" }
{ curlanguage "english" =
   {"no."}
   { curlanguage "italian" =
      { "no" }
      { curlanguage "ukrainian" = curlanguage "russian" = or
         { "{\cyr\textnumero}" }
         { curlanguage "german" =
            {"{H.}"} %%% { "an." }
            {"language is not defined: " language "nr" * * warning$ "no."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.nnr}     %   { "\bblno{}" }
{ curlanguage "english" =
   {"No."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{\cyr\textnumero}" }
      { curlanguage "german" =
         {"{H.}"} %%% { "an." }
         {"language is not defined: " language  "nnr" * * warning$ "No."}
      if$}
   if$}
if$}

FUNCTION {bbl.in}    %    { "\bblin{}" }
{ curlanguage "english" = curlanguage "german" = or
   {"in"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{\cyr\cyrv}" }
      {"language is not defined: " language  "in" * * warning$ "in"}
   if$}
if$}

FUNCTION {bbl.iin}  %     { "\bblIn{}" }
{ curlanguage "english" = curlanguage "german" = or
   {"In"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "\CYRV" }
      {"language is not defined: " language  "iin" * * warning$ "In"}
   if$}
if$}

FUNCTION {bbl.pages}    % { "\bblpp." }
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"p."} %%% {"pp."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{\cyr\cyrs.}"}
      { curlanguage "german" =
         {"S."} %%%% { "s." }
         {"language is not defined: " language  "pages" * * warning$ "p."}
      if$}
   if$}
if$}

FUNCTION {bbl.page}   %   { "\bblp."
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"p."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{\cyr\cyrs.}"}
      { curlanguage "german" =
         {"S."} %%%% { "s." }
         {"language is not defined: " language  "page" * * warning$ "p."}
      if$}
   if$}
if$}

FUNCTION {bbl.ppages}%    { "\bblPp." }
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"P."} %%%% { "Pp." }
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{\cyr\CYRS.}"}
      { curlanguage "german" =
         {"S."}
         {"language is not defined: " language "ppages" * * warning$ "P."}
      if$}
   if$}
if$}

FUNCTION {bbl.ppage}  %   { "\bblP." }
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"P."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{\cyr\CYRS.}"}
      { curlanguage "german" =
         {"S."}
         {"language is not defined: " language  "ppage" * * warning$ "P."}
      if$}
   if$}
if$}

FUNCTION {bbl.url}
{ curlanguage "english" =
   {"Access mode"}
   { curlanguage "ukrainian" =
      { "{\CYRR\cyre\cyrzh\cyri\cyrm\ \cyrd\cyro\cyrs\cyrt\cyru\cyrp\cyru}" }
      { curlanguage "russian" =
         { "{\CYRR\cyre\cyrzh\cyri\cyrm\ \cyrd\cyro\cyrs\cyrt\cyru\cyrp\cyra}" }
         { curlanguage "german" =
            { "{online; abgerufen}" }
            { "language is not defined: " language "urldate" * * warning$ "online; accessed" }
         if$}
      if$}
   if$}
if$}
FUNCTION {bbl.urldate}
{ curlanguage "english" =
   {"online; accessed"}
   { curlanguage "ukrainian" =
      { "{\cyrd\cyra\cyrt\cyra\ \cyrz\cyrv\cyre\cyrr\cyrn\cyre\cyrn\cyrn\cyrya}" }
      { curlanguage "russian" =
         { "{\cyrd\cyra\cyrt\cyra\ \cyro\cyrb\cyrr\cyra\cyrshch\cyre\cyrn\cyri\cyrya}" }
         { curlanguage "german" =
            { "{online; abgerufen}" }
            { "language is not defined: " language "urldate" * * warning$ "online; accessed" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.techreport} % rename to bbl.techreport
{ curlanguage "english" =
   { "Rep." }
   { curlanguage "german" =
      { "Bericht" }
      { curlanguage "russian" =
         { "{\cyr\CYRO\cyrt\cyrch\cyre\cyrt}" }
         { "language is not defined: " language "techrep" * * warning$ "Rep." }
      if$}
   if$}
if$}

FUNCTION {bbl.mthesis}
{ curlanguage "english" =
   { "Master's thesis" }
   { curlanguage "german" =
      { "Diss.~Mag." }
      { curlanguage "russian" =
        { "{\cyr\CYRK\cyrv\cyra\cyrl\cyri\cyrf\cyri\cyrk\cyra\cyrc\cyri"
          "\cyro\cyrn\cyrn\cyra\cyrya\ \cyrr\cyra\cyrb\cyro\cyrt\cyra\ " *
          "\cyrm\cyra\cyrg\cyri\cyrs\cyrt\cyrr\cyra}" * }
         { "language is not defined: " language "mthesis" * * warning$ "Master's thesis" }
      if$}
   if$}
if$}

FUNCTION {bbl.phdthesis}
{ curlanguage "english" =
   { "Ph.\,D. thesis" }
   { curlanguage "german" =
      { "Diss.~Ph.\,D." }
      { curlanguage "russian" =
         { "{\cyr\CYRD\cyri\cyrs\cyrs\ldots\ \cyrk\cyra\cyrn\cyrd\cyri"
           "\cyrd\cyra\cyrt\cyra\ \cyrn\cyra\cyru\cyrk}" * }
         { curlanguage "french" =
           { "Th\`{e}se de doctorat" }
           { "language is not defined: " language "phdthesis" * * warning$ "Ph.\,D. thesis" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.dscithesis}
{ curlanguage "english" =
   { "Dr.\,Sci. dissertation" }
   { curlanguage "german" =
      { "Diss.~Dr." }
      { curlanguage "russian" =
         { "{\cyr\CYRD\cyri\cyrs\cyrs\ldots\ \cyrd\cyro\cyrk\cyrt\cyro"
           "\cyrr\cyra\ \cyrn\cyra\cyru\cyrk}" * }
         { "language is not defined: " language "dscithesis" * * warning$ "Dr.\,Sci. dissertation" }
      if$}
   if$}
if$}

FUNCTION {bbl.nnoaddress}
{ curlanguage "english" =
   { "S.\ l." }
   { curlanguage "russian" =
      { "{\cyr\CYRB.\ \cyrm.}" }
      { "language is not defined: " language "nnoaddress" * * warning$ "S.\ l." }
   if$}
if$}

FUNCTION {bbl.nopublisher}
{ curlanguage "english" =
   { "s.\ n." }
   { curlanguage "russian" =
      { "{\cyr\cyrb.\ \cyri.}" }
      { "language is not defined: " language "nnopublisher" * * warning$ "s.\ n." }
   if$}
if$}

FUNCTION {bbl.nnopublisher}
{ curlanguage "english" =
   { "S.\ n." }
   { curlanguage "russian" =
      { "{\cyr\CYRB.\ \cyri.}" }
      { "language is not defined: " language "nnopublisher" * * warning$ "S.\ n." }
   if$}
if$}

FUNCTION {bbl.media.text}
{ curlanguage "english" =
   { "Text" }
   { curlanguage "russian" = curlanguage "ukrainian" = or
      { "{\cyr\CYRT\cyre\cyrk\cyrs\cyrt}" }
      { "language is not defined: " language "media" * * warning$ "Text" }
   if$}
if$}

FUNCTION {bbl.media.elres}
{ curlanguage "english" =
   { "Electronic resource" }
   { curlanguage "russian" =
      { "{\cyr\CYREREV\cyrl\cyre\cyrk\cyrt\cyrr\cyro\cyrn\cyrn\cyrery\cyrishrt\ \cyrr\cyre\cyrs\cyru\cyrr\cyrs}" }
      { curlanguage "ukrainian" =
        { "{\cyr\CYRE\cyrl\cyre\cyrk\cyrt\cyrr\cyro\cyrn\cyrn\cyri\cyrishrt\ \cyrr\cyre\cyrs\cyru\cyrr\cyrs}" }
        { "language is not defined: " language "media" * * warning$ "Electronic resource" }
      if$}
   if$}
if$}

FUNCTION {bbl.chief}
{ curlanguage "english" =
   { "chief" }
   { curlanguage "russian" =
      { "\cyrr\cyru\cyrk." }
      { curlanguage "ukrainian" =
        { "\cyrr\cyru\cyrk." }
        { "language is not defined: " language "chief" * * warning$ "chief" }
      if$}
   if$}
if$}

FUNCTION {bbl.executor}
{ curlanguage "english" =
   { "Executor" }
   { curlanguage "russian" =
      { "{\cyr\cyri\cyrs\cyrp\cyro\cyrl\cyrn.}" }
      { curlanguage "ukrainian" =
        { "{\cyr\cyrv\cyri\cyrk\cyro\cyrn\cyra\cyrv\cyre\cyrc\cyrsftsn}" }
        { "language is not defined: " language "executor" * * warning$ "executor" }
      if$}
   if$}
if$}

FUNCTION {bbl.media}
{ type$ "online" =
   { bbl.media.elres }
   { bbl.media.text  }
if$}

FUNCTION {bbl.req}
{
  curlanguage "english" =
    { "req." }
    { curlanguage "german" =
      { "ang." }
      { curlanguage "russian" =
        { "{\cyr\cyrz\cyra\cyrya\cyrv\cyrl.}" }
        { "language is not defined: " language "req" * * warning$ "req" }
      if$
      }
    if$
    }
  if$
}

FUNCTION {bbl.publ}
{
  curlanguage "english" =
    { "publ." }
    { curlanguage "german" =
      { "ausg." }
      { curlanguage "russian" =
        { "{\cyr\cyro\cyrp\cyru\cyrb\cyrl.}" }
        { "language is not defined: " language "publication" * * warning$ "publication" }
      if$
      }
    if$
    }
  if$
}

FUNCTION {bbl.priority}
{
  curlanguage "english" =
    { "priority" }
    { curlanguage "german" =
      { "Prioritat" }
      { curlanguage "russian" =
        { "{\cyr\cyrp\cyrr\cyri\cyro\cyrr\cyri\cyrt\cyre\cyrt}" }
        { "language is not defined: " language "priority" * * warning$ "priority" }
      if$
      }
    if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }


FUNCTION {format.names}
{
  's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{~jj}{~f.}" format.name$ 't :=
      nameptr #1 >
        { nameptr #4 =
          numnames #4 > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { t "others" =
          t "~others" =
          or
                { " " * bbl.etal * }
                { ", " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.lab.names}
{ 's :=
  language empty$
    { "english" 'curlanguage := }
    { language  'curlanguage := }
  if$
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    %{ pop$ " et~al." * }
    { pop$ " " bbl.etal * * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            %{ " et~al." * }
            { " " bbl.etal * * }
            %{ " and " * s #2 "{vv~}{ll}" format.name$ * }
            { " " bbl.and " " * * * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.names.rev}
{
  's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      %"{f.}{~vv}{~ll}{, jj}" format.name$ 't :=
      "{ff}{~vv}{~ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        { nameptr #4 =
          numnames #4 > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { t "others" =
          t "~others" =
          or
                { " " * bbl.etal * }
                { ", " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names emphasize}
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            %'key          %% causes lost of year
            { "{}" key * } %% Bug in bibtex8 ??
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}


FUNCTION {format.bookauthors}
{ bookauthor empty$
    { "" }
    { bookauthor format.names}
  if$
}

FUNCTION {format.authors.after}
{ author empty$
    { "" }
    { author format.names.rev}
  if$
}

FUNCTION {format.bookauthors.after}
{ bookauthor empty$
    { "" }
    { bookauthor format.names.rev}% always cuts to 4 persons
  if$
}

FUNCTION {format.editors.after}
{ editor empty$
    { "" }
    { bbl.edby "\ " * editor format.names.rev * }
  if$
}

FUNCTION {format.chief.after}
{ editor empty$
    { "" }
    { bbl.chief "\ " * editor format.names.rev * }
  if$
}

FUNCTION {format.executor.after}
{ author empty$
    { "" }
    { bbl.executor ": " * author format.names.rev * }
  if$
}

FUNCTION {format.compiler.after}
{ compiler empty$
    { "" }
    { bbl.cmplr "\ " * compiler format.names.rev * }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {format.month}
{ month empty$
    { "" }
    { curlanguage "russian" =
        { month "Jan." =
            { "\CYRYA\cyrn\cyrv." }
        { month "Feb." =
            { "\CYRF\cyre\cyrv\cyrr." }
        { month "Mar." =
            { "\CYRM\cyra\cyrr\cyrt" }
        { month "Apr." =
            { "\CYRA\cyrp\cyrr." }
        { month "May" =
            { "\CYRM\cyra\cyrishrt" }
        { month "Jun." =
            { "\CYRI\cyryu\cyrn\cyrsftsn" }
        { month "Jul." =
            { "\CYRI\cyryu\cyrl\cyrsftsn" }
        { month "Aug." =
            { "\CYRA\cyrv\cyrg\." }
        { month "Sep." =
            { "\CYRS\cyre\cyn\cyrt." }
        { month "Oct." =
            { "\CYRO\cyrk\cyrt." }
        { month "Nov." =
            { "\CYRN\cyro\cyrya\cyrb." }
        { month "Dec." =
            { "\CYRD\cyre\cyrk." }
            { month }
            if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}
        { month }
        if$}
    if$
}
FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          format.month
        }
      if$
    }
    { month empty$
        'year
        { year ". \BibDash " format.month * * }
      if$
    }
  if$
  extra.label * % new in v.1.2
}

FUNCTION {output.address.publisher}
{
  address empty$
    'skip$
    { address output
      publisher empty$
        'skip$
        { new.colon }
      if$
    }
  if$
  publisher output
}


FUNCTION {format.full.names}
{'s :=
  language empty$
    { "english" 'curlanguage := }
    { language  'curlanguage := }
  if$
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              numnames #2 >
              curlanguage "english" =
              and
                { "," * }
                'skip$
              if$
              t "others" =
          %t "~others" =
          %or
                %{ " et~al." * }
                { " " bbl.etal * * }
                %{ " and " * t * }
                { " " bbl.and " " * * * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.full
    { type$ "proceedings" =
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "]{" * write$
  cite$ write$
  "}" write$
%%  language empty$
%%    { "english" 'curlanguage := }
%%    {language  'curlanguage := }
%%  if$
  langid empty$
    { language empty$
        { "english" 'curlanguage := }
        { language  'curlanguage := }
      if$
    }
    { langid  'curlanguage := }
  if$
  "\selectlanguageifdefined" curlanguage bracify * write$
  newline$
  ""
  before.all 'output.state :=
}
%%  author.key.label
%%  year parenthesify *
%%  "; lbl:" label * *
%%  "; mfn:"  make.full.names * *

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.iin
  " " * }

FUNCTION {format.btitle}
{ title
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {tie.connect}
 {"~"
  swap$ * *
 }

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.vvol volume tie.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { "there's a number but no series in " cite$ * warning$
              bbl.nnr }
            {
              %new.dblslash
              new.sentence
              series
              bbl.nr
              tie.or.space.connect}
          if$
          number tie.or.space.connect
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}


FUNCTION {convert.edition}
{ edition
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition "l" change.case$ " " * bbl.edition * }
        { convert.edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

%%FUNCTION {format.pages}
%%{ pages empty$
%%    { "" }
%%    { pages multi.page.check
%%        { bbl.ppages pages n.dashify tie.connect }
%%        { bbl.ppage pages tie.connect }
%%      if$
%%    }
%%  if$
%%}
FUNCTION {format.pages}
{ eid empty$
    {
      pages empty$
        { "" }
        { pages multi.page.check
            { bbl.ppages pages n.dashify tie.connect }
            { bbl.ppage pages tie.connect }
          if$
        }
      if$
    }
    { eid multi.page.check
        { bbl.ppages eid n.dashify tie.connect }
        { bbl.ppage eid tie.connect }
      if$
    }
  if$
}

%%FUNCTION {format.pages.page}
%%{ pages empty$
%%    { pagetotal empty$
%%      { "" }
%%      { pagetotal bbl.pages tie.connect }
%%    if$}
%%    { format.pages}
%%  if$
%%}
FUNCTION {format.pages.page}
{ eid empty$
    { pages empty$
        { pagetotal empty$
            { "" }
            { pagetotal bbl.pages tie.connect }
          if$
        }
        { format.pages}
      if$
    }
    { format.pages }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    {
      ", no." number tie.or.space.connect *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ": " * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.volume}
{ volume empty$
    { "" }
    { bbl.vvol volume tie.or.space.connect }
  if$
}

FUNCTION {format.number}
{ number empty$
    { "" }
    { bbl.nr number tie.or.space.connect }
  if$
}


FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

%%<!utf8>    { "t" change.case$ }
%%<utf8>    { "" }

FUNCTION {format.techreport.type}
{ type empty$
   { bbl.techreport }
   'type
  if$
}

FUNCTION {author.before}
{
  author empty$
    'skip$
    {author num.names$ #4 <
      {format.authors output
       new.sentence}
      'skip$
    if$}
  if$
}

%%<*!long>
%%FUNCTION {bookauthor.before}
%%{
%%  bookauthor empty$
%%    'skip$
%%    {bookauthor num.names$ #4 <
%%      {format.bookauthors output
%%       new.sentence}
%%      'skip$
%%    if$}
%%  if$
%%}
%%</!long>
%%<*long>
%%FUNCTION {bookauthor.before}
%%{
%%  bookauthor empty$
%%    'skip$
%%    { format.bookauthors output
%%      new.sentence
%%    }
%%  if$
%%}
%%</long>

FUNCTION {author.after}
{
  author empty$
    'skip$
    {author num.names$ #3 >
      {format.authors.after output
       new.semicolon }
      'skip$
    if$}
  if$
}

FUNCTION {bookauthor.after}
{
  bookauthor empty$
    'skip$
    {format.bookauthors.after output
       new.semicolon }
  if$
}

FUNCTION {editor.organization.after}
{
  compiler empty$
    {}
    { format.compiler.after  output
    new.semicolon
    }
  if$
  editor empty$
    {}
    { format.editors.after  output
    new.semicolon
    }
  if$
  organization empty$
    {}
    {organization output
    new.semicolon
    }
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    {
      bbl.url ": \BibUrl{" * url * "}" *
      urldate empty$
        { "" }
        { " (" bbl.urldate * ": " * urldate * ")" * }
      if$ *
    }
  if$
}

FUNCTION {output.url}
{
  url empty$
    'skip$
    { format.url output }
  if$
}

FUNCTION {format.annote}
{ annote empty$
    { "" }
{ after.sentence 'output.state :=
  "\BibAnnote{" annote add.period$ * "}" *
}
  if$
}

FUNCTION {format.isbn}
{
  isbn empty$
    { "" }
    { "ISBN:~\href{http://isbndb.com/search-all.html?kw=" isbn *
      "}{" * isbn * "}" *
    }
  if$
}

FUNCTION {add.doi}
{ duplicate$ empty$
    'skip$
    { doi empty$
        'skip$
        { "\href{http://dx.doi.org/" doi * "}{" * swap$ * "}" * }
      if$
    }
  if$
}

FUNCTION {add.media} { }



FUNCTION {format.eprint}
{ eprint empty$
   { "" }
   { eprinttype empty$
       { "" }
       { eprinttype "~: " *}
     if$
     eprintclass empty$
       { }
       { eprintclass * "/" *}
     if$
     url empty$
      { eprint * }
      { "\href{" * url * "}{" * eprint * "}" *}
    if$
   }
  if$
}

FUNCTION {output.eprint.url}
{
  eprint empty$
    { format.url output }
    { format.eprint output }
  if$
}



FUNCTION {add.number}
{ duplicate$ empty$
    { "" }
    { bbl.nr swap$ tie.or.space.connect }
  if$
}

FUNCTION {format.type.number}
{
  type empty$
    { "" }
    {
      number empty$
      { "" }
      { type number tie.or.space.connect }
    if$
    }
  if$
}

FUNCTION {format.requestdate}
{ requestdate empty$
    { "" }
    { bbl.req requestdate tie.or.space.connect }
  if$
}

FUNCTION {format.publicationdate}
{ publicationdate empty$
    { "" }
    { bbl.publ publicationdate tie.or.space.connect }
  if$
}

FUNCTION {format.prioritydate}
{ prioritydate empty$
    { "" }
    { bbl.priority prioritydate tie.or.space.connect }
  if$
}

FUNCTION {article}
{
  output.bibitem
  author.before
  author format.key output
  format.title add.media "title" output.check
  new.slash
  author.after
  new.dblslash
  journal emphasize add.doi "journal" output.check % new in v.2
  new.block
  format.date "year" output.check
  new.block
  format.volume output
  format.number output
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {book}
{
  output.bibitem
  author.before
  author format.key output
  format.btitle add.doi add.media "title" output.check
  new.slash
  author.after
  editor.organization.after
  new.sentence
  format.number.series output
  new.block
  format.edition output
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.bvolume output
  new.block
  format.pages.page output
  new.block
  format.isbn output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {booklet}
{
  output.bibitem
  author.before
  author format.key output
  format.title add.doi add.media "title" output.check
  new.slash
  author.after
  editor.organization.after
  new.block
  howpublished output
  address output
  format.date "year" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {inbook}
{
  output.bibitem
  author.before
  author format.key output
  format.btitle add.doi add.media "title" output.check
  new.slash
  author.after
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  bookauthor.after
  editor.organization.after
  new.block
  format.edition output
  new.block
  format.number.series output
  new.sentence
  output.address.publisher
  format.date "year" output.check
  new.block
  format.bvolume output
  new.block
  format.pages.page output
  new.block
  format.isbn output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {incollection}
{
  output.bibitem
  author.before
  author format.key output
  new.sentence
  format.title add.doi add.media "title" output.check
  new.slash
  author.after
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  editor.organization.after
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.bvolume output
  format.number.series output
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {proceedings}
{
  output.bibitem
  editor format.key output
  format.btitle add.doi add.media "title" output.check
  new.slash
  editor.organization.after
  new.block
  format.bvolume output
  format.number.series output
  output.address.publisher
  format.date "year" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  author.before
  author format.key output
  new.sentence
  format.title add.doi add.media "title" output.check
  new.slash
  author.after
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  editor.organization.after
  new.block
  format.bvolume output
  format.number.series output
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  author format.key output
  new.block
  format.btitle add.doi add.media "title" output.check
  author empty$
    { organization empty$
    {
          address new.block.checka
          address output
        }
        'skip$
      if$
    }
    {
      organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {patent}
{
  output.bibitem
  title add.media output.nonnull
  new.colon
  format.type.number output
  add.blank
  location output
  new.colon
  ipc output
  new.slash
  format.authors.after "author" output.check
  add.blank
  authorcountry enclose.round.brackets output.nonnull
  author format.key output
  new.semicolon
  holder output.nonnull
  new.semicolon
  credits output.nonnull
  new.block
  requestnumber add.number output
  new.semicolon
  format.requestdate output
  new.semicolon
  format.publicationdate output
  publication output
  new.semicolon
  format.prioritydate output
  prioritynumber output
  prioritycountry enclose.round.brackets output
  new.block
  note output
  new.sentence
  output.url
  format.annote output
  new.block
  pagetotal output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  title howpublished new.sentence.checkb
  format.title add.media output
  howpublished new.block.checka
  howpublished output
  new.block
  format.date "year" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  author.before
  author format.key output
  format.btitle "title" output.check
  new.slash
  author.after
  editor.organization.after
  new.block
  format.date "year" output.check
  new.block
  note "note" output.check
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {online}
{ output.bibitem
  format.authors output
  author format.key output
  title howpublished new.sentence.checkb
  format.title add.doi add.media "title" output.check
  howpublished new.dblslash.checka
  howpublished output
  editor.organization.after
  new.sentence
  new.block
  output.address.publisher
  format.date output
  new.block
  output.eprint.url
  new.sentence
  note output
  format.annote output
  fin.entry
}

FUNCTION {internet}   {online}
FUNCTION {www}        {online}
FUNCTION {webpage}    {online}
FUNCTION {electronic} {online}
FUNCTION {thesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.sentence
  format.btitle add.doi add.media "title" output.check
  new.colon
  type "type" output.check
  new.colon
  number output
  new.slash
  format.authors.after output
  new.semicolon
  school "school" output.check
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

%%  format.techrep.type.number output.nonnull
%%  format.url output
FUNCTION {report}
{
  output.bibitem
  format.title add.doi add.media "title" output.check
  title format.key output
  new.colon
  type "type" output.check
  new.colon
  number output
  new.slash
  institution "institution" output.check
  new.semicolon
  format.chief.after output % from editor field
  new.semicolon
  format.executor.after output % from author field
  new.block
  address output
  new.colon
  organization output
  format.date "year" output.check
  new.block                % v.2
  format.pages.page output % v.2
  new.sentence % или new.block ?
  output.eprint.url
  new.block
  note output
  format.annote output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.sentence
  format.btitle add.doi add.media "title" output.check
  new.colon
  bbl.phdthesis format.thesis.type output.nonnull
  new.colon
  number output
  new.slash
  format.authors.after output
  new.semicolon
  school "school" output.check
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {masterthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.sentence
  format.btitle add.doi add.media "title" output.check
  new.colon
  bbl.mthesis format.thesis.type output.nonnull
  new.colon
  number output
  new.slash
  format.authors.after output
  new.semicolon
  school "school" output.check
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {dscithesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.sentence
  format.btitle add.doi add.media "title" output.check
  new.colon
  bbl.dscithesis format.thesis.type output.nonnull
  new.colon
  number output
  new.slash
  format.authors.after output
  new.semicolon
  school "school" output.check
  new.block
  output.address.publisher
  format.date "year" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {conference} { inproceedings }

%%  format.url output

FUNCTION {techreport}
{
  output.bibitem
  format.title add.doi add.media "title" output.check
  title format.key output
  new.colon
  format.techreport.type output
  new.colon
  number output
  new.slash
  institution "institution" output.check
  new.semicolon
  format.chief.after output % from editor field
  new.semicolon
  format.executor.after output % from author field
  new.block
  address output
  new.colon
  organization output
  format.date "year" output.check
  new.block                % v.2
  format.pages.page output % v.2
  new.sentence % или new.block ?
  output.eprint.url
  new.block
  note output
  format.annote output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Jan."}
MACRO {feb} {"Feb."}
MACRO {mar} {"Mar."}
MACRO {apr} {"Apr."}
MACRO {may} {"May"}
MACRO {jun} {"Jun."}
MACRO {jul} {"Jul."}
MACRO {aug} {"Aug."}
MACRO {sep} {"Sep."}
MACRO {oct} {"Oct."}
MACRO {nov} {"Nov."}
MACRO {dec} {"Dec."}
MACRO {aa}{"Astron. \& Astrophys."}
MACRO {aasup}{"Astron. \& Astrophys. Suppl. Ser."}
MACRO {aj} {"Astron. J."}
MACRO {aph} {"Acta Phys."}
MACRO {advp} {"Adv. Phys."}
MACRO {ajp} {"Amer. J. Phys."}
MACRO {ajm} {"Amer. J. Math."}
MACRO {amsci} {"Amer. Sci."}
MACRO {anofd} {"Ann. Fluid Dyn."}
MACRO {am} {"Ann. Math."}
MACRO {ap} {"Ann. Phys. (NY)"}
MACRO {adp} {"Ann. Phys. (Leipzig)"}
MACRO {ao} {"Appl. Opt."}
MACRO {apl} {"Appl. Phys. Lett."}
MACRO {app} {"Astroparticle Phys."}
MACRO {apj} {"Astrophys. J."}
MACRO {apjsup} {"Astrophys. J. Suppl."}
MACRO {apss} {"Astrophys. Space Sci."}
MACRO {araa} {"Ann. Rev. Astron. Astrophys."}
MACRO {baas} {"Bull. Amer. Astron. Soc."}
MACRO {baps} {"Bull. Amer. Phys. Soc."}
MACRO {cmp} {"Comm. Math. Phys."}
MACRO {cpam} {"Commun. Pure Appl. Math."}
MACRO {cppcf} {"Comm. Plasma Phys. \& Controlled Fusion"}
MACRO {cpc} {"Comp. Phys. Comm."}
MACRO {cqg} {"Class. Quant. Grav."}
MACRO {cra} {"C. R. Acad. Sci. A"}
MACRO {fed} {"Fusion Eng. \& Design"}
MACRO {ft} {"Fusion Tech."}
MACRO {grg} {"Gen. Relativ. Gravit."}
MACRO {ieeens} {"IEEE Trans. Nucl. Sci."}
MACRO {ieeeps} {"IEEE Trans. Plasma Sci."}
MACRO {ijimw} {"Interntl. J. Infrared \& Millimeter Waves"}
MACRO {ip} {"Infrared Phys."}
MACRO {irp} {"Infrared Phys."}
MACRO {jap} {"J. Appl. Phys."}
MACRO {jasa} {"J. Acoust. Soc. America"}
MACRO {jcp} {"J. Comp. Phys."}
MACRO {jchp} {"J. Chem. Phys."}
MACRO {jetp} {"Sov. Phys.--JETP"}
MACRO {jfe} {"J. Fusion Energy"}
MACRO {jfm} {"J. Fluid Mech."}
MACRO {jmp} {"J. Math. Phys."}
MACRO {jne} {"J. Nucl. Energy"}
MACRO {jnec} {"J. Nucl. Energy, C: Plasma Phys., Accelerators, Thermonucl. Res."}
MACRO {jnm} {"J. Nucl. Mat."}
MACRO {jpc} {"J. Phys. Chem."}
MACRO {jpp} {"J. Plasma Phys."}
MACRO {jpsj} {"J. Phys. Soc. Japan"}
MACRO {jsi} {"J. Sci. Instrum."}
MACRO {jvst} {"J. Vac. Sci. \& Tech."}
MACRO {nat} {"Nature"}
MACRO {nature} {"Nature"}
MACRO {nedf} {"Nucl. Eng. \& Design/Fusion"}
MACRO {nf} {"Nucl. Fusion"}
MACRO {nim} {"Nucl. Inst. \& Meth."}
MACRO {nimpr} {"Nucl. Inst. \& Meth. in Phys. Res."}
MACRO {np} {"Nucl. Phys."}
MACRO {npb} {"Nucl. Phys. B"}
MACRO {nt/f} {"Nucl. Tech./Fusion"}
MACRO {npbpc} {"Nucl. Phys. B (Proc. Suppl.)"}
MACRO {inc} {"Nuovo Cimento"}
MACRO {nc} {"Nuovo Cimento"}
MACRO {pf} {"Phys. Fluids"}
MACRO {pfa} {"Phys. Fluids A: Fluid Dyn."}
MACRO {pfb} {"Phys. Fluids B: Plasma Phys."}
MACRO {pl} {"Phys. Lett."}
MACRO {pla} {"Phys. Lett. A"}
MACRO {plb} {"Phys. Lett. B"}
MACRO {prep} {"Phys. Rep."}
MACRO {pnas} {"Proc. Nat. Acad. Sci. USA"}
MACRO {pp} {"Phys. Plasmas"}
MACRO {pop} {"Phys. Plasmas"}
MACRO {ppcf} {"Plasma Phys. \& Controlled Fusion"}
MACRO {phitrsl} {"Philos. Trans. Roy. Soc. London"}
MACRO {prl} {"Phys. Rev. Lett."}
MACRO {pr} {"Phys. Rev."}
MACRO {physrev} {"Phys. Rev."}
MACRO {pra} {"Phys. Rev. A"}
MACRO {prb} {"Phys. Rev. B"}
MACRO {prc} {"Phys. Rev. C"}
MACRO {prd} {"Phys. Rev. D"}
MACRO {pre} {"Phys. Rev. E"}
MACRO {ps} {"Phys. Scripta"}
MACRO {procrsl} {"Proc. Roy. Soc. London"}
MACRO {rmp} {"Rev. Mod. Phys."}
MACRO {rsi} {"Rev. Sci. Inst."}
MACRO {science} {"Science"}
MACRO {sciam} {"Sci. Am."}
MACRO {sam} {"Stud. Appl. Math."}
MACRO {st} {"Sky and Telesc."}
MACRO {cjp} {"Czech. J. Phys."}
MACRO {el} {"Europhys. Lett."}
MACRO {en} {"Europhys. News"}
MACRO {fujitsustj} {"FUJITSU Sci. Tech. J."}
MACRO {ieeeed} {"IEEE Trans. Electron Devices"}
MACRO {ieeeim} {"IEEE Trans. Instrum. Meas."}
MACRO {ieeejqe} {"IEEE J. Quantum Electron."}
MACRO {ieeem} {"IEEE Trans. Magn."}
MACRO {ieeeptl} {"IEEE Photonic Technol. Lett."}
MACRO {ieeeuffc} {"IEEE Trans. Ultrason., Ferroelect., Freq. Cont."}
MACRO {jem} {"J. Electron. Mater."}
MACRO {jes} {"J. Electrochem. Soc."}
MACRO {jetplett} {"JETP Lett."}
MACRO {jjap} {"Japan. J. Appl. Phys."}
MACRO {jpha} {"J. Phys. A: Math. Gen."}
MACRO {jphb} {"J. Phys. B: At. Mol. Opt. Phys."}
MACRO {jphbold} {"J. Phys. B: At. Mol. Phys."}
MACRO {jphc} {"J. Phys.: Condens. Matter"}
MACRO {jphcold} {"J. Phys. C: Solid State Phys."}
MACRO {jphd} {"J. Phys. D: Appl. Phys."}
MACRO {jvsta} {"J. Vac. Sci. Technol. A"}
MACRO {jvstb} {"J. Vac. Sci. Technol. B"}
MACRO {me} {"Microelectron. Eng."}
MACRO {necrd} {"NEC Res.{\&} Develop."}
MACRO {pa} {"Physica A"}
MACRO {pb} {"Physica B"}
MACRO {pc} {"Physica C"}
MACRO {pd} {"Physica D"}
MACRO {procieee} {"Proc. IEEE"}
MACRO {procspie} {"Proc. SPIE"}
MACRO {pssa} {"Phys. Stat. Sol. A"}
MACRO {pssb} {"Phys. Stat. Sol. B"}
MACRO {rpp} {"Rep. Progr. Phys."}
MACRO {sm} {"Synthet. Metal"}
MACRO {sost} {"Solid State Technol."}
MACRO {ss} {"Surf. Sci."}
MACRO {ssc} {"Solid State Commun."}
MACRO {sst} {"Semicond. Sci. Technol."}
MACRO {suplatt} {"Superlatt. Microstr."}
MACRO {sust} {"Supercond. Sci. Technol."}
MACRO {znat} {"Z. Naturforsch."}
MACRO {appopt} {"Appl. Opt."}
MACRO {bell}   {"Bell Syst. Tech. J."}
MACRO {ell}    {"Electron. Lett."}
MACRO {jasp}   {"J. Appl. Spectr."}
MACRO {jqe}    {"IEEE J. Quantum Electron."}
MACRO {jlwt}   {"J. Lightwave Technol."}
MACRO {jmo}    {"J. Mod. Opt."}
MACRO {josa}   {"J. Opt. Soc. America"}
MACRO {josaa}  {"J. Opt. Soc. Amer.~A"}
MACRO {josab}  {"J. Opt. Soc. Amer.~B"}
MACRO {jdp}    {"J. Phys. (Paris)"}
MACRO {oc}     {"Opt. Commun."}
MACRO {ol}     {"Opt. Lett."}
MACRO {os}     {"Opt. Spectrosc."}
MACRO {phtl}   {"IEEE Photon. Technol. Lett."}
MACRO {pspie}  {"Proc. Soc. Photo-Opt. Instrum. Eng."}
MACRO {vr}     {"Vision Res."}
MACRO {zph}    {"Z. f. Physik"}
MACRO {zphb}   {"Z. f. Physik~B"}
MACRO {zphd}   {"Z. f. Physik~D"}
MACRO {sse} {"Solid-State Electron."}
MACRO {pss} {"Phys. Sol. State"}
MACRO {nl}  {"Nano Lett."}
MACRO {sjpp} {"Sov. J. Plasma Phys."}
MACRO {spd}  {"Sov. Phys.--Doklady"}
MACRO {sptp} {"Sov. Phys.--Tech. Phys."}
MACRO       {spu}  {"Sov. Phys.--Uspekhi"}
MACRO {ufn}  {"\CYRU\CYRF\CYRN"}
MACRO {pu}  {"Phys.--Uspekhi"}
MACRO {sjot} {"Sov. J. Opt. Technol."}
MACRO {sjqe} {"Sov. J. Quantum Electron."}
MACRO {sleb} {"Sov. Phys.--Leb. Inst. Rep."}
MACRO {stph} {"Sov. Phys.--Techn. Phys."}
MACRO {stphl}{"Sov. Techn. Phys. Lett."}

READ


FUNCTION {sortify}
{ purify$
  "l" change.case$
}

%% =====================================
%% This version from old Gost package
%%<*!natbib>
FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr
      "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
        %{ bbl.etal * }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
%%</!natbib>
%% This version from plainnat.bst
%% It ignores second and subsequent authors but include year.
%%<*natbib>
%%</natbib>
%% =====================================

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word % Removes "The " if any
    chop.word               % Removes "An " if any
  chop.word                 % Removes "A " if any
  sortify
  #1 global.max$ substring$
}

%% =====================================
%% This version from old gost package.
%%
%% This version from plainnat.bst
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}
%% =====================================

FUNCTION {author.title.sort}
{ author empty$
    { title empty$
        { key empty$
            { "to sort, need author, title, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { title sort.format.title }
      if$
    }
    {
      author num.names$ #4 <
        {author sort.format.names }
        {title sort.format.title}
      if$
     }
  if$
}
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}%#2
{ calc.label
  label sortify
  %author.title.sort
  "    "
  *
  % ========= plainnat.bst =========
  author.title.sort
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  %cite$
  title field.or.null sort.format.title
  *
  #1 entry.max$ substring$
  'sort.label :=
  sort.label *
  % ================================
  #1 entry.max$ substring$
  'sort.key$ :=
}


ITERATE {presort}

SORT


STRINGS { longest.label last.label next.extra }

INTEGERS { number.label longest.label.width last.extra.num  }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

EXECUTE {initialize.longest.label}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

ITERATE {forward.pass}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{ "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
  "\def\selectlanguageifdefined#1{"                  write$ newline$
  "\expandafter\ifx\csname date#1\endcsname\relax"   write$ newline$
  "\else\selectlanguage{#1}\fi}"                     write$ newline$
  "\providecommand*{\href}[2]{{\small #2}}"          write$ newline$
  "\providecommand*{\url}[1]{{\small #1}}"           write$ newline$
  "\providecommand*{\BibUrl}[1]{\url{#1}}"           write$ newline$
  "\providecommand{\BibAnnote}[1]{}"                 write$ newline$
  "\providecommand*{\BibEmph}[1]{#1}"                write$ newline$
  %"\ProvideTextCommandDefault{\cyrdash}{---}" write$ newline$
  %\DeclareUTFcharacter[\UTFencname]{x2014}{\cyrdash}
  %"\let\cyrdash\textemdash" write$ newline$
  %"\ProvideTextCommandDefault{\cyrdash}{\hbox to.8em{--\hss--}}" write$ newline$
  %"\ProvideTextCommandDefault{\cyrdash}{\textemdash}" write$ newline$
  "\ProvideTextCommandDefault{\cyrdash}{\iflanguage{russian}{\hbox to.8em{--\hss--}}{\textemdash}}" write$ newline$
  %%"\ProvideTextCommandDefault{\cyrdash}{%"  write$ newline$
  %%"  \iflanguage{russian}{\hbox to.8em{--\hss--}}{%" write$ newline$
  %%"    \iflanguage{ukrainian}{\hbox to.8em{--\hss--}}{\textemdash}}}"  write$ newline$
  "\providecommand*{\BibDash}{\ifdim\lastskip>0pt\unskip\nobreak\hskip.2em plus 0.1em\fi" write$ newline$
  "\cyrdash\hskip.2em plus 0.1em\ignorespaces}" write$ newline$
  "\renewcommand{\newblock}{\ignorespaces}" write$ newline$
  "\providecommand{\natexlab}[1]{#1}" write$ newline$
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

%%
%% End of file `gost2008ns.bst'.
