# Appendix A Replication Scripts (Stata)

This folder contains the complete Stata replication package for the microeconometric analysis presented in **Section 4.1** of the main paper and **Appendix A (S1–S7)** of the supplementary material.

---

## Requirements

* **Software:** Stata 12 or newer (scripts are optimized for Stata 19).
* **Dependencies:** None. All spreadsheet exports use Stata's native commands (`export excel`), removing any external Python or Stata package dependencies.

---

## Directory Structure

* `run_all.do`: Master script that runs the entire replication pipeline sequentially.
* `_setup_paths.do`: Automatic path-initializer that sets the workspace directories dynamically.
* `_load_analytical_sample.do`: Helper that loads the analytical dataset.
* `microstructure_replication.do`: Primary script that Renames raw variables, processes dates, constructs features, estimates Multinomial Logit (MNL) and Cox regressions, and exports key outputs.
* `sample_selection_robustness.do`: Runs attrition test, robustness specifications, and IIA diagnostic tests.
* `cox_only.do`: Estimates cause-specific Cox models for all resolution timing endpoints.
* `data/`:
  * `Data_merge.dta`: The full raw microdata (~37 MB) from CNMH/SIEVCAC.
  * `analytical_sample.dta`: The filtered analytical dataset (n = 1,125) with complete covariates.
* `outputs/`: Destination folder for all generated tables, datasets, and logs.

---

## How to Run

### Option 1: Via Stata GUI
1. Open Stata.
2. Set the working directory to this `scripts/` directory:
   ```stata
   cd "/path/to/appendix_A_micro/scripts"
   ```
3. Run the master script:
   ```stata
   do run_all.do
   ```

### Option 2: Via Command Line (Batch Mode)
From your terminal, navigate to the `scripts/` directory and execute:
```bash
stata -b do run_all.do
```
*(On macOS, the executable might be `/Applications/Stata/StataBE.app/Contents/MacOS/StataBE -b do run_all.do`)*.

---

## Key Generated Outputs

All outputs are saved to the `outputs/` subdirectory:
1. **`replication.log`**: Detailed Stata output log of all estimations.
2. **`Datos_Graficas_Cox.xlsx`**: Excel file containing the sheets:
   * `Survival_Rescate`: Daily survival probabilities used for plotting Figure XV.
   * `Cumul_Rescue`: Terminal cumulative rescue probability by captor group at day 98.
3. **`mnl_robustness_death.txt`**: Coefficient tables for Multinomial Logit robustness checks (Table S3).
4. **`cox_appendix_rows.txt`**: Cause-specific Cox regression results (Table S4).
5. **`cox_cumul_day100.txt`**: Terminal rescue statistics (Table IV).
