* ==============================================================================
* APPENDIX A PATH SETUP
* Locates the scripts/ package root (folder containing data/Data_merge.dta),
* sets working directory, and defines pkgroot, datadir, outdir.
* Works when the current working directory is scripts/, appendix_A_micro/scripts/, or when a
* .do file is launched by absolute path from another folder.
* ==============================================================================

local dir "`c(pwd)'"
local dir : subinstr local dir "\" "/", all
local candidates "`dir'"

* Also search relative to the running .do file (if Stata provides its path).
local file "`c(filename)'"
if "`file'" != "" {
    local file : subinstr local file "\" "/", all
    local fslash = strrpos("`file'", "/")
    if `fslash' > 0 {
        local filedir = substr("`file'", 1, `fslash' - 1)
        local candidates "`candidates' `filedir'"
        local parent = substr("`filedir'", 1, strrpos("`filedir'", "/") - 1)
        if "`parent'" != "`filedir'" local candidates "`candidates' `parent'"
    }
}

local pkgroot ""
tokenize `candidates'
local n : word count `candidates'
forvalues i = 1/`n' {
    local try "`dir`i''"
    if "`try'" == "" continue

    capture confirm file "`try'/data/Data_merge.dta"
    if !_rc {
        local pkgroot "`try'"
        continue, break
    }

    capture confirm file "`try'/scripts/data/Data_merge.dta"
    if !_rc {
        local pkgroot "`try'/scripts"
        continue, break
    }

    capture confirm file "`try'/appendix_A_micro/scripts/data/Data_merge.dta"
    if !_rc {
        local pkgroot "`try'/appendix_A_micro/scripts"
        continue, break
    }
}

* Walk up from the current working directory if still not found.
if "`pkgroot'" == "" {
    local walk "`dir'"
    forvalues step = 1/10 {
        if "`walk'" == "" continue, break

        capture confirm file "`walk'/data/Data_merge.dta"
        if !_rc {
            local pkgroot "`walk'"
            continue, break
        }

        capture confirm file "`walk'/scripts/data/Data_merge.dta"
        if !_rc {
            local pkgroot "`walk'/scripts"
            continue, break
        }

        capture confirm file "`walk'/appendix_A_micro/scripts/data/Data_merge.dta"
        if !_rc {
            local pkgroot "`walk'/appendix_A_micro/scripts"
            continue, break
        }

        local slash = strrpos("`walk'", "/")
        if `slash' < 1 continue, break
        local walk = substr("`walk'", 1, `slash' - 1)
    }
}

if "`pkgroot'" == "" {
    display as error _n "Could not find data/Data_merge.dta."
    display as error "Download the full appendix_A_micro/scripts/ folder (including data/)."
    display as error "Then run one of:"
    display as error "  do run_all.do            [cwd = appendix_A_micro/scripts/]"
    display as error "  stata -b do run_all.do   [shell cwd = appendix_A_micro/scripts/]"
    exit 601
}

capture cd "`pkgroot'"
if _rc {
    display as error "Could not change directory to: `pkgroot'"
    exit 602
}

local datadir "`pkgroot'/data"
local outdir  "`pkgroot'/outputs"
capture mkdir "`outdir'"

capture confirm file "`datadir'/Data_merge.dta"
if _rc {
    display as error "Missing file: `datadir'/Data_merge.dta"
    display as error "Ensure appendix_A_micro/scripts/data/ was downloaded intact (~37 MB)."
    exit 603
}

display as text "Package root: `pkgroot'"
display as text "Data directory: `datadir'"
display as text "Output directory: `outdir'"
