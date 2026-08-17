* ==============================================================================
* APPENDIX A -- RUN ALL REPLICATION SCRIPTS
* Execute from appendix_A_micro/scripts/
* ==============================================================================
version 19
clear all
set more off
set linesize 120

capture confirm file "_setup_paths.do"
if _rc capture cd scripts
capture confirm file "_setup_paths.do"
if _rc capture cd appendix_A_micro/scripts
capture confirm file "_setup_paths.do"
if _rc {
    display as error "Set the working directory to appendix_A_micro/scripts/."
    exit 601
}
include _setup_paths.do

* Results window truncates long runs; save full output and enlarge buffer.
capture set scrollbufsize 500000
set linesize 200
capture log close _all
log using "`outdir'/replication.log", replace text
display as text _n "Logging full output to: `outdir'/replication.log"
display as text "(Open this file if Results does not show everything.)" _n

display as text _n(2) "=== APPENDIX 2: FULL REPLICATION PIPELINE ==="

do "`pkgroot'/microstructure_replication.do"
do "`pkgroot'/sample_selection_robustness.do"
do "`pkgroot'/cox_only.do"

capture log close _all
display as text _n(2) "=== REPLICATION COMPLETE ==="
display as text "Full log: `outdir'/replication.log"
display as text "Outputs:  `outdir'"
