%%
%% This is file `ugost2003.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gost.dtx  (with options: `bst,utf8,strict,eprint')
%% -------------------------------------------------------------------
%% This file is a part of GOST package, which is a bundle of BibTEX
%% styles to format bibliographic references according to the State
%% Standards on information, librarianship and publishing (GOST)
%% issued by The Russian Federation and Interstate Committee of former
%% USSR States.
%% 
%% Current version is 1.3, 2017.02.25.
%% 
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% 
%% E-mail: kia999@mail.ru
%% -------------------------------------------------------------------
%% This bibstyle attempts to format bibliography according to
%% GOST 7.1-2003 for bibliographic records.

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
    %major          % new in v.1.2i, alias for speciality, not implemented
    majorcode       % new in v.1.2i, alias for specialitycode
    month
    note
    number
    organization
    pages
    eid             % new in v1.2c
    publisher
    school          % alias for institution
    series
    %speciality     % new in v.1.2i, eqv. to major in biblatex-gost, not implemented yet...
    specialitycode  % new in v.1.2i, alias of number, eqv. to majorcode in biblatex-gost
    title
    %medium         % new in v1.2; renamed to media.
    media           % new in v1.2f
    type
    volume
    year
    language
    langid          % new in v1.2c
    booklanguage
    date            % new in v1.2i
    pagetotal
    url
    urldate
    isbn
    doi
    eprint
    eprinttype      % = archivePrefix
    eprintclass     % = primaryClass
    % new in v1.2f:
    % appear in biblatex:
    %addendum       % not implemented yet...
    holder          % see patent
    location        % new in v.1.2i, alias of address
    %subtitle       % not implemented yet...
    titleaddon      % new in v.1.2i, see @thesis
    %version        % not implemented yet...
    % Appear in biblatex-gost for @patent entry:
    authorcountry   % country of the patent authors
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
  { label }

INTEGERS {
    output.state
    before.all
    mid.sentence
    after.sentence
    after.block
    after.dblslash
    after.slash
    after.colon
    after.semicolon
}

STRINGS { curlanguage }

STRINGS { s t }

STRINGS { y m d }   % new in v.1.2j

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

FUNCTION {set.language}
{ langid empty$
    { language empty$
        { "english" 'curlanguage := }
        { language  'curlanguage := }
      if$
    }
    { langid  'curlanguage := }
  if$
}

FUNCTION {reset.language}
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
                { "~//" * reset.language * " " * write$ }
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
    { pop$
      "empty " t * " in " * cite$ * warning$
    }
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

%%
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {spaces.around}
{ " " swap$ * " " * }

FUNCTION {emphasize}
{ duplicate$ empty$
    %{ pop$ "" }
    'skip$       % v.1.3
    { "\BibEmph{" swap$ * "}" * }
  if$
}

FUNCTION {bracify}
{ duplicate$ empty$
    { pop$ "{}" }
    { "{" swap$ * "}" * }
  if$
}

FUNCTION {bracketise}
{
  duplicate$ empty$
    { pop$ "" }
    { "[" swap$ * "]" * }
  if$
}

FUNCTION {paranthesify}
{
  duplicate$ empty$
    { pop$ "" }
    { "(" swap$ * ")" * }
  if$
}


FUNCTION {tie.connect}
 {"~" swap$ * *
 }

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

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

FUNCTION {bbl.edby}
{ curlanguage "english" =
   {"Ed.\ by"}
   { curlanguage "ukrainian" =
      {"Під ред."}
      { curlanguage "russian" =
         {"Под ред."}
         { curlanguage "german" =
            { "ed." }
            {"language is not defined: " curlanguage " in bbl.edby" * * warning$ "Ed.\ by"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.compiler}
{ curlanguage "english" =
   { "Compiler"}
   { curlanguage "german" =
      { "Hrsg." }
      { curlanguage "ukrainian" =
         {"{Укл.}"}
         { curlanguage "russian" =
            {"{Сост.}"}
            {"language is not defined: " curlanguage  " in bbl.compiler" * * warning$ "Compiler"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.edition}
{ curlanguage "english" =
   {"edition"}
   { curlanguage "ukrainian" =
      {"{вид.}"}
      { curlanguage "russian" =
         {"{изд.}"}
         { curlanguage "german" =
            {" {aus.}" } %%%% { "Aufl." } ??
            { curlanguage "italian" =
               {"edizione"}
               { curlanguage "french" =
                  {"\'{e}dition"}
                  {"language is not defined: " curlanguage  " in bbl.edition" * * warning$ "edition"}
               if$}
            if$}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.vvolume}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"Volume"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "Том" }
      { curlanguage "german" =
         {"{Band}"} %%%% { "Volumen" }
         {"language is not defined: " curlanguage  " in bbl.vvolume" * * warning$ "Volume"}
      if$}
   if$}
if$}

FUNCTION {bbl.vvol}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"Vol."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"Т."}
      { curlanguage "german" =
         {"{Bd.}"} %%%% { "Vol." }
         {"language is not defined: " curlanguage  " in bbl.vvol" * * warning$ "Vol."}
      if$}
   if$}
if$}

FUNCTION {bbl.iissue}
{ curlanguage "english" =
   {"Issue"}
   { curlanguage "ukrainian" =
      {"Випуск"}
      { curlanguage "russian" =
         {"Выпуск"}
         { curlanguage "german" =
            {"{Heft}"} %%%% { "Ausgabe" }
            {"language is not defined: " curlanguage " in bbl.iissue" * * warning$ "Issue"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.iiss}
{ curlanguage "english" =
   {"Iss."}
   { curlanguage "ukrainian" =
      {"Вип."}
      { curlanguage "russian" =
         {"Вып."}
         { curlanguage "german" =
            {"{H.}"}
            {"language is not defined: " curlanguage " in bbl.iiss" * * warning$ "Iss."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.of}
{ curlanguage "english" =
   {"of"}
   { curlanguage "german" =
      { "von" }
      { curlanguage "ukrainian" =
         { "{із}" }
         { curlanguage "russian" =
            { "{из}" }
            {"language is not defined: " curlanguage " in bbl.of" * * warning$ "of"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.etal}
{ curlanguage "english" =
   {"et~al."}
   { curlanguage "german" =
      { "u.~a." }
      { curlanguage "ukrainian" =
         {"{та~ін.}"}
         { curlanguage "russian" =
            {"и~др."}
            {"language is not defined: " curlanguage  " in bbl.etal" * * warning$ "et~al."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.and}
{ curlanguage "english" =
   {"and"}
   { curlanguage "german" =
      { "und" }
      { curlanguage "ukrainian" =
         {"і"}
         { curlanguage "russian" =
            {"и"}
            {"language is not defined: " curlanguage  " in bbl.and" * * warning$ "and"}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.nnumber}
{ curlanguage "english" =
   {"Number"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{Номер}" }
      { curlanguage "german" =
         {"{Heft}"} %%% { "Anzahl" }
         {"language is not defined: " curlanguage  " in bbl.nnumber" * * warning$ "Number"}
      if$}
   if$}
if$}

FUNCTION {bbl.number}
{ curlanguage "english" =
   {"number"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{номер}"}
      { curlanguage "german" =
         {"{Heft}"} %%% { "anzahl" }???
         {"language is not defined: " curlanguage  " in bbl.number" * * warning$ "number"}
      if$}
   if$}
if$}

FUNCTION {bbl.nr}
{ curlanguage "english" =
   {"no."}
   { curlanguage "italian" =
      { "no" }
      { curlanguage "ukrainian" = curlanguage "russian" = or
         { "{№}" }
         { curlanguage "german" =
            {"{H.}"} %%% { "an." }
            {"language is not defined: " curlanguage " in bbl.nr" * * warning$ "no."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.nnr}
{ curlanguage "english" =
   {"No."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{№}" }
      { curlanguage "german" =
         {"{H.}"} %%% { "an." }
         {"language is not defined: " curlanguage  " in bbl.nnr" * * warning$ "No."}
      if$}
   if$}
if$}

FUNCTION {bbl.in}
{ curlanguage "english" = curlanguage "german" = or
   {"in"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{в}" }
      {"language is not defined: " curlanguage  " in bbl.in" * * warning$ "in"}
   if$}
if$}

FUNCTION {bbl.iin}
{ curlanguage "english" = curlanguage "german" = or
   {"In"}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      { "{В}" }
      {"language is not defined: " curlanguage  " in bbl.iin" * * warning$ "In"}
   if$}
if$}

FUNCTION {bbl.pages}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"p."} %%% {"pp."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{с.}"}
      { curlanguage "german" =
         {"S."} %%%% { "s." }
         {"language is not defined: " curlanguage  " in bbl.pages" * * warning$ "p."}
      if$}
   if$}
if$}

FUNCTION {bbl.page}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"p."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{с.}"}
      { curlanguage "german" =
         {"S."} %%%% { "s." }
         {"language is not defined: " curlanguage  " in bbl.page" * * warning$ "p."}
      if$}
   if$}
if$}

FUNCTION {bbl.ppages}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"P."} %%%% { "Pp." }
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{С.}"}
      { curlanguage "german" =
         {"S."}
         {"language is not defined: " curlanguage " in bbl.ppages" * * warning$ "P."}
      if$}
   if$}
if$}

FUNCTION {bbl.ppage}
{ curlanguage "english" = curlanguage "french" = or curlanguage "italian" = or
   {"P."}
   { curlanguage "ukrainian" = curlanguage "russian" = or
      {"{С.}"}
      { curlanguage "german" =
         {"S."}
         {"language is not defined: " curlanguage  " in bbl.ppage" * * warning$ "P."}
      if$}
   if$}
if$}

FUNCTION {bbl.url}
{ curlanguage "english" =
   {"Access mode"}
   { curlanguage "ukrainian" =
      { "{Режим доступу}" }
      { curlanguage "russian" =
         { "{Режим доступа}" }
         { curlanguage "german" =
            { "{online; abgerufen}" }
            { "language is not defined: " curlanguage " in bbl.urldate" * * warning$ "online; accessed" }
         if$}
      if$}
   if$}
if$}
FUNCTION {bbl.urldate}
{ curlanguage "english" =
   {"online; accessed"}
   { curlanguage "ukrainian" =
      { "{дата звернення}" }
      { curlanguage "russian" =
         { "{дата обращения}" }
         { curlanguage "german" =
            { "{online; abgerufen}" }
            { "language is not defined: " curlanguage " in bbl.urldate" * * warning$ "online; accessed" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.techreport}
{ curlanguage "english" =
   { "Rep." }
   { curlanguage "german" =
      { "Bericht" }
      { curlanguage "russian" =
         { "{Отчет}" }
         { "language is not defined: " curlanguage " in bbl.techrep" * * warning$ "Rep." }
      if$}
   if$}
if$}

FUNCTION {bbl.mathesis}
{ curlanguage "english" =
   { "Master's thesis" }
   { curlanguage "german" =
      { "Diss.~Mag." }
      { curlanguage "russian" =
         { "{Квалификационная работа магистра}" }
         { "language is not defined: " curlanguage " in bbl.mthesis" * * warning$ "Master's thesis" }
      if$}
   if$}
if$}

FUNCTION {bbl.phdthesis}
{ curlanguage "english" =
   { "Ph.\,D. thesis" }
   { curlanguage "german" =
      { "Diss.~Ph.\,D." }
      { curlanguage "russian" =
         { "{дис.\ \ldots\ канд. наук}" }
         { curlanguage "french" =
           { "Th\`{e}se de doctorat" }
           { "language is not defined: " curlanguage " in bbl.phdthesis" * * warning$ "Ph.\,D. thesis" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.docthesis}
{ curlanguage "english" =
   { "Dr.\,Sci. dissertation" }
   { curlanguage "german" =
      { "Diss.~Dr." }
      { curlanguage "russian" =
         { "{дис.\ \ldots\ д-ра наук}" }
         { "language is not defined: " curlanguage " in bbl.docthesis" * * warning$ "Dr.\,Sci. dissertation" }
      if$}
   if$}
if$}

FUNCTION {bbl.nnoaddress}
{ curlanguage "english" =
   { "S.\ l." }
   { curlanguage "russian" =
      { "{Б.\ м.}" }
      { "language is not defined: " curlanguage " in bbl.nnoaddress" * * warning$ "S.\ l." }
   if$}
if$}

FUNCTION {bbl.nopublisher}
{ curlanguage "english" =
   { "s.\ n." }
   { curlanguage "russian" =
      { "{б.\ и.}" }
      { "language is not defined: " curlanguage " in bbl.nnopublisher" * * warning$ "s.\ n." }
   if$}
if$}

FUNCTION {bbl.nnopublisher}
{ curlanguage "english" =
   { "S.\ n." }
   { curlanguage "russian" =
      { "{Б.\ и.}" }
      { "language is not defined: " curlanguage " in bbl.nnopublisher" * * warning$ "S.\ n." }
   if$}
if$}

FUNCTION {bbl.media.text}
{ curlanguage "english" =
   { "Text" }
   { curlanguage "russian" = curlanguage "ukrainian" = or
      { "{Текст}" }
      { "language is not defined: " curlanguage " in bbl.media" * * warning$ "Text" }
   if$}
if$}

FUNCTION {bbl.media.eresource}
{ curlanguage "english" =
   { "Electronic resource" }
   { curlanguage "russian" =
      { "{Электронный ресурс}" }
      { curlanguage "ukrainian" =
        { "{Електронний ресурс}" }
        { "language is not defined: " curlanguage " in bbl.media" * * warning$ "Electronic resource" }
      if$}
   if$}
if$}

FUNCTION {bbl.media.online}
{ curlanguage "english" =
   { "Electronic resource online" }
   { curlanguage "russian" =
      { "{Электронный ресурс онлайн}" }
      { curlanguage "ukrainian" =
        { "{Електронний ресурс онлайн}" }
        { "language is not defined: " curlanguage " in bbl.media" * * warning$ "Electronic resource" }
      if$}
   if$}
if$}

FUNCTION {bbl.chief}
{ curlanguage "english" =
   { "chief" }
   { curlanguage "russian" =
      { "{рук.}" }
      { curlanguage "ukrainian" =
        { "{рук.}" }
        { "language is not defined: " curlanguage " in bbl.chief" * * warning$ "chief" }
      if$}
   if$}
if$}

FUNCTION {bbl.executor}
{ curlanguage "english" =
   { "Executor" }
   { curlanguage "russian" =
      { "{исполн.}" }
      { curlanguage "ukrainian" =
        { "{виконавець}" }
        { "language is not defined: " curlanguage " in bbl.executor" * * warning$ "executor" }
      if$}
   if$}
if$}

FUNCTION {bbl.media}
{ media "online" =
   { bbl.media.online }
   { media "eresource" =
     { bbl.media.eresource }
     { bbl.media.text }
   if$}
if$}

FUNCTION {bbl.req}
{
  curlanguage "english" =
    { "req." }
    { curlanguage "german" =
      { "ang." }
      { curlanguage "russian" =
        { "{заявл.}" }
        { "language is not defined: " curlanguage " in bbl.req" * * warning$ "req" }
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
        { "{опубл.}" }
        { "language is not defined: " curlanguage " in bbl.publication" * * warning$ "publication" }
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
        { "{приоритет}" }
        { "language is not defined: " curlanguage " in bbl.priority" * * warning$ "priority" }
      if$
      }
    if$
    }
  if$
}

FUNCTION {bbl.jan}
{ curlanguage "english" =
   {"Jan."}
   { curlanguage "ukrainian" =
      {"Січ."} % Січень
      { curlanguage "russian" =
         { "Янв." }
         { curlanguage "german" =
            { "Jan." } % Januar
            { "language is not defined: bbl.jan for " curlanguage * warning$ "Jan." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.feb}
{ curlanguage "english" =
   {"Feb."}
   { curlanguage "ukrainian" =
      {"Лют."} % Лютий
      { curlanguage "russian" =
         { "Фев." }
         { curlanguage "german" =
            {"Feb."} % Februar
            {"language is not defined: bbl.feb for " curlanguage * warning$ "Feb."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.mar}
{ curlanguage "english" =
   {"Mar."}
   { curlanguage "ukrainian" =
      {"Бер."} % Березень
      { curlanguage "russian" =
            { "Март" }
         { curlanguage "german" =
            {"März"} % März
            {"language is not defined: bbl.mar for " curlanguage * warning$ "Mar."}
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.apr}
{ curlanguage "english" =
   {"Apr."}
   { curlanguage "ukrainian" =
      {"Квіт."} % квітень
      { curlanguage "russian" =
            { "Апр." }
         { curlanguage "german" =
            {"Apr."} % April
            { "language is not defined: bbl.apr for " curlanguage * warning$ "Apr." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.may}
{ curlanguage "english" =
   {"May"}
   { curlanguage "ukrainian" =
      {"Трав."} % травень
      { curlanguage "russian" =
            { "Май" }
         { curlanguage "german" =
            {"Mai"}
            { "language is not defined: bbl.may for " curlanguage * warning$ "May" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.jun}
{ curlanguage "english" =
   {"June"}
   { curlanguage "ukrainian" =
      {"Чер."} % червень
      { curlanguage "russian" =
            { "Июнь" }
         { curlanguage "german" =
            {"Juni"}
            { "language is not defined: bbl.jun for " curlanguage * warning$ "June" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.jul}
{ curlanguage "english" =
   {"July"}
   { curlanguage "ukrainian" =
      {"Липень"} %Липень
      { curlanguage "russian" =
            { "Июль" }
         { curlanguage "german" =
            {"Juli"}
            { "language is not defined: bbl.jul for " curlanguage * warning$ "July" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.aug}
{ curlanguage "english" =
   {"Aug."}
   { curlanguage "ukrainian" =
      {"Серпень"} % Серпень
      { curlanguage "russian" =
            { "Авг." }
         { curlanguage "german" =
            {"Aug."} % August
            { "language is not defined: bbl.aug for " curlanguage * warning$ "Aug." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.sep}
{ curlanguage "english" =
   {"Sep."}
   { curlanguage "ukrainian" =
      {"Вер."} % вересень
      { curlanguage "russian" =
            { "Сент." }
         { curlanguage "german" =
            {"Sep."} % September
            { "language is not defined: bbl.sep for " curlanguage * warning$ "Sep." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.oct}
{ curlanguage "english" =
   {"Oct."}
   { curlanguage "ukrainian" =
      {"Жов."} % жовтень
      { curlanguage "russian" =
            { "Окт." }
         { curlanguage "german" =
            {"Okt."} % Oktober
            { "language is not defined: bbl.oct for " curlanguage * warning$ "Oct." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.nov}
{ curlanguage "english" =
   {"Nov."}
   { curlanguage "ukrainian" =
      {"Лис."} % листопад
      { curlanguage "russian" =
            { "Нояб." }
         { curlanguage "german" =
            {"Nov."} % November
            { "language is not defined: bbl.nov for " curlanguage * warning$ "Nov." }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.dec}
{ curlanguage "english" =
   {"Dec."}
   { curlanguage "ukrainian" =
      {"Груд."} % грудень
      { curlanguage "russian" =
            { "Дек." }
         { curlanguage "german" =
            {"Dez."} % Dezember
            { "language is not defined: bbl.dec for " curlanguage * warning$ "Dec." }
         if$}
      if$}
   if$}
if$}
FUNCTION {bbl.arxiv}
{ curlanguage "english" =
   { "ArXiv" }
   { curlanguage "ukrainian" =
      {"ArXiv"}
      { curlanguage "russian" =
         { "ArXiv" }
         { curlanguage "german" =
            { "ArXiv" }
            { "language is not defined: bbl.arxiv for " curlanguage * warning$ "ArXiv" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.jstor}
{ curlanguage "english" =
   { "JSTOR" }
   { curlanguage "ukrainian" =
      {"JSTOR"}
      { curlanguage "russian" =
         { "JSTOR" }
         { curlanguage "german" =
            { "JSTOR" }
            { "language is not defined: bbl.jstor for " curlanguage * warning$ "JSTOR" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.pubmed}
{ curlanguage "english" =
   { "PubMed" }
   { curlanguage "ukrainian" =
      {"PubMed"}
      { curlanguage "russian" =
         { "PubMed" }
         { curlanguage "german" =
            { "PubMed" }
            { "language is not defined: bbl.pubmed for " curlanguage * warning$ "PubMed" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.googlebooks}
{ curlanguage "english" =
   { "Google Books" }
   { curlanguage "ukrainian" =
      {"Google Книги"}
      { curlanguage "russian" =
         { "Google Книги" }
         { curlanguage "german" =
            { "Google Books" }
            { "language is not defined: bbl.googlebooks for " curlanguage * warning$ "Google Books" }
         if$}
      if$}
   if$}
if$}

FUNCTION {bbl.hdl}
{ curlanguage "english" =
   { "Handle.Net" }
   { curlanguage "ukrainian" =
      {"Handle.Net"}
      { curlanguage "russian" =
         { "Handle.Net" }
         { curlanguage "german" =
            { "Handle.Net" }
            { "language is not defined: bbl.hdl for " curlanguage * warning$ "Handle.Net" }
         if$}
      if$}
   if$}
if$}
FUNCTION {address.or.location}
{
  address empty$
    { location }
    { address }
  if$
}

FUNCTION {specialitycode.or.number}
{
  specialitycode empty$
    { number }
    { specialitycode }
  if$
}

FUNCTION {institution.or.school}
{
  institution empty$
    { school}
    { institution }
  if$
}
FUNCTION {date.to.year}
{
  date empty$
    { date }
    {
      date text.length$ #3 >
        {
          date #1 #4 substring$ 'y :=
          y
        }
        {
          "wrong format of date in " cite$ * ": date=" * date * warning$
          date
        }
      if$
    }
  if$
}

FUNCTION {date.to.month}
{
  date empty$
    { date }
    {
      date text.length$ #6 >
        {
          date #6 #2 substring$ 'm :=
          m
        }
        {
          "wrong format of date in " cite$ * ": date=" * date * warning$
          date
        }
      if$
    }
  if$
}

FUNCTION {date.to.day}
{
  date empty$
    { date }
    {
      date text.length$ #10 =
        {
          date #9 #2 substring$ 'd :=
          d
        }
        {
          "wrong format of date in " cite$ * ": date=" * date * warning$
          date
        }
      if$
    }
  if$
}

FUNCTION {year.or.date.to.year}
{
  year empty$
    {
      date.to.year
    }
    { year }
  if$
}

FUNCTION {format.month}
{ month empty$
    { "" }
    { month "Jan." =
        { bbl.jan }
    { month "Feb." =
        { bbl.feb }
    { month "Mar." =
        { bbl.mar }
    { month "Apr." =
        { bbl.apr }
    { month "May" =
        { bbl.may }
    { month "Jun." =
        { bbl.jun }
    { month "Jul." =
        { bbl.jul }
    { month "Aug." =
        { bbl.aug }
    { month "Sep." =
        { bbl.sep }
    { month "Oct." =
        { "Окт." }
    { month "Nov." =
        { bbl.nov }
    { month "Dec." =
        { bbl.dec }
        {
          "unknown month in " cite$ * warning$
          month
        }
        if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}if$}
    if$
}
FUNCTION {format.date}
{ year.or.date.to.year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          format.month
        }
      if$
    }
    { month empty$
        'year.or.date.to.year
        { year.or.date.to.year ". \BibDash " format.month * * }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {fmt.names.first}
{ #1
  "{vv~}{ll}{~jj}{,~ff}"
  format.name$
}

FUNCTION {fmt.names.three}
{
  's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
  { s nameptr
      "{vv~}{ll}{~jj}{,~ff}"
    format.name$ 't :=
    nameptr #1 >
      { nameptr #4 = numnames #4 > and
          { "others" 't :=
            #1 'namesleft :=
          }
          'skip$
        if$
        namesleft #1 >
          { ", " * t * }
          { t "others" = t "~others" = or
              { " " * bbl.etal bracketise *}
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

FUNCTION {fmt.names.all}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      %"{vv~}{ll}" format.name$ 't :=
      "{vv~}{ll}{~jj}{,~ff}"
      format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #2 >  curlanguage "english" = and
                { "," * }
                'skip$
              if$
              t "others" = t "~others" = or
                { " " * bbl.etal bracketise *}
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

%%<long>    { author fmt.names.all emphasize}
%%<!long&strict>    { author fmt.names.first emphasize}
%%<!long&!strict>    { author fmt.names.three emphasize}
FUNCTION {format.author}
{
  author empty$
    { author } %%%'skip$
    {author num.names$ #4 <
      {
       author fmt.names.first
      }
      { "" } %%%'skip$
    if$}
  if$
}

FUNCTION {format.bookauthors.rest}
{ bookauthor empty$
    { "" }
    { bookauthor fmt.names.three emphasize }
  if$
}

FUNCTION {format.editors.rest}
{ editor empty$
    { "" }
    { bbl.edby "\ " * editor fmt.names.three * }
  if$
}

FUNCTION {format.chief.rest}
{ editor empty$
    { "" }
    { bbl.chief "\ " * editor fmt.names.three * }
  if$
}

FUNCTION {format.executor.rest}
{ author empty$
    { "" }
    { bbl.executor ": " * author fmt.names.three * }
  if$
}

FUNCTION {format.compiler.rest}
{ compiler empty$
    { "" }
    { bbl.compiler "\ " * compiler fmt.names.three * }
  if$
}

FUNCTION {output.address.publisher}
{
  address empty$
    {
      bbl.nnoaddress
      publisher empty$
        { "~: " * bbl.nopublisher * bracketise }
        { bracketise "~: " * publisher * }
      if$
    }
    {
      address output
      new.colon
      publisher empty$
        { bbl.nopublisher bracketise }
        { publisher }
      if$
    }
  if$
  output
}

FUNCTION {output.bibitem}
{
  set.language
  newline$
  "\bibitem" write$
  cite$ bracify write$
  newline$
  "\selectlanguageifdefined" curlanguage bracify * write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.vvol volume tie.connect
      series empty$
        'skip$
        { bbl.of spaces.around * series emphasize * }
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


FUNCTION {convert.edition}
{ edition
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition " " * bbl.edition * }
        { convert.edition " " * bbl.edition * }
      if$
    }
  if$
}

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

FUNCTION {bbl.thesis.type}
{ type "mathesis" =
  { bbl.mathesis }
  { type "phdthesis" =
    { bbl.phdthesis }
    { type "docthesis" =
      { bbl.docthesis }
      %%{ "!!!" type * "t" change.case$ }
      { type }
    if$}
  if$}
if$}

%%<!utf8>      bbl.thesis.type "t" change.case$
%%<utf8>      bbl.thesis.type
FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      bbl.thesis.type
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

FUNCTION {output.author.head}
{
  author empty$
    'skip$
    {author num.names$ #4 <
      {
       author fmt.names.first output
       new.sentence
      }
      'skip$
    if$}
  if$
}

FUNCTION {output.author.rest}
{
  author empty$
    'skip$
    {author num.names$ #1 >
      { author fmt.names.all output
        new.semicolon
      }
      'skip$
    if$}
  if$
}

FUNCTION {bookauthor.rest}
{
  bookauthor empty$
    'skip$
    {
      bookauthor fmt.names.all output
      new.semicolon
    }
  if$
}

FUNCTION {editor.organization.rest}
{
  compiler empty$
    {}
    { format.compiler.rest  output
    new.semicolon
    }
  if$
  editor empty$
    {}
    { format.editors.rest  output.nonnull
    new.semicolon
    }
  if$
  organization empty$
    {}
    {organization output.nonnull
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
        { "\href{https://doi.org/" doi * "}{" * swap$ * "}" * }
      if$
    }
  if$
}

FUNCTION {add.media}
{ duplicate$ empty$
    'skip$
    { media empty$
      { type$ "online" =
          { " " * bbl.media.online bracketise * }
          { " " * bbl.media.text   bracketise * }
        if$
      }
      { " " * bbl.media bracketise * }
    if$
    }
  if$
}



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
  output.author.head
  %new.sentence
  title add.media "title" output.check
  new.slash
  output.author.rest
  new.dblslash
  journal emphasize add.doi "journal" output.check % new in v1.2
  new.block
  format.date "year/date" output.check
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
  output.author.head
  new.sentence
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  editor.organization.rest
  new.sentence
  format.number.series output
  new.block
  format.edition output
  new.block
  output.address.publisher
  format.date "year/date" output.check
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
  output.author.head
  new.sentence
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  editor.organization.rest
  new.block
  howpublished output
  address.or.location output
  format.date "year/date" output.check
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
  output.author.head
  new.sentence
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  bookauthor.rest
  editor.organization.rest
  new.block
  format.edition output
  new.block
  format.number.series output
  new.sentence
  output.address.publisher
  format.date "year/date" output.check
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
  output.author.head
  new.sentence
  new.sentence
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  editor.organization.rest
  new.block
  output.address.publisher
  format.date "year/date" output.check
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
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  editor.organization.rest
  new.block
  format.bvolume output
  format.number.series output
  output.address.publisher
  format.date "year/date" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  output.author.head
  new.sentence
  new.sentence
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  new.dblslash
  booktitle "booktitle" output.check
  new.slash
  editor.organization.rest
  new.block
  format.bvolume output
  format.number.series output
  new.block
  output.address.publisher
  format.date "year/date" output.check
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
    { format.author output.nonnull }
  if$
  new.block
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
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
  format.date "year/date" output.check
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
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.colon
  format.type.number output
  add.blank
  address.or.location output
  new.colon
  ipc output
  new.slash
  format.author "author" output.check
  add.blank
  authorcountry paranthesify output.nonnull
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
  prioritycountry paranthesify output
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
  %format.author output  % < v.1.3
  output.author.head    % v.1.3
  %new.sentence            % v.1.3
  title howpublished new.sentence.checkb
  title add.media output
  howpublished new.block.checka
  howpublished output
  new.block
  format.date "year/date" output.check
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  output.author.head
  new.sentence
  title "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.slash
  output.author.rest
  editor.organization.rest
  new.block
  format.date "year/date" output.check
  new.block
  note "note" output.check
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}

FUNCTION {online}
{ output.bibitem
  format.author output
  title howpublished new.sentence.checkb
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  howpublished new.dblslash.checka
  howpublished bracketise output
  editor.organization.rest
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
  format.author "author" output.check
  new.sentence
  title add.doi add.media "title" output.check
  new.colon
  bbl.phdthesis format.thesis.type output.nonnull
  new.colon
  specialitycode.or.number output % code of the speciality, new in v.1.2i
  new.colon
  titleaddon output % date of defence and approvement; new in v.1.2i
  new.slash
  %%%format.author.rest output %% dupplicates athours from the head zone
  output.author.rest            %% prints if num.names$ > 3 or > 1
  new.semicolon
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.block
  output.address.publisher
  format.date "year/date" output.check
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
  title add.doi add.media "title" output.check
  new.colon          % added in v.1.3
  titleaddon output  % added in v.1.3
  new.colon
  type "type" output.check
  new.colon
  number output
  new.slash
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.semicolon
  format.chief.rest output % from editor field
  new.semicolon
  format.executor.rest output % from author field
  new.block
  address.or.location output
  new.colon
  organization output
  format.date "year/date" output.check
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
  format.author "author" output.check
  new.sentence
  title add.doi add.media "title" output.check
  new.colon
  bbl.phdthesis format.thesis.type output.nonnull
  new.colon
  %%number output % code of the speciality
  specialitycode.or.number output % code of the speciality, new in v.1.2i
  new.colon
  titleaddon output % date of defence and approvement; new in v.1.2i
  new.slash
  %%%format.author.rest output %% dupplicates athours
  output.author.rest            %% prints if num.names$ > 3 or > 1
  new.semicolon
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.block
  output.address.publisher
  format.date "year/date" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}
FUNCTION {mastersthesis}
{ output.bibitem
  format.author "author" output.check
  new.sentence
  title add.doi add.media "title" output.check
  new.colon
  bbl.mathesis format.thesis.type output.nonnull
  new.colon
  %%number output % code of the speciality
  specialitycode.or.number output % code of the speciality, new in v.1.2i
  new.colon
  titleaddon output % date of defence and approvement; new in v.1.2i
  new.slash
  %%%format.author.rest output %% dupplicates athours
  output.author.rest            %% prints if num.names$ > 3 or > 1
  new.semicolon
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.block
  output.address.publisher
  format.date "year/date" output.check
  new.block
  format.pages.page output
  new.block
  note output
  new.sentence
  output.eprint.url
  format.annote output
  fin.entry
}
FUNCTION {docthesis}
{ output.bibitem
  format.author "author" output.check
  new.sentence
  title add.doi add.media "title" output.check
  new.colon
  bbl.docthesis format.thesis.type output.nonnull
  new.colon
  %%number output % code of the speciality
  specialitycode.or.number output % code of the speciality, new in v.1.2i
  new.colon
  titleaddon output % date of defence and approvement; new in v.1.2i
  new.slash
  %%%format.author.rest output %% dupplicate athours
  output.author.rest            %% prints if num.names$ > 3 or > 1
  new.semicolon
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.block
  output.address.publisher
  format.date "year/date" output.check
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
  title add.doi add.media "title" output.check
  new.colon
  format.techreport.type output
  new.colon
  number output
  new.slash
  %institution "institution" output.check
  institution.or.school "institution/school" output.check
  new.semicolon
  format.chief.rest output % from editor field
  new.semicolon
  format.executor.rest output % from author field
  new.block
  address.or.location output
  new.colon
  organization output
  format.date "year/date" output.check
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
MACRO {aa}{"Astron.\ \& Astrophys."}
MACRO {aasup}{"Astron.\ \& Astrophys.\ Suppl.\ Ser."}
MACRO {aj} {"Astron.\ J."}
MACRO {aph} {"Acta Phys."}
MACRO {advp} {"Adv.\ Phys."}
MACRO {ajp} {"Amer.\ J.\ Phys."}
MACRO {ajm} {"Amer.\ J.\ Math."}
MACRO {amsci} {"Amer.\ Sci."}
MACRO {anofd} {"Ann.\ Fluid Dyn."}
MACRO {am} {"Ann.\ Math."}
MACRO {ap} {"Ann.\ Phys.\ (NY)"}
MACRO {adp} {"Ann.\ Phys.\ (Leipzig)"}
MACRO {ao} {"Appl.\ Opt."}
MACRO {apl} {"Appl.\ Phys.\ Lett."}
MACRO {app} {"Astroparticle Phys."}
MACRO {apj} {"Astrophys.\ J."}
MACRO {apjsup} {"Astrophys.\ J.\ Suppl."}
MACRO {apss} {"Astrophys.\ Space Sci."}
MACRO {araa} {"Ann.\ Rev.\ Astron.\ Astrophys."}
MACRO {baas} {"Bull.\ Amer.\ Astron.\ Soc."}
MACRO {baps} {"Bull.\ Amer.\ Phys.\ Soc."}
MACRO {cmp} {"Comm.\ Math.\ Phys."}
MACRO {cpam} {"Commun.\ Pure Appl.\ Math."}
MACRO {cppcf} {"Comm.\ Plasma Phys.\ \& Controlled Fusion"}
MACRO {cpc} {"Comp.\ Phys.\ Comm."}
MACRO {cqg} {"Class.\ Quant.\ Grav."}
MACRO {cra} {"C.\ R.\ Acad.\ Sci.\ A"}
MACRO {fed} {"Fusion Eng.\ \& Design"}
MACRO {ft} {"Fusion Tech."}
MACRO {grg} {"Gen.\ Relativ.\ Gravit."}
MACRO {ieeens} {"IEEE Trans.\ Nucl.\ Sci."}
MACRO {ieeeps} {"IEEE Trans.\ Plasma Sci."}
MACRO {ijimw} {"Interntl.\ J.\ Infrared \& Millimeter Waves"}
MACRO {ip} {"Infrared Phys."}
MACRO {irp} {"Infrared Phys."}
MACRO {jap} {"J.\ Appl.\ Phys."}
MACRO {jasa} {"J.\ Acoust.\ Soc.\ America"}
MACRO {jcp} {"J.\ Comp.\ Phys."}
MACRO {jchp} {"J.\ Chem.\ Phys."}
MACRO {jetp} {"Sov.\ Phys.--JETP"}
MACRO {jfe} {"J.\ Fusion Energy"}
MACRO {jfm} {"J.\ Fluid Mech."}
MACRO {jmp} {"J.\ Math.\ Phys."}
MACRO {jne} {"J.\ Nucl.\ Energy"}
MACRO {jnec} {"J.\ Nucl.\ Energy, C: Plasma Phys., Accelerators, Thermonucl.\ Res."}
MACRO {jnm} {"J.\ Nucl.\ Mat."}
MACRO {jpc} {"J.\ Phys.\ Chem."}
MACRO {jpp} {"J.\ Plasma Phys."}
MACRO {jpsj} {"J.\ Phys.\ Soc.\ Japan"}
MACRO {jsi} {"J.\ Sci.\ Instrum."}
MACRO {jvst} {"J.\ Vac.\ Sci.\ \& Tech."}
MACRO {nat} {"Nature"}
MACRO {nature} {"Nature"}
MACRO {nedf} {"Nucl.\ Eng.\ \& Design/Fusion"}
MACRO {nf} {"Nucl.\ Fusion"}
MACRO {nim} {"Nucl.\ Inst.\ \& Meth."}
MACRO {nimpr} {"Nucl.\ Inst.\ \& Meth.\ in Phys.\ Res."}
MACRO {np} {"Nucl.\ Phys."}
MACRO {npb} {"Nucl.\ Phys.\ B"}
MACRO {nt/f} {"Nucl.\ Tech./Fusion"}
MACRO {npbpc} {"Nucl.\ Phys.\ B (Proc.\ Suppl.)"}
MACRO {inc} {"Nuovo Cimento"}
MACRO {nc} {"Nuovo Cimento"}
MACRO {pf} {"Phys.\ Fluids"}
MACRO {pfa} {"Phys.\ Fluids A: Fluid Dyn."}
MACRO {pfb} {"Phys.\ Fluids B: Plasma Phys."}
MACRO {pl} {"Phys.\ Lett."}
MACRO {pla} {"Phys.\ Lett.\ A"}
MACRO {plb} {"Phys.\ Lett.\ B"}
MACRO {prep} {"Phys.\ Rep."}
MACRO {pnas} {"Proc.\ Nat.\ Acad.\ Sci.\ USA"}
MACRO {pp} {"Phys.\ Plasmas"}
MACRO {pop} {"Phys.\ Plasmas"}
MACRO {ppcf} {"Plasma Phys.\ \& Controlled Fusion"}
MACRO {phitrsl} {"Philos.\ Trans.\ Roy.\ Soc.\ London"}
MACRO {prl} {"Phys.\ Rev.\ Lett."}
MACRO {pr} {"Phys.\ Rev."}
MACRO {physrev} {"Phys.\ Rev."}
MACRO {pra} {"Phys.\ Rev.\ A"}
MACRO {prb} {"Phys.\ Rev.\ B"}
MACRO {prc} {"Phys.\ Rev.\ C"}
MACRO {prd} {"Phys.\ Rev.\ D"}
MACRO {pre} {"Phys.\ Rev.\ E"}
MACRO {ps} {"Phys.\ Scripta"}
MACRO {procrsl} {"Proc.\ Roy.\ Soc.\ London"}
MACRO {rmp} {"Rev.\ Mod.\ Phys."}
MACRO {rsi} {"Rev.\ Sci.\ Inst."}
MACRO {science} {"Science"}
MACRO {sciam} {"Sci.\ Am."}
MACRO {sam} {"Stud.\ Appl.\ Math."}
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
MACRO {appopt} {"Appl.\ Opt."}
MACRO {bell}   {"Bell Syst.\ Tech.\ J."}
MACRO {ell}    {"Electron.\ Lett."}
MACRO {jasp}   {"J.\ Appl.\ Spectr."}
MACRO {jqe}    {"IEEE J.\ Quantum Electron."}
MACRO {jlwt}   {"J.\ Lightwave Technol."}
MACRO {jmo}    {"J.\ Mod.\ Opt."}
MACRO {josa}   {"J.\ Opt.\ Soc.\ America"}
MACRO {josaa}  {"J.\ Opt.\ Soc.\ Amer.~A"}
MACRO {josab}  {"J.\ Opt.\ Soc.\ Amer.~B"}
MACRO {jdp}    {"J.\ Phys.\ (Paris)"}
MACRO {oc}     {"Opt.\ Commun."}
MACRO {ol}     {"Opt.\ Lett."}
MACRO {os}     {"Opt.\ Spectrosc."}
MACRO {phtl}   {"IEEE Photon. Technol. Lett."}
MACRO {pspie}  {"Proc.\ Soc.\ Photo-Opt.\ Instrum. Eng."}
MACRO {vr}     {"Vision Res."}
MACRO {zph}    {"Z.\ f.\ Physik"}
MACRO {zphb}   {"Z.\ f.\ Physik~B"}
MACRO {zphd}   {"Z.\ f.\ Physik~D"}
MACRO {sse} {"Solid-State Electron."}
MACRO {pss} {"Phys. Sol. State"}
MACRO {nl}  {"Nano Lett."}
MACRO {sjpp} {"Sov.\ J.\ Plasma Phys."}
MACRO {spd}  {"Sov.\ Phys.--Doklady"}
MACRO {sptp} {"Sov.\ Phys.--Tech. Phys."}
MACRO {spu}  {"Sov.\ Phys.--Uspekhi"}
MACRO {ufn}  {"УФН"}
MACRO {pu}  {"Phys.--Uspekhi"}
MACRO {sjot} {"Sov.\ J.\ Opt.\ Technol."}
MACRO {sjqe} {"Sov.\ J.\ Quantum Electron."}
MACRO {sleb} {"Sov.\ Phys.--Leb.\ Inst.\ Rep."}
MACRO {stph} {"Sov.\ Phys.--Techn.\ Phys."}
MACRO {stphl}{"Sov.\ Techn.\ Phys.\ Lett."}

READ




STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

EXECUTE {initialize.longest.label}

FUNCTION {forward.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

ITERATE {forward.pass}


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
  "\ProvideTextCommandDefault{\cyrdash}{\iflanguage{russian}{\hbox to.8em{--\hss--}}{\textemdash}}" write$ newline$
  "\providecommand*{\BibDash}{\ifdim\lastskip>0pt\unskip\nobreak\hskip.2em plus 0.1em\fi" write$ newline$
  "\cyrdash\hskip.2em plus 0.1em\ignorespaces}" write$ newline$
  "\renewcommand{\newblock}{\ignorespaces}" write$ newline$
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

%% -------------------------------------------------------------------
%% Copyright 2012-2017 Igor A. Kotelnikov.
%% Copyright 2017      Leonid Sinev.
%% Version 1.3*
%% 
%% Copyright 1996-2005 Maksym Polyakov.
%% Version 2005.08.12
%% 
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Igor A. Kotelnikov.
%% 
%% Current version is 1.3, 2017.02.25.
%% 
%% Please, send bug report via e-mail: kia999@mail.ru <Igor Kotelnikov>
%% -------------------------------------------------------------------
%% This work consists of the file  gost.dtx
%% and the derived files           gost.ins,
%%                                 gost.pdf,
%%                                 gost*.bst  (8 files),
%%                                 ugost*.bst (8 files),
%%                                 README.md.
%% It also contains a lot of examples (*.tex, *.pdf, *.bib files).
%% -------------------------------------------------------------------
%%
%% End of file `ugost2003.bst'.
