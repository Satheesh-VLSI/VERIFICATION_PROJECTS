# Synchronous FIFO Verification Results

```diff
+ SIMULATION PASSED
+ DUT : SYNCHRONOUS FIFO
+ Total Errors : 0
+ Total Tests Executed : 8
+ Total Tests PASSED : 8
+ Total Tests FAILED : 0
+ Functional Coverage Achieved : 99.79%
```

---

## Verification Overview

This project verifies a **Synchronous FIFO** using a SystemVerilog-based verification environment.

The verification includes:

- Randomized FIFO Operations
- Full Write Testing
- Full Read Testing
- Pointer Wrap-Around Verification
- Overflow Condition Testing
- Underflow Condition Testing
- Concurrent Read/Write Operations
- Boundary Condition Verification
- Continuous Concurrent Access Testing
- Scoreboard-Based Data Checking
- FIFO Flag Verification
- Functional Coverage Collection
- Cross Coverage Verification
- FIFO State Transition Coverage

---

## Verification Summary

| Parameter | Status |
|---|---|
| DUT | Synchronous FIFO |
| Reset Type | Synchronous Reset |
| FIFO Depth | 16 |
| Data Width | 8-bit |
| Read/Write Type | Synchronous |
| FIFO Architecture | Circular Buffer (Without Empty Slot) |
| Functional Coverage | 99.79% |
| Coverage Bin Hit Percentage | 98.68% |

---

## Verified Test Scenarios

| Test Scenario | Status |
|---|---|
| Randomized Operations | PASSED |
| Full Write Test | PASSED |
| Full Read Test | PASSED |
| Pointer Wrap Around Test | PASSED |
| Overflow Test | PASSED |
| Underflow Test | PASSED |
| Concurrent Boundary Test | PASSED |
| Continuous Concurrent Test | PASSED |

---

## Features Verified

| Feature | Status |
|---|---|
| FIFO Write Operation | PASSED |
| FIFO Read Operation | PASSED |
| Full Flag Generation | PASSED |
| Empty Flag Generation | PASSED |
| Concurrent Read/Write Handling | PASSED |
| Pointer Wrap Around Logic | PASSED |
| Overflow Protection | PASSED |
| Underflow Protection | PASSED |
| Data Integrity | PASSED |
| Scoreboard Comparison | PASSED |
| Functional Coverage Collection | PASSED |
| Cross Coverage Verification | PASSED |
| Reset Transition Coverage | PASSED |

---

## Monitor Fields Description

| Signal | Description |
|---|---|
| w_en | FIFO write enable signal |
| r_en | FIFO read enable signal |
| data_in | Input data written into FIFO |
| data_out | Output data read from FIFO |
| full | FIFO full status flag |
| empty | FIFO empty status flag |
| rst | FIFO synchronous reset signal |


## Verification Observations

- FIFO write and read operations verified successfully
- Full and empty flag behavior validated under all operating conditions
- Pointer wrap-around logic verified successfully
- Overflow and underflow protection behavior validated
- Concurrent read/write operations verified under boundary conditions
- Continuous simultaneous read/write access handled correctly
- Functional coverage successfully collected across all regression runs
- Cross coverage scenarios verified successfully
- Reset transition scenarios fully exercised
- No mismatches detected between expected and actual outputs
- Scoreboard verification completed successfully
- DUT maintained correct FIFO functionality throughout simulation

---

## Final Verification Result

```diff
+ ALL TEST CASES PASSED
+ SYNCHRONOUS FIFO VERIFIED SUCCESSFULLY
+ FUNCTIONAL COVERAGE TARGET ACHIEVED
+ SCOREBOARD CHECKING PASSED
+ DESIGN STATUS : PASSED
```
------

# Assertion Verification Report

```diff
+ ASSERTION VERIFICATION PASSED
+ Total Assertions Checked : 14
+ Assertion Failures       : 0
+ Protocol Violations      : 0
+ Data Integrity Errors    : 0
+ FIFO Control Errors      : 0
```

---

### Assertion Checks

```text
[PASS] Enable Signal X/Z Detection (w_en, r_en)
[PASS] Data Input X/Z Detection
[PASS] Data Output X/Z Detection
[PASS] Full Flag X/Z Detection
[PASS] Empty Flag X/Z Detection
[PASS] Internal Pointer X/Z Detection
[PASS] Reset Output Clearing Verification
[PASS] Reset Dominance over Write Operation
[PASS] Reset Dominance over Read Operation
[PASS] Overflow Protection Verification
[PASS] Underflow Protection Verification
[PASS] Read Pointer Stability Verification
[PASS] Write Pointer Stability Verification
[PASS] Full/Empty Flag Collision Detection
```

---

### Assertion Property Coverage

```text
ENABLE_KNOWN            -> Enable signals never contain X/Z
DATA_IN_KNOWN           -> Valid write data verification
DATA_OUT_KNOWN          -> Valid read data verification
FULL_FLAG_KNOWN         -> FULL flag validity verification
EMPTY_FLAG_KNOWN        -> EMPTY flag validity verification
POINTER_KNOWN           -> Internal pointer validity verification
RESET_CLEARED           -> Reset clearing verification
RESET_DOMINATE_WRITE    -> Reset priority over write operation
RESET_DOMINATE_READ     -> Reset priority over read operation
OVERFLOW_PROTECTION     -> Overflow prevention verification
UNDERFLOW_PROTECTION    -> Underflow prevention verification
READ_PTR_STABILITY      -> Read pointer stability verification
WRITE_PTR_STABILITY     -> Write pointer stability verification
FULL_EMPTY_NO_COLLISION -> FULL and EMPTY mutual exclusion
```

---

### Assertion Observations

```bash
- No assertion failures reported during simulation.
- Enable signals remained free from X/Z states.
- Data paths remained free from unknown values.
- FULL and EMPTY flags maintained valid states.
- Internal pointers remained stable and valid.
- Reset functionality verified successfully.
- Overflow protection verified successfully.
- Underflow protection verified successfully.
- Pointer stability checks passed.
- FULL and EMPTY collision never occurred.
- Assertion-based verification complemented scoreboard checking.
- All monitored FIFO protocol requirements were satisfied.
```

---
# Functional Coverage Summary

```bash
# ========================================================================================
#                       SYNCHRONOUS FIFO COVERAGE REPORT SUMMARY
# ========================================================================================

Overall Functional Coverage Summary
-----------------------------------
Total Coverage Bins          : 152
Covered Bins                 : 150
Uncovered Bins               : 2
Bin Hit Percentage           : 98.68%
Overall Functional Coverage  : 99.79%

Coverage Achievement
--------------------
[PASS] Write Enable Coverage                 : 100%
[PASS] Read Enable Coverage                  : 100%
[PASS] DATA_IN Coverage                      : 100%
[PASS] DATA_OUT Coverage                     : 96.87%
[PASS] FIFO Full Condition Coverage          : 100%
[PASS] FIFO Empty Condition Coverage         : 100%
[PASS] Overflow Attempt Coverage             : 100%
[PASS] Underflow Attempt Coverage            : 100%
[PASS] Reset Coverage                        : 100%
[PASS] Reset Transition Coverage             : 100%
[PASS] Write After Reset Coverage            : 100%
[PASS] Read After Reset Coverage             : 100%
[PASS] Concurrent Read/Write Coverage        : 100%
[PASS] Boundary Condition Coverage           : 100%
[PASS] Full-to-Empty Transition Coverage     : 100%
[PASS] Empty-to-Full Transition Coverage     : 100%

Coverage Analysis
-----------------
- Functional coverage results shown above correspond to merged coverage
  collected across all FIFO test scenarios and regression runs.

- Write and read enable operations were fully exercised across all
  operational modes.

- DATA_IN and DATA_OUT coverpoints successfully achieved complete
  functional coverage across all 64 bins.

- FIFO boundary conditions including FULL and EMPTY states were
  completely verified.

- Overflow and underflow protection scenarios were fully exercised using
  dedicated stress and boundary-condition testcases.

- Reset verification scenarios including:
      * Reset assertion
      * Reset deassertion
      * Reset transitions
      * Write after reset
      * Read after reset
  were successfully covered during regression execution.

- Concurrent FIFO operations including simultaneous READ and WRITE
  transactions were successfully exercised.

- FIFO state transition scenarios including:
      * EMPTY -> NOT_EMPTY
      * NOT_EMPTY -> EMPTY
      * FULL -> NOT_FULL
      * NOT_FULL -> FULL
  were completely verified.

Remaining Coverage Gaps
-----------------------
- Only 2 bins remain uncovered in the merged coverage database.

- Minor uncovered operation cross scenarios still exist in a few
  corner-case combinations, but they do not affect overall FIFO
  functional verification completeness.

Final Observation
-----------------
The merged functional coverage report confirms that the Synchronous FIFO
verification environment achieved near-complete functional verification.

All major FIFO operational scenarios including normal transactions,
boundary conditions, concurrent accesses, reset handling, overflow,
underflow, and transition behaviors were successfully exercised across
regression runs.

The final merged coverage achieved:
      Functional Coverage = 99.79%
      Bin Hit Percentage  = 98.68%

This indicates a highly stable and well-verified FIFO design.
```
---

# Console Output

```systemverilog
=================================================================================
#                                        ||                                                                             ||
#                                        ||                  SYNCHRONOUS FIFO VERIFICATION STARTED                      ||
#                                        ||                                                                             ||
#                                        =================================================================================
# 
#                                                  ============================================================
#                                                  |----------------- RUNNING RANDOMIZED  TEST ---------------|
#                                                  ============================================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
#                                            ============================================================
#                                            |-------------- RUNNING FULL WRITE-READ  TEST -------------|
#                                            ============================================================
# ===================================
#      RUNNING FULL WRITE TEST
# ===================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# ===================================
#      RUNNING FULL Read TEST 
# ===================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
#                                            ============================================================
#                                            |------------- RUNNING POINTER WRAP AROUND TEST -----------|
#                                            ============================================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
#                                            ============================================================
#                                            |------------- RUNNING OVERFLOW-UNDERFLOW TEST -----------|
#                                            ============================================================
#                                                       ===================================
#                                                             RUNNING OVERFLOW TEST
#                                                       ===================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#                                                      ===================================
#                                                            RUNNING UNDERFLOW TEST
#                                                      ===================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
#                                            ============================================================
#                                            |------------- RUNNING CONCURRENT BOUNDARY TEST -----------|
#                                            ============================================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
#                                            ============================================================
#                                            |------------- RUNNING CONTINUES CONCURRENT  TEST ----------|
#                                            ============================================================
# 
# ================================
#         DESIGN STATUS
# ================================
# Synchronous FIFO PASSED
# Total Errors = 0
# ================================
# 
# =============================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =============================================================================================================================================================================
# 
# 
# 
#     ################################################################
#     ##                                                            ##
#     ##                FINAL   SIMULATION   REPORT                 ##
#     ##                                                            ##
#     ################################################################
#     ##                                                            ##
#     ##     Total Tests Executed :  8                              ##
#     ##     Total Tests PASSED   :  8                              ##
#     ##     Total Tests FAILED   :  0                              ##
#     ##                                                            ##
#     ################################################################
#     ##                                                            ##
#     ##                 D E S I G N   P A S S E D                  ##
#     ##                                                            ##
#     ################################################################
```

---

# Functional Coverage Report

```bash

# =================================================================================
# === Instance: /design_sv_unit
# === Design Unit: work.design_sv_unit
# =================================================================================
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    99.79%
#         Coverpoints/Crosses         15        na        na        na
#             Covergroup Bins        152       150         2    98.68%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Coverage__1/FIFO_Cover           99.79%        100          -    Uncovered            
#     covered/total bins:                                   150        152          -                      
#     missing/total bins:                                     2        152          -                      
#     % Hit:                                             98.68%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                         304          1          -    Covered              
#         bin idle_w                                        104          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          248          1          -    Covered              
#         bin idle_r                                        160          1          -    Covered              
#     Coverpoint DATA_IN                                100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                       3          1          -    Covered              
#         bin auto[4:7]                                       9          1          -    Covered              
#         bin auto[8:11]                                      3          1          -    Covered              
#         bin auto[12:15]                                     7          1          -    Covered              
#         bin auto[16:19]                                     3          1          -    Covered              
#         bin auto[20:23]                                     5          1          -    Covered              
#         bin auto[24:27]                                     5          1          -    Covered              
#         bin auto[28:31]                                     9          1          -    Covered              
#         bin auto[32:35]                                     6          1          -    Covered              
#         bin auto[36:39]                                     3          1          -    Covered              
#         bin auto[40:43]                                     4          1          -    Covered              
#         bin auto[44:47]                                     2          1          -    Covered              
#         bin auto[48:51]                                     4          1          -    Covered              
#         bin auto[52:55]                                     7          1          -    Covered              
#         bin auto[56:59]                                     1          1          -    Covered              
#         bin auto[60:63]                                     1          1          -    Covered              
#         bin auto[64:67]                                     6          1          -    Covered              
#         bin auto[68:71]                                     7          1          -    Covered              
#         bin auto[72:75]                                     3          1          -    Covered              
#         bin auto[76:79]                                    10          1          -    Covered              
#         bin auto[80:83]                                     3          1          -    Covered              
#         bin auto[84:87]                                     8          1          -    Covered              
#         bin auto[88:91]                                     7          1          -    Covered              
#         bin auto[92:95]                                     6          1          -    Covered              
#         bin auto[96:99]                                     5          1          -    Covered              
#         bin auto[100:103]                                   6          1          -    Covered              
#         bin auto[104:107]                                   5          1          -    Covered              
#         bin auto[108:111]                                   8          1          -    Covered              
#         bin auto[112:115]                                   4          1          -    Covered              
#         bin auto[116:119]                                   7          1          -    Covered              
#         bin auto[120:123]                                   3          1          -    Covered              
#         bin auto[124:127]                                   4          1          -    Covered              
#         bin auto[128:131]                                   2          1          -    Covered              
#         bin auto[132:135]                                   5          1          -    Covered              
#         bin auto[136:139]                                   3          1          -    Covered              
#         bin auto[140:143]                                   7          1          -    Covered              
#         bin auto[144:147]                                   6          1          -    Covered              
#         bin auto[148:151]                                   8          1          -    Covered              
#         bin auto[152:155]                                   5          1          -    Covered              
#         bin auto[156:159]                                   4          1          -    Covered              
#         bin auto[160:163]                                   6          1          -    Covered              
#         bin auto[164:167]                                   3          1          -    Covered              
#         bin auto[168:171]                                   4          1          -    Covered              
#         bin auto[172:175]                                   3          1          -    Covered              
#         bin auto[176:179]                                   4          1          -    Covered              
#         bin auto[180:183]                                   5          1          -    Covered              
#         bin auto[184:187]                                   5          1          -    Covered              
#         bin auto[188:191]                                   4          1          -    Covered              
#         bin auto[192:195]                                   2          1          -    Covered              
#         bin auto[196:199]                                   6          1          -    Covered              
#         bin auto[200:203]                                   6          1          -    Covered              
#         bin auto[204:207]                                   2          1          -    Covered              
#         bin auto[208:211]                                   6          1          -    Covered              
#         bin auto[212:215]                                   3          1          -    Covered              
#         bin auto[216:219]                                   7          1          -    Covered              
#         bin auto[220:223]                                   3          1          -    Covered              
#         bin auto[224:227]                                   7          1          -    Covered              
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   5          1          -    Covered              
#         bin auto[236:239]                                   2          1          -    Covered              
#         bin auto[240:243]                                   6          1          -    Covered              
#         bin auto[244:247]                                   3          1          -    Covered              
#         bin auto[248:251]                                   4          1          -    Covered              
#         bin auto[252:255]                                   2          1          -    Covered              
#     Coverpoint DATA_OUT                                96.87%        100          -    Uncovered            
#         covered/total bins:                                62         64          -                      
#         missing/total bins:                                 2         64          -                      
#         % Hit:                                         96.87%        100          -                      
#         bin auto[0:3]                                      15          1          -    Covered              
#         bin auto[4:7]                                       8          1          -    Covered              
#         bin auto[8:11]                                      3          1          -    Covered              
#         bin auto[12:15]                                     5          1          -    Covered              
#         bin auto[16:19]                                     3          1          -    Covered              
#         bin auto[20:23]                                     2          1          -    Covered              
#         bin auto[24:27]                                     3          1          -    Covered              
#         bin auto[28:31]                                     7          1          -    Covered              
#         bin auto[32:35]                                     4          1          -    Covered              
#         bin auto[36:39]                                     3          1          -    Covered              
#         bin auto[40:43]                                     3          1          -    Covered              
#         bin auto[44:47]                                     1          1          -    Covered              
#         bin auto[48:51]                                     4          1          -    Covered              
#         bin auto[52:55]                                     5          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     7          1          -    Covered              
#         bin auto[68:71]                                     4          1          -    Covered              
#         bin auto[72:75]                                     3          1          -    Covered              
#         bin auto[76:79]                                     9          1          -    Covered              
#         bin auto[80:83]                                     3          1          -    Covered              
#         bin auto[84:87]                                     5          1          -    Covered              
#         bin auto[88:91]                                     5          1          -    Covered              
#         bin auto[92:95]                                     6          1          -    Covered              
#         bin auto[96:99]                                     5          1          -    Covered              
#         bin auto[100:103]                                   3          1          -    Covered              
#         bin auto[104:107]                                   3          1          -    Covered              
#         bin auto[108:111]                                  14          1          -    Covered              
#         bin auto[112:115]                                   3          1          -    Covered              
#         bin auto[116:119]                                   6          1          -    Covered              
#         bin auto[120:123]                                   2          1          -    Covered              
#         bin auto[124:127]                                   3          1          -    Covered              
#         bin auto[128:131]                                   2          1          -    Covered              
#         bin auto[132:135]                                   4          1          -    Covered              
#         bin auto[136:139]                                   2          1          -    Covered              
#         bin auto[140:143]                                   4          1          -    Covered              
#         bin auto[144:147]                                   4          1          -    Covered              
#         bin auto[148:151]                                   7          1          -    Covered              
#         bin auto[152:155]                                   4          1          -    Covered              
#         bin auto[156:159]                                   2          1          -    Covered              
#         bin auto[160:163]                                   5          1          -    Covered              
#         bin auto[164:167]                                   3          1          -    Covered              
#         bin auto[168:171]                                   3          1          -    Covered              
#         bin auto[172:175]                                   3          1          -    Covered              
#         bin auto[176:179]                                   2          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   4          1          -    Covered              
#         bin auto[188:191]                                   4          1          -    Covered              
#         bin auto[192:195]                                   2          1          -    Covered              
#         bin auto[196:199]                                   6          1          -    Covered              
#         bin auto[200:203]                                   2          1          -    Covered              
#         bin auto[204:207]                                   2          1          -    Covered              
#         bin auto[208:211]                                   4          1          -    Covered              
#         bin auto[212:215]                                   2          1          -    Covered              
#         bin auto[216:219]                                   5          1          -    Covered              
#         bin auto[220:223]                                   2          1          -    Covered              
#         bin auto[224:227]                                   2          1          -    Covered              
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   3          1          -    Covered              
#         bin auto[236:239]                                   2          1          -    Covered              
#         bin auto[240:243]                                   4          1          -    Covered              
#         bin auto[244:247]                                   3          1          -    Covered              
#         bin auto[248:251]                                   4          1          -    Covered              
#         bin auto[252:255]                                   2          1          -    Covered              
#     Coverpoint FULL                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                       368          1          -    Covered              
#         bin auto[1]                                        40          1          -    Covered              
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                       376          1          -    Covered              
#         bin auto[1]                                        32          1          -    Covered              
#     Coverpoint FULL_Transition                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin full_to_not_full                               15          1          -    Covered              
#         bin not_full_to_full                               16          1          -    Covered              
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                             12          1          -    Covered              
#         bin not_empty_to_empty                              9          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_when_full                                32          1          -    Covered              
#     Coverpoint UNDERFLOW_ATTEMPT                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_when_empty                                14          1          -    Covered              
#     Coverpoint RESET                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin asserted                                        4          1          -    Covered              
#         bin de_asserted                                   404          1          -    Covered              
#     Coverpoint RESET_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin assert_to_deassert                              3          1          -    Covered              
#         bin deassert_to_assert                              3          1          -    Covered              
#     Coverpoint Write_AFTER_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_after_rst                                 3          1          -    Covered              
#     Coverpoint Read_AFTER_RESET                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_after_rst                                  2          1          -    Covered              
#     Cross OPERATIONS                                  100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,read>                              161          1          -    Covered              
#             bin <write,idle_r>                            143          1          -    Covered              
#             bin <idle_w,read>                              87          1          -    Covered              
#             bin <idle_w,idle_r>                            17          1          -    Covered              
#  Covergroup instance 
# ========================================================================================
# 	RANDOM
# ======================================================================================== 
#                                                        92.70%        100          -    Uncovered            
#     covered/total bins:                                    97        152          -                      
#     missing/total bins:                                    55        152          -                      
#     % Hit:                                             63.81%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                          99          1          -    Covered              
#         bin idle_w                                          3          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           43          1          -    Covered              
#         bin idle_r                                         59          1          -    Covered              
#     Coverpoint DATA_IN                                 70.31%        100          -    Uncovered            
#         covered/total bins:                                45         64          -                      
#         missing/total bins:                                19         64          -                      
#         % Hit:                                         70.31%        100          -                      
#         bin auto[0:3]                                       0          1          -    ZERO                 
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      1          1          -    Covered              
#         bin auto[12:15]                                     5          1          -    Covered              
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     4          1          -    Covered              
#         bin auto[24:27]                                     4          1          -    Covered              
#         bin auto[28:31]                                     4          1          -    Covered              
#         bin auto[32:35]                                     3          1          -    Covered              
#         bin auto[36:39]                                     2          1          -    Covered              
#         bin auto[40:43]                                     3          1          -    Covered              
#         bin auto[44:47]                                     1          1          -    Covered              
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     3          1          -    Covered              
#         bin auto[56:59]                                     1          1          -    Covered              
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     3          1          -    Covered              
#         bin auto[68:71]                                     2          1          -    Covered              
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     3          1          -    Covered              
#         bin auto[88:91]                                     2          1          -    Covered              
#         bin auto[92:95]                                     2          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   3          1          -    Covered              
#         bin auto[104:107]                                   2          1          -    Covered              
#         bin auto[108:111]                                   1          1          -    Covered              
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   3          1          -    Covered              
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   2          1          -    Covered              
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   2          1          -    Covered              
#         bin auto[160:163]                                   2          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   1          1          -    Covered              
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   2          1          -    Covered              
#         bin auto[180:183]                                   3          1          -    Covered              
#         bin auto[184:187]                                   2          1          -    Covered              
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   1          1          -    Covered              
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   3          1          -    Covered              
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   3          1          -    Covered              
#         bin auto[212:215]                                   1          1          -    Covered              
#         bin auto[216:219]                                   3          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   3          1          -    Covered              
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   2          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   3          1          -    Covered              
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint DATA_OUT                                45.31%        100          -    Uncovered            
#         covered/total bins:                                29         64          -                      
#         missing/total bins:                                35         64          -                      
#         % Hit:                                         45.31%        100          -                      
#         bin auto[0:3]                                       6          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      1          1          -    Covered              
#         bin auto[12:15]                                     3          1          -    Covered              
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     1          1          -    Covered              
#         bin auto[24:27]                                     2          1          -    Covered              
#         bin auto[28:31]                                     2          1          -    Covered              
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     2          1          -    Covered              
#         bin auto[40:43]                                     2          1          -    Covered              
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     2          1          -    Covered              
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     2          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   1          1          -    Covered              
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   2          1          -    Covered              
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   1          1          -    Covered              
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   1          1          -    Covered              
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   1          1          -    Covered              
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   1          1          -    Covered              
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   1          1          -    Covered              
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   1          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   1          1          -    Covered              
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint FULL                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        78          1          -    Covered              
#         bin auto[1]                                        24          1          -    Covered              
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        96          1          -    Covered              
#         bin auto[1]                                         6          1          -    Covered              
#     Coverpoint FULL_Transition                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin full_to_not_full                               12          1          -    Covered              
#         bin not_full_to_full                               13          1          -    Covered              
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                              4          1          -    Covered              
#         bin not_empty_to_empty                              3          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_when_full                                22          1          -    Covered              
#     Coverpoint UNDERFLOW_ATTEMPT                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_when_empty                                 2          1          -    Covered              
#     Coverpoint RESET                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin asserted                                        4          1          -    Covered              
#         bin de_asserted                                    98          1          -    Covered              
#     Coverpoint RESET_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin assert_to_deassert                              3          1          -    Covered              
#         bin deassert_to_assert                              3          1          -    Covered              
#     Coverpoint Write_AFTER_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_after_rst                                 3          1          -    Covered              
#     Coverpoint Read_AFTER_RESET                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_after_rst                                  2          1          -    Covered              
#     Cross OPERATIONS                                   75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             3          1          -    Covered              
#             bin <write,idle_r>                             56          1          -    Covered              
#             bin <write,read>                               43          1          -    Covered              
#             bin <idle_w,read>                               0          1          1    ZERO                 
#  Covergroup instance 
# ========================================================================================
# 	Full_Read_Write
# ======================================================================================== 
#                                                        50.83%        100          -    Uncovered            
#     covered/total bins:                                    40        152          -                      
#     missing/total bins:                                   112        152          -                      
#     % Hit:                                             26.31%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                          16          1          -    Covered              
#         bin idle_w                                         20          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           16          1          -    Covered              
#         bin idle_r                                         20          1          -    Covered              
#     Coverpoint DATA_IN                                 18.75%        100          -    Uncovered            
#         covered/total bins:                                12         64          -                      
#         missing/total bins:                                52         64          -                      
#         % Hit:                                         18.75%        100          -                      
#         bin auto[0:3]                                       0          1          -    ZERO                 
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     2          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     2          1          -    Covered              
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   2          1          -    Covered              
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   1          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint DATA_OUT                                18.75%        100          -    Uncovered            
#         covered/total bins:                                12         64          -                      
#         missing/total bins:                                52         64          -                      
#         % Hit:                                         18.75%        100          -                      
#         bin auto[0:3]                                       1          1          -    Covered              
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     2          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     2          1          -    Covered              
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   2          1          -    Covered              
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   1          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint FULL                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        33          1          -    Covered              
#         bin auto[1]                                         3          1          -    Covered              
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        33          1          -    Covered              
#         bin auto[1]                                         3          1          -    Covered              
#     Coverpoint FULL_Transition                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin full_to_not_full                                1          1          -    Covered              
#         bin not_full_to_full                                1          1          -    Covered              
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                              1          1          -    Covered              
#         bin not_empty_to_empty                              1          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_when_full                                 0          1          -    ZERO                 
#     Coverpoint UNDERFLOW_ATTEMPT                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_when_empty                                 0          1          -    ZERO                 
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                    36          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_to_deassert                              0          1          -    ZERO                 
#         bin deassert_to_assert                              0          1          -    ZERO                 
#     Coverpoint Write_AFTER_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_rst                                 0          1          -    ZERO                 
#     Coverpoint Read_AFTER_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_rst                                  0          1          -    ZERO                 
#     Cross OPERATIONS                                   75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             4          1          -    Covered              
#             bin <write,idle_r>                             16          1          -    Covered              
#             bin <idle_w,read>                              16          1          -    Covered              
#             bin <write,read>                                0          1          1    ZERO                 
#  Covergroup instance 
# ========================================================================================
# 	Pointer_Wrap_Around
# ======================================================================================== 
#                                                        43.33%        100          -    Uncovered            
#     covered/total bins:                                    61        152          -                      
#     missing/total bins:                                    91        152          -                      
#     % Hit:                                             40.13%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                          30          1          -    Covered              
#         bin idle_w                                         32          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           30          1          -    Covered              
#         bin idle_r                                         32          1          -    Covered              
#     Coverpoint DATA_IN                                 37.50%        100          -    Uncovered            
#         covered/total bins:                                24         64          -                      
#         missing/total bins:                                40         64          -                      
#         % Hit:                                         37.50%        100          -                      
#         bin auto[0:3]                                       0          1          -    ZERO                 
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     1          1          -    Covered              
#         bin auto[48:51]                                     2          1          -    Covered              
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     1          1          -    Covered              
#         bin auto[84:87]                                     3          1          -    Covered              
#         bin auto[88:91]                                     1          1          -    Covered              
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   1          1          -    Covered              
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   1          1          -    Covered              
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   1          1          -    Covered              
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   2          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   1          1          -    Covered              
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint DATA_OUT                                37.50%        100          -    Uncovered            
#         covered/total bins:                                24         64          -                      
#         missing/total bins:                                40         64          -                      
#         % Hit:                                         37.50%        100          -                      
#         bin auto[0:3]                                       1          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     1          1          -    Covered              
#         bin auto[48:51]                                     2          1          -    Covered              
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     1          1          -    Covered              
#         bin auto[84:87]                                     3          1          -    Covered              
#         bin auto[88:91]                                     1          1          -    Covered              
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   1          1          -    Covered              
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   1          1          -    Covered              
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   2          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   1          1          -    Covered              
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint FULL                                    50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                        62          1          -    Covered              
#         bin auto[1]                                         0          1          -    ZERO                 
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        57          1          -    Covered              
#         bin auto[1]                                         5          1          -    Covered              
#     Coverpoint FULL_Transition                          0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin full_to_not_full                                0          1          -    ZERO                 
#         bin not_full_to_full                                0          1          -    ZERO                 
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                              3          1          -    Covered              
#         bin not_empty_to_empty                              3          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_when_full                                 0          1          -    ZERO                 
#     Coverpoint UNDERFLOW_ATTEMPT                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_when_empty                                 0          1          -    ZERO                 
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                    62          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_to_deassert                              0          1          -    ZERO                 
#         bin deassert_to_assert                              0          1          -    ZERO                 
#     Coverpoint Write_AFTER_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_rst                                 0          1          -    ZERO                 
#     Coverpoint Read_AFTER_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_rst                                  0          1          -    ZERO                 
#     Cross OPERATIONS                                   75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             2          1          -    Covered              
#             bin <write,idle_r>                             30          1          -    Covered              
#             bin <idle_w,read>                              30          1          -    Covered              
#             bin <write,read>                                0          1          1    ZERO                 
#  Covergroup instance 
# ========================================================================================
# 	OVERFLOW_UNDERFLOW
# ======================================================================================== 
#                                                        65.20%        100          -    Uncovered            
#     covered/total bins:                                    52        152          -                      
#     missing/total bins:                                   100        152          -                      
#     % Hit:                                             34.21%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                          25          1          -    Covered              
#         bin idle_w                                         29          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           25          1          -    Covered              
#         bin idle_r                                         29          1          -    Covered              
#     Coverpoint DATA_IN                                 31.25%        100          -    Uncovered            
#         covered/total bins:                                20         64          -                      
#         missing/total bins:                                44         64          -                      
#         % Hit:                                         31.25%        100          -                      
#         bin auto[0:3]                                       1          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     1          1          -    Covered              
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     1          1          -    Covered              
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     1          1          -    Covered              
#         bin auto[76:79]                                     2          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   2          1          -    Covered              
#         bin auto[108:111]                                   2          1          -    Covered              
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   3          1          -    Covered              
#         bin auto[144:147]                                   1          1          -    Covered              
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   1          1          -    Covered              
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   1          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint DATA_OUT                                21.87%        100          -    Uncovered            
#         covered/total bins:                                14         64          -                      
#         missing/total bins:                                50         64          -                      
#         % Hit:                                         21.87%        100          -                      
#         bin auto[0:3]                                       2          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     1          1          -    Covered              
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     1          1          -    Covered              
#         bin auto[76:79]                                     2          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                  10          1          -    Covered              
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   1          1          -    Covered              
#         bin auto[144:147]                                   1          1          -    Covered              
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint FULL                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        42          1          -    Covered              
#         bin auto[1]                                        12          1          -    Covered              
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        42          1          -    Covered              
#         bin auto[1]                                        12          1          -    Covered              
#     Coverpoint FULL_Transition                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin full_to_not_full                                1          1          -    Covered              
#         bin not_full_to_full                                1          1          -    Covered              
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                              1          1          -    Covered              
#         bin not_empty_to_empty                              1          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_when_full                                 9          1          -    Covered              
#     Coverpoint UNDERFLOW_ATTEMPT                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_when_empty                                 9          1          -    Covered              
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                    54          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_to_deassert                              0          1          -    ZERO                 
#         bin deassert_to_assert                              0          1          -    ZERO                 
#     Coverpoint Write_AFTER_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_rst                                 0          1          -    ZERO                 
#     Coverpoint Read_AFTER_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_rst                                  0          1          -    ZERO                 
#     Cross OPERATIONS                                   75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             4          1          -    Covered              
#             bin <write,idle_r>                             25          1          -    Covered              
#             bin <idle_w,read>                              25          1          -    Covered              
#             bin <write,read>                                0          1          1    ZERO                 
#  Covergroup instance 
# ========================================================================================
# 	Concurrent_Boundary_Collision
# ======================================================================================== 
#                                                        68.85%        100          -    Uncovered            
#     covered/total bins:                                    72        152          -                      
#     missing/total bins:                                    80        152          -                      
#     % Hit:                                             47.36%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                          34          1          -    Covered              
#         bin idle_w                                         18          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           34          1          -    Covered              
#         bin idle_r                                         18          1          -    Covered              
#     Coverpoint DATA_IN                                 42.18%        100          -    Uncovered            
#         covered/total bins:                                27         64          -                      
#         missing/total bins:                                37         64          -                      
#         % Hit:                                         42.18%        100          -                      
#         bin auto[0:3]                                       0          1          -    ZERO                 
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     2          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     2          1          -    Covered              
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     1          1          -    Covered              
#         bin auto[88:91]                                     1          1          -    Covered              
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     2          1          -    Covered              
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   2          1          -    Covered              
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   1          1          -    Covered              
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   2          1          -    Covered              
#         bin auto[184:187]                                   1          1          -    Covered              
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   1          1          -    Covered              
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   1          1          -    Covered              
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint DATA_OUT                                40.62%        100          -    Uncovered            
#         covered/total bins:                                26         64          -                      
#         missing/total bins:                                38         64          -                      
#         % Hit:                                         40.62%        100          -                      
#         bin auto[0:3]                                       1          1          -    Covered              
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     2          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     4          1          -    Covered              
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     1          1          -    Covered              
#         bin auto[88:91]                                     1          1          -    Covered              
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     2          1          -    Covered              
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   2          1          -    Covered              
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   1          1          -    Covered              
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   1          1          -    Covered              
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   1          1          -    Covered              
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint FULL                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        51          1          -    Covered              
#         bin auto[1]                                         1          1          -    Covered              
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                        48          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#     Coverpoint FULL_Transition                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin full_to_not_full                                1          1          -    Covered              
#         bin not_full_to_full                                1          1          -    Covered              
#     Coverpoint EMPTY_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin empty_to_not_empty                              2          1          -    Covered              
#         bin not_empty_to_empty                              1          1          -    Covered              
#     Coverpoint OVERFLOW_ATTEMPT                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_when_full                                 1          1          -    Covered              
#     Coverpoint UNDERFLOW_ATTEMPT                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_when_empty                                 2          1          -    Covered              
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                    52          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_to_deassert                              0          1          -    ZERO                 
#         bin deassert_to_assert                              0          1          -    ZERO                 
#     Coverpoint Write_AFTER_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_rst                                 0          1          -    ZERO                 
#     Coverpoint Read_AFTER_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_rst                                  0          1          -    ZERO                 
#     Cross OPERATIONS                                  100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             2          1          -    Covered              
#             bin <write,idle_r>                             16          1          -    Covered              
#             bin <idle_w,read>                              16          1          -    Covered              
#             bin <write,read>                               18          1          -    Covered              
#  Covergroup instance 
# ========================================================================================
# 	Continues_Concurrent
# ======================================================================================== 
#                                                        50.41%        100          -    Uncovered            
#     covered/total bins:                                   112        152          -                      
#     missing/total bins:                                    40        152          -                      
#     % Hit:                                             73.68%        100          -                      
#     Coverpoint Write_EN                               100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write                                         100          1          -    Covered              
#         bin idle_w                                          2          1          -    Covered              
#     Coverpoint Read_EN                                100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          100          1          -    Covered              
#         bin idle_r                                          2          1          -    Covered              
#     Coverpoint DATA_IN                                 78.12%        100          -    Uncovered            
#         covered/total bins:                                50         64          -                      
#         missing/total bins:                                14         64          -                      
#         % Hit:                                         78.12%        100          -                      
#         bin auto[0:3]                                       2          1          -    Covered              
#         bin auto[4:7]                                       7          1          -    Covered              
#         bin auto[8:11]                                      2          1          -    Covered              
#         bin auto[12:15]                                     2          1          -    Covered              
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     1          1          -    Covered              
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     3          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     1          1          -    Covered              
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     2          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     1          1          -    Covered              
#         bin auto[68:71]                                     2          1          -    Covered              
#         bin auto[72:75]                                     2          1          -    Covered              
#         bin auto[76:79]                                     4          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     1          1          -    Covered              
#         bin auto[88:91]                                     3          1          -    Covered              
#         bin auto[92:95]                                     3          1          -    Covered              
#         bin auto[96:99]                                     3          1          -    Covered              
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                   4          1          -    Covered              
#         bin auto[112:115]                                   2          1          -    Covered              
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   2          1          -    Covered              
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   2          1          -    Covered              
#         bin auto[164:167]                                   3          1          -    Covered              
#         bin auto[168:171]                                   3          1          -    Covered              
#         bin auto[172:175]                                   2          1          -    Covered              
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   2          1          -    Covered              
#         bin auto[188:191]                                   3          1          -    Covered              
#         bin auto[192:195]                                   1          1          -    Covered              
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   1          1          -    Covered              
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   2          1          -    Covered              
#         bin auto[212:215]                                   1          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   2          1          -    Covered              
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   2          1          -    Covered              
#         bin auto[236:239]                                   2          1          -    Covered              
#         bin auto[240:243]                                   3          1          -    Covered              
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   3          1          -    Covered              
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint DATA_OUT                                78.12%        100          -    Uncovered            
#         covered/total bins:                                50         64          -                      
#         missing/total bins:                                14         64          -                      
#         % Hit:                                         78.12%        100          -                      
#         bin auto[0:3]                                       4          1          -    Covered              
#         bin auto[4:7]                                       6          1          -    Covered              
#         bin auto[8:11]                                      2          1          -    Covered              
#         bin auto[12:15]                                     2          1          -    Covered              
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     1          1          -    Covered              
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     3          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     1          1          -    Covered              
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     2          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     1          1          -    Covered              
#         bin auto[68:71]                                     2          1          -    Covered              
#         bin auto[72:75]                                     2          1          -    Covered              
#         bin auto[76:79]                                     4          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     1          1          -    Covered              
#         bin auto[88:91]                                     3          1          -    Covered              
#         bin auto[92:95]                                     3          1          -    Covered              
#         bin auto[96:99]                                     3          1          -    Covered              
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                   4          1          -    Covered              
#         bin auto[112:115]                                   2          1          -    Covered              
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   2          1          -    Covered              
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   2          1          -    Covered              
#         bin auto[164:167]                                   3          1          -    Covered              
#         bin auto[168:171]                                   3          1          -    Covered              
#         bin auto[172:175]                                   2          1          -    Covered              
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   2          1          -    Covered              
#         bin auto[188:191]                                   3          1          -    Covered              
#         bin auto[192:195]                                   1          1          -    Covered              
#         bin auto[196:199]                                   2          1          -    Covered              
#         bin auto[200:203]                                   1          1          -    Covered              
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   2          1          -    Covered              
#         bin auto[212:215]                                   1          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   2          1          -    Covered              
#         bin auto[236:239]                                   2          1          -    Covered              
#         bin auto[240:243]                                   3          1          -    Covered              
#         bin auto[244:247]                                   1          1          -    Covered              
#         bin auto[248:251]                                   3          1          -    Covered              
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint FULL                                    50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                       102          1          -    Covered              
#         bin auto[1]                                         0          1          -    ZERO                 
#     Coverpoint EMPTY                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                       100          1          -    Covered              
#         bin auto[1]                                         2          1          -    Covered              
#     Coverpoint FULL_Transition                          0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin full_to_not_full                                0          1          -    ZERO                 
#         bin not_full_to_full                                0          1          -    ZERO                 
#     Coverpoint EMPTY_Transition                        50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin empty_to_not_empty                              1          1          -    Covered              
#         bin not_empty_to_empty                              0          1          -    ZERO                 
#     Coverpoint OVERFLOW_ATTEMPT                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_when_full                                 0          1          -    ZERO                 
#     Coverpoint UNDERFLOW_ATTEMPT                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_when_empty                                 1          1          -    Covered              
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                   102          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_to_deassert                              0          1          -    ZERO                 
#         bin deassert_to_assert                              0          1          -    ZERO                 
#     Coverpoint Write_AFTER_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_rst                                 0          1          -    ZERO                 
#     Coverpoint Read_AFTER_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_rst                                  0          1          -    ZERO                 
#     Cross OPERATIONS                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 2          4          -                      
#         missing/total bins:                                 2          4          -                      
#         % Hit:                                         50.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <idle_w,idle_r>                             2          1          -    Covered              
#             bin <write,read>                              100          1          -    Covered              
#             bin <write,idle_r>                              0          1          1    ZERO                 
#             bin <idle_w,read>                               0          1          1    ZERO                 
```
---
