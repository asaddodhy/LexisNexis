% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LexisNexisTools.R
\name{lnt_read}
\alias{lnt_read}
\title{Read in a LexisNexis TXT file}
\usage{
lnt_read(x, encoding = "UTF-8", extract_paragraphs = TRUE,
  convert_date = TRUE, start_keyword = "auto", end_keyword = "auto",
  length_keyword = "^LENGTH: |^LÄNGE: |^LONGUEUR: ",
  exclude_lines = "^LOAD-DATE: |^UPDATE: |^GRAFIK: |^GRAPHIC: |^DATELINE: ",
  recursive = FALSE, verbose = TRUE, ...)
}
\arguments{
\item{x}{Name or names of LexisNexis TXT file to be converted.}

\item{encoding}{Encoding to be assumed for input files. Defaults to UTF-8
(the LexisNexis standard value).}

\item{extract_paragraphs}{A logical flag indicating if the returned object
will include a third data frame with paragraphs.}

\item{convert_date}{A logical flag indicating if it should be tried to
convert the date of each article into Date format. For non-standard dates
provided by LexisNexis it might be safer to convert dates afterwards (see
\link{lnt_asDate}).}

\item{start_keyword}{Is used to indicate the beginning of an article. All
articles should have the same number of Beginnings, ends and lengths (which
indicate the last line of metadata). Use regex expression such as "\\d+ of
\\d+ DOCUMENTS$" (which would catch e.g., the format "2 of 100 DOCUMENTS")
or "auto" to try all common keywords. Keyword search is case sensitive.}

\item{end_keyword}{Is used to indicate the end of an article. Works the same
way as start_keyword. A common regex would be "^LANGUAGE: " which catches
language in all caps at the beginning of the line (usually the last line of
an article).}

\item{length_keyword}{Is used to indicate the end of the metadata. Works the
same way as start_keyword and end_keyword. A common regex would be
"^LENGTH: " which catches length in all caps at the beginning of the line
(usually the last line of the metadata).}

\item{exclude_lines}{Lines in which these keywords are found are excluded.
Set to \code{character()} if you want to turn off this feature.}

\item{recursive}{A logical flag indicating whether subdirectories are
searched for more TXT files.}

\item{verbose}{A logical flag indicating whether information should be
printed to the screen.}

\item{...}{Additional arguments passed on to \link{lnt_asDate}.}
}
\value{
An LNToutput S4 object consisting of 3 data.frames for metadata,
  articles and paragraphs.
}
\description{
Read a LexisNexis TXT file and convert it to a object of class
\link{LNToutput}.
}
\details{
The function can produce an \link{LNToutput} S4 object with two or
  three data.frame: meta, containing all meta information such as date,
  author and headline and articles, containing just the article ID and the
  text of the articles. When extract_paragraphs is set to TRUE, the output
  contains a third data.frame, similar to articles but with articles split
  into paragraphs.

  When left to 'auto', the keywords will use the following defaults, which
  should be the standard keywords in all languages used by 'LexisNexis':

  * \code{start_keyword = "\\d+ of \\d+ DOCUMENTS$| Dokument \\d+ von \\d+$|
  Document \\d+ de \\d+$"}.

  * \code{end_keyword = "^LANGUAGE: |^SPRACHE: |^LANGUE: "}.
}
\examples{
LNToutput <- lnt_read(lnt_sample())
meta.df <- LNToutput@meta
articles.df <- LNToutput@articles
paragraphs.df <- LNToutput@paragraphs
}
\author{
Johannes B. Gruber
}
