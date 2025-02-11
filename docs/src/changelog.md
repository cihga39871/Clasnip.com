# Change Log

## v2.5.0 - **DB NEED RE-BUILD**

- Feature: heatmap/phylogenetic tree for samples (db samples and new samples).
- Optim: stores some data to supports the feature above.
- Change: retain more types of files after creating db.
- Other optimization and updates.
- Change: lock types.
- Fix: closing db files after loading.
- New: functions.

API:

- Fix: reports: db concatenate does not work for number of db > 2.

UI:

- Change: all heatmaps with Plotly heatmaps and dendrograms.
- Change: reports can have heatmaps and dendrograms.

## v2.4.0 - **DB NEED RE-BUILD**

- Algorithm: set uppercase to REF and ALT. This might change db and results.
- Optim: Speed gain by updating JobSchedulers.

## v2.3.1

- New: script.
- Feat: script.
- Compat: JobSchedulers.
- Algorithm: Load identity distributions when loading database.
- Feat: Lock type changes.

## v2.3.0

- Feat: Now some API accepts more morden token validation.

## v2.2.0

- Algorithm: Probability update:
  Probability considers P(not classified to any groups).  
  It assumes the sample can only be classified to one group.  
  
  Therefore, if sumCDF <= 1,  
  P(not classified to any groups) = 1 - sumCDF,  
  and the real P is CDF.  
  
  If sumCDF > 1,  
  P(not classified to any groups) = 0,  
  real P = CDF/sumCDF (the same as before).

- Feature: colorful repl http messages.

## v2.1.4

- Feature: allow db file containing multiple depth of group: `GRO/OP/SAMPLE`.

- Feature: handling failed dbs.

- Fix: restart server into forever loop.

## v2.1.3

- Feature: ClasnipMux enables Package's precompilation at some point.

- Optimize: faster API response.

- Remove: Dependency HttpCommon.jl.

- Fix: DB generation: re-write using JobSchedulers.

## v2.1.2

- Fix: db reanalyzing script: building pangenome error.

## v2.1.1

- Optimize: better type assertion/consistency for better precompiled code (>10X faster for computing identity and 5X faster for computing SNP heatmap in db build).

- Optimize: some computational intensive loops.

## v2.1.0

- Optimize: Save time and RAM for new sample classification: do not parse ALT2PROBs to human readable group columns for MLST tables with less than `100_000` rows. If number of rows is larger , the tabular MLST file will not be generated, but MLST data will be stored in a different format. 

- Optimize: Re-write a multi-threaded version of DB generation. Default is 4 threaded. This version has 0.028% (244/865931) differences in ALT2PROBs in test data. Checked the first two records, new verison is correct. 

- Feature: DB storing updates.

## v2.0.0

- Optimize: New Clasnip DB type was created to store in a special format. 

  1. The size of all 14 Clasnip DB files reduced **18.3X**, from 5520MB to 302MB.
  2. DB loading time is **4.9X** faster.
  3. Database generation time is also reduced because of the time of saving DB.
  4. Migration script is avaiable.

| Database                                         | Compression Ratio | DB Loading Speed Ratio | File Size, Old (MB) | File Size, New (MB) | Load Time, Old (s) | Convert Time (s) | Save Time, New (s) | Load Time, New (s) | Uncompress Time, New (s) |
| :----------------------------------------------- | ----------------: | ---------------------: | ------------------: | ------------------: | -----------------: | ---------------: | -----------------: | -----------------: | -----------------------: |
| `avipoxvirus_c1_3_0`                             |              40.7 |                    2.7 |               31.85 |                0.78 |               1.70 |             1.95 |               1.18 |               0.16 |                     0.48 |
| `Clavibacter_202301_c1_3_0`                      |              20.3 |                    4.9 |              703.58 |               34.68 |               7.26 |             3.37 |               0.09 |               0.03 |                     1.45 |
| `clso_v6_16_23s_c1_3_0`                          |               1.5 |                    1.3 |                0.06 |                0.04 |               0.00 |             0.03 |               0.00 |               0.00 |                     0.00 |
| `clso_v6_16s_c1_3_0`                             |               1.3 |                    1.4 |                0.06 |                0.04 |               1.28 |             1.24 |               1.57 |               0.41 |                     0.53 |
| `clso_v6_50s_c1_3_0`                             |               1.7 |                    1.1 |                0.08 |                0.04 |               0.00 |             0.08 |               0.00 |               0.00 |                     0.00 |
| `clso_v6_c1_3_0`                                 |              41.7 |                    3.2 |               34.47 |                0.83 |               2.04 |             1.38 |               1.60 |               0.38 |                     0.26 |
| `Dickeya_202210_c1_3_0`                          |              19.1 |                   40.1 |            1,079.00 |               56.35 |              16.39 |             8.70 |               0.05 |               0.01 |                     0.40 |
| `Pectobacterium_202210_c1_3_0`                   |              15.8 |                    2.7 |            1,278.91 |               81.07 |              14.91 |             4.92 |               0.06 |               1.09 |                     4.38 |
| `Pectobacterium_202407_c1_3_0`                   |              15.5 |                    4.2 |            1,369.15 |               88.18 |              16.54 |             9.01 |               0.06 |               1.03 |                     2.88 |
| `potato_virus_Y_phylogroups_quarantine_c1_3_0`   |              22.1 |                    7.8 |                1.85 |                0.08 |               0.02 |             0.04 |               0.04 |               0.00 |                     0.00 |
| `Ralstonia_solanacearum_complex_20230515_c1_3_0` |              25.2 |                    7.9 |              908.75 |               36.13 |              12.40 |             4.20 |               0.05 |               0.01 |                     1.56 |
| `Rust_fungi_ITS2_20230315_c1_3_0`                |              10.9 |                    2.7 |                1.88 |                0.17 |               0.01 |             0.02 |               0.00 |               0.00 |                     0.00 |
| `Rust_fungi_ITS2_20240412_c1_3_0`                |              10.9 |                    2.8 |                1.88 |                0.17 |               0.01 |             0.03 |               0.02 |               0.00 |                     0.00 |
| `Xylella_fastidiosa_20230301_c1_3_0`             |              36.0 |                   82.0 |              108.00 |                3.00 |               1.98 |             6.32 |               0.01 |               0.00 |                     0.02 |
| All                                              |              18.3 |                    4.9 |            5,519.50 |              301.58 |              74.53 |            41.28 |               4.73 |               3.14 |                    11.98 |

## v1.3.0

- Optimize: algorithm. This requres recalculation of existing databases.
- Optimize: heatmap figure size now adjusted to both numbers of characters and groups.


## Summary (v0.8 -> v1.2)

The new sample classification module in Clasnip is very fast because the variant database is precomputed and can be preloaded into memory. However, the pre-computation of variant database during database building required a lot of time and CPU/memory resources.

I profiled each step of database building, and optimized the time-limited steps, as well as tools and programming algorithm. 

- More accurate and 10X faster for mapping and variant calling steps. This change has drastically improved classification performance for Candidatus Liberibacter solanacearum.

- I optimized the data structure and algorithm of variant databases. The new version has achieved 1.4X faster database computation speed and 42.8% less storage size.

- Corrected a bug: the SNP coverage in the diagonal cells of SNP heatmap was doubled.

- When building a database, users can choose to create a pangenome using all sequences.

- Other improvements.

## v1.2.0

- Optimize: The total size of 12 databases shrinked to 57.2% comparing to v1.0.0. New sample analysis will be faster theoritically. DB accuracy is the same as v1.0.0.

| Name                                           | Old Size   | New Size   | Change   |
| :--------------------------------------------- | ---------: | ---------: | :------ |
| `avipoxvirus_c1_2_0`                           | 53570014   | 33166727   | 0.619129 |
| `Clavibacter_202301_c1_2_0`                    | 1255558018 | 719021314  | 0.572671 |
| `clso_v6_16_23s_c1_2_0`                        | 79004      | 65844      | 0.833426 |
| `clso_v6_16s_c1_2_0`                           | 68876      | 59836      | 0.86875  |
| `clso_v6_50s_c1_2_0`                           | 102956     | 80204      | 0.779012 |
| `clso_v6_c1_2_0`                               | 60107291   | 36024803   | 0.599342 |
| `Dickeya_202210_c1_2_0`                        | 1982661237 | 1131665789 | 0.570781 |
| `Pectobacterium_202210_c1_2_0`                 | 2408675601 | 1341280377 | 0.556854 |
| `potato_virus_Y_phylogroups_quarantine_c1_2_0` | 3219547    | 1935059    | 0.601035 |
| `Ralstonia_solanacearum_complex_20230515_c1_2_0` | 1510960255 | 886691638  | 0.58684  |
| `Rust_fungi_ITS2_20230315_c1_2_0`              | 3596289    | 1966430    | 0.546794 |
| `Xylella_fastidiosa_20230301_c1_2_0`           | 180763273  | 111769652  | 0.618321 |
| **Total**                                      | 7459362361 | 4263727673 | 0.571594 |

- Optimize: db generation: run time reduced to 72% comparing to v1.0.0. 

- Fix: group coverage is no longer doubled when group in X axis == group in y axis. This affects all figures named 'Group Similarity Based on SNP Differences (For Single-Gene Database).'

- Other improvements.


## v1.1.0

- Compat: JobScheduler v0.9.

## v0.8.0 -> v1.0.0

- Optimize: database performance improvement. Following stats are overall accuracy (%).
  - Candidatus Liberibacter solanacearum (genomic): 99.12 -> 100.00
  - Candidatus Liberibacter solanacearum (16S): 97.37 -> 98.68
  - All other databases created prior to 2024-Mar-08: 100.00 -> 100.00

- Feature: allow users create pangenome using a reference sequence.

- Optimize: change bioinformatics dependencies and related algorithms to reduce storage and increase speed.

- Other minor improvements.
