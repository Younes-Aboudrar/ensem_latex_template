\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main}[2025/06/28 Main class for ENSEM LaTeX template]

\RequirePackage{expl3}

\ExplSyntaxOn

\cs_new:Npn \main_check_color:n #1 {
    \tl_set:Nn \l_tmpa_tl {#1}
    \color_set:nn {\l_tmpa_tl} {#1}
}

\keys_define:nn {main} {
    field .choices:nn = 
        {undefined, dpi, geset, gse, iarci, gld, gil, gsm, cmpi, pip, qmsi}
        {\tl_gset:Nn \g_main_field_tl {#1}},
    field /unknown .code:n =
        { \ClassWarningNoLine{main}
        {Specified~'field'~not~available.~Defaulting~to~'undefined'}},
    field .default:n = {undefined},
    field .initial:n = {undefined},

    coverstyle .choices:nn =
        {classic, bw}
        {\tl_gset:Nn \g_main_coverstyle_tl {#1}},
    coverstyle /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'coverstyle'~not~available.~Defaulting~to~'classic'}},
    coverstyle .default:n = {classic},
    coverstyle .initial:n = {classic},

    language .choices:nn =
        {fr, en}
        {\tl_gset:Nn \g_main_language_tl {#1}},
    language /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'language'~not~available.~Defaulting~to~'fr'}},
    language .default:n = {fr},
    language .initial:n = {fr},

    chapterstyle .choices:nn =
        {classic, fancy, modern}
        {\tl_gset:Nn \g_main_chapterstyle_tl {#1}},
    chapterstyle /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'chapterstyle'~not~available.~Defaulting~to~'classic'}},
    chapterstyle .default:n = {classic},
    chapterstyle .initial:n = {classic},

    docstage .choices:nn =
        {draft, final}
        {\tl_gset:Nn \g_main_docstage_tl {#1}},
    docstage /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'docstage'~not~available.~Defaulting~to~'draft'}},
    docstage .default:n = {draft},
    docstage .initial:n = {draft},

    media .choices:nn =
        {paper, screen}
        {\tl_gset:Nn \g_main_media_tl {#1}},
    media /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'media'~not~available.~Defaulting~to~'paper'}},
    media .default:n = {paper},
    media .initial:n = {paper},

    linkcolor .code:n = {
        \tl_gset:Nn \g_main_linkcolor_tl {#1}
        \main_check_color:n{#1}
        \tl_if_eq:NNTF \l_tmpa_tl \q_no_value {
            \tl_gset:Nn \g_main_linkcolor_tl {black}
            \ClassWarningNoLine{main}
            {Specified~'linkcolor'~not~available.Defaulting~to~'black'}
        }
    },
    linkcolor .default:n = {black},
    linkcolor .initial:n = {black},

    doctype .choices:nn =
        {report, thesis, book}
        {\tl_gset:Nn \g_main_doctype_tl {#1}},
    doctype /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'doctype'~not~available.~Defaulting~to~'report'}},
    doctype .default:n = {report},
    doctype .initial:n = {report},

    bookprint .choices:nn =
        {true, false}
        {\tl_gset:Nn \g_main_bookprint_tl {#1}},
    bookprint /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'bookprint'~not~available.~Defaulting~to~'false'}},
    bookprint .default:n = {false},
    bookprint .initial:n = {false},

    aiack .choices:nn =
        {true, false}
        {\tl_gset:Nn \g_main_aiack_tl {#1}},
    aiack /unknown .code:n =
        {\ClassWarningNoLine{main}
        {Specified~'aiack'~not~available.~Dedfaulting~to~'false'}},
    aiack .default:n = {false},
    aiack .initial:n = {false},

    unknown .code:n = 
        {\ClassWarningNoLine{main}
        {An~unknown~option~was~ignored.~Please~check~the~documentation~to~see~the~available~options.}}

}

\newcommand{\LanguageOption}{\g_main_language_tl}
\newcommand{\FieldOption}{\g_main_field_tl}
\newcommand{\CoverStyleOption}{\g_main_coverstyle_tl}
\newcommand{\ChapterStyleOption}{\g_main_chapterstyle_tl}
\newcommand{\DocStageOption}{\g_main_docstage_tl}
\newcommand{\MediaOption}{\g_main_media_tl}
\newcommand{\LinkColorOption}{\g_main_linkcolor_tl}
\newcommand{\DocTypeOption}{\g_main_doctype_tl}
\newcommand{\BookPrintOption}{\g_main_bookprint_tl}
\newcommand{\AiAckOption}{\g_main_aiack_tl}

\ProcessKeyOptions[main]
\ExplSyntaxOff

\LoadClass[a4paper, 11pt, twoside]{report}

\expandafter\RequirePackage\expandafter[\LanguageOption]{babel}

\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{tabularx}
\RequirePackage{xltabular}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{varwidth}
\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage[toc,page]{appendix}
\RequirePackage[bookmarks,pdfusetitle]{hyperref}
\RequirePackage[acronym]{glossaries}
\RequirePackage[calc,datesep={/}]{datetime2}
\RequirePackage{xparse}
\RequirePackage{typearea}
\RequirePackage{eso-pic}
\RequirePackage{setspace}
\RequirePackage[newfloat]{minted}
\RequirePackage{silence}
\RequirePackage{fontawesome5}
\RequirePackage{calc}
\RequirePackage{soul}
\RequirePackage{mfirstuc}
\RequirePackage{tikz}
\RequirePackage{psvectorian}
\RequirePackage{blindtext}

\tcbuselibrary{most}
\WarningsOff{blindtext}

\usepackage{Configurations/00-Fonts}
\usepackage{Configurations/01-Colors}
\usepackage{Configurations/02-Margins}
\usepackage{Configurations/03-References}
\usepackage{Configurations/04-Headers}
\usepackage{Configurations/05-Contents}
\usepackage{Configurations/06-Glossary}
\usepackage{Configurations/07-Chapters}
\usepackage{Configurations/08-Tables}
\usepackage{Configurations/09-Code}
\usepackage{Configurations/10-Macros}
\usepackage{Configurations/11-Metadata}
