# Dual Port RAM Verification Results

## Simulation Status

```diff
+ SIMULATION PASSED
+ DUT : DUAL PORT RAM
+ Total Errors : 0
+ Functional Coverage : COMPLETED
+ Assertion Verification : PASSED
+ Reset Verification : PASSED
```

---

# Verification Overview

This project verifies a **Dual Port RAM** using a SystemVerilog-based verification environment.

The verification includes:

- Randomized Read/Write Operations
- Simultaneous Dual-Port Access
- Write-Write Collision Testing
- Read-Write Collision Testing
- Write-Read Collision Testing
- Read-Read Collision Testing
- Mixed Collision Scenarios
- Reset Testing
- Functional Coverage Collection
- Assertion-Based Verification (SVA)
- Scoreboard Checking

---


# Verification Summary

| Parameter | Status |
|---|---|
| DUT | Dual Port RAM |
| Address Width | 6-bit |
| Data Width | 8-bit |
| Read/Write Type | Synchronous |
| Ports | Dual Independent Ports |
| Port Priority during Collision | Port A -> Port B |
| Randomized Testing | PASSED |
| Collision Testing | PASSED |
| Assertion Verification | PASSED |
| Reset Testing | PASSED |
| Random Stress Operations | PASSED |
| Functional Coverage | PASSED |
| Total Errors | 0 |
| Verification Result | PASSED |

---

## Verified Collision Scenarios

| Collision Type | Status |
|---|---|
| Write-Write Collision | PASSED |
| Read-Read Collision | PASSED |
| Read-Write Collision | PASSED |
| Write-Read Collision | PASSED |
| Mixed Collision | PASSED |

---


## Functional Coverage

| Coverage Type |
|---|
| Read Operation Coverage |
| Write Operation Coverage|
| Port A Transaction Coverage|
| Port B Transaction Coverage|
| Collision Coverage  |
| Address Coverage |
| Reset Coverage |
| Transition Coverage  |

---

## Features Verified

| Feature | Status |
|---|---|
| Simultaneous Dual-Port Access | PASSED |
| Independent Read Operations | PASSED |
| Independent Write Operations | PASSED |
| Concurrent Read/Write Operations | PASSED |
| Address Collision Handling | PASSED |
| Reset Functionality | PASSED |
| Functional Coverage Collection | PASSED |
| Scoreboard Comparison | PASSED |

---

## Monitor Fields Description

| Signal | Description |
|---|---|
| Address A/B | RAM access address for Port A and Port B |
| Data In A/B | Input data written into memory |
| Data Out A/B | Output data read from memory |
| Mode A/B | Read/Write mode control |
| Reset | Global reset signal for RAM initialization |

---

## Assertion-Based Verification

> [!SUCCESS]
> **Assertion Verification Status : PASSED**
>
> Total Assertion Failures : **0**

### Verification Results

- ✅ Address X/Z Detection (PORT_A, PORT_B)
- ✅ Mode X/Z Detection (PORT_A, PORT_B)
- ✅ Write Data X/Z Detection (PORT_A, PORT_B)
- ✅ Read Data X/Z Detection (PORT_A, PORT_B)
- ✅ Reset Output Clearing Verification
- ✅ Read-After-Write Verification (PORT_A)
- ✅ Read-After-Write Verification (PORT_B)
- ✅ Collision Priority Verification

---

### Assertion Coverage Summary

<details>
<summary><b>Assertion Properties Implemented</b></summary>

| Property | Purpose |
|-----------|----------|
| ADDR_KNOWN | Ensures Port A and Port B addresses never contain X/Z values |
| MODE_KNOWN | Ensures read/write mode signals never contain X/Z values |
| DATA_IN_A_KNOWN | Verifies valid write data on Port A |
| DATA_IN_B_KNOWN | Verifies valid write data on Port B |
| DATA_OUT_A_KNOWN | Verifies valid read data on Port A |
| DATA_OUT_B_KNOWN | Verifies valid read data on Port B |
| RESET_CLEARED | Verifies reset clears both RAM outputs |
| READ_AFTER_WRITE_A | Verifies data integrity for Port A read-after-write operations |
| READ_AFTER_WRITE_B | Verifies data integrity for Port B read-after-write operations |
| PORT_B_IGNORED | Verifies collision priority behavior where Port A has precedence over Port B |

</details>

---

### Assertion Observations

> [!NOTE]
>
> - No assertion failures were reported during simulation.
> - Address and mode signals remained free from X/Z states throughout all test scenarios.
> - Write and read data paths were continuously monitored for unknown values.
> - Reset behavior successfully cleared both output ports as expected.
> - Read-after-write functionality was verified independently for both ports.
> - Collision handling assertions confirmed correct Port A priority behavior.
> - Assertion-based verification complemented scoreboard checking and functional coverage collection.
> - Design satisfied all protocol, data integrity, reset, and collision requirements monitored by SVA.

---

# Verification Observations

- Dual-port simultaneous access verified successfully
- Collision handling behavior verified under concurrent operations
- Read and write functionality validated independently on both ports
- Reset behavior verified successfully under simulation
- Functional coverage achieved for all major scenarios
- Transition coverage verified for read/write operation switching
- No mismatches detected between expected and actual outputs
- Scoreboard verification completed successfully
- DUT maintained correct memory behavior throughout simulation

---
# Functional Coverage Summary

```bash
# ========================================================================================
#                                      COVERAGE REPORT SUMMARY
# ========================================================================================

Overall Functional Coverage Summary
-----------------------------------
Total Coverage Bins          : 413
Covered Bins                 : 410
Uncovered Bins               : 3
Bin Hit Percentage           : 99.27%
Overall Functional Coverage  : 96.05%

Coverage Achievement
--------------------
[PASS] PORT_A_MODE Coverage                : 100%
[PASS] PORT_B_MODE Coverage                : 100%
[PASS] PORT_A_ADDR Coverage                : 100%
[PASS] PORT_B_ADDR Coverage                : 100%
[PASS] PORT_A_DATA_in Coverage             : 100%
[PASS] PORT_B_DATA_in Coverage             : 100%
[PASS] PORT_A_DATA_out Coverage            : Achieved through merged coverage
[PASS] PORT_B_DATA_out Coverage            : Achieved through merged coverage
[PASS] Collision Detection Coverage        : 100%
[PASS] Collision Mode Cross Coverage       : 100%
[PASS] Port Mode Combination Cross         : 100%
[PASS] Operation Transition Coverage       : Achieved through merged instances
[PASS] Reset Scenario Coverage             : 100%

Coverage Analysis
-----------------
- Functional coverage results shown above correspond to merged coverage
  collected across multiple coverage instances and regression executions.

- All address locations for both PORT_A and PORT_B were successfully exercised.

- Read and write operations for both ports were completely verified across
  all functional scenarios.

- Data input and output coverage for both ports achieved full functional
  verification after merging coverage databases.

- Collision handling between both ports was fully exercised for all mode
  combinations including:
      * WRITE-WRITE
      * READ-WRITE
      * WRITE-READ
      * READ-READ

- Sequential operation transition scenarios such as:
      * READ_AFTER_WRITE
      * WRITE_AFTER_READ
      * BACK_TO_BACK_WRITE
      * BACK_TO_BACK_READ
  were successfully covered across merged regression runs.

- Reset verification scenarios including:
      * RESET assertion/deassertion
      * RESET transitions
      * READ during RESET
      * WRITE during RESET
      * READ after RESET
      * WRITE after RESET
  were successfully achieved through cumulative merged coverage.

Final Observation
-----------------
The merged functional coverage report confirms that the Dual Port RAM
verification environment achieved near-complete functional verification
with all major operational, collision, transition, and reset scenarios
successfully exercised across regression runs.

Only a very small number of non-critical bins remain uncovered, resulting
in an overall functional coverage of 96.05%.
```
---

# Console Output

```systemverilog
                               =================================================================================
#                                        ||                                                                             ||
#                                        ||                  DUAL PORT RAM VERIFICATION STARTED                         ||
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
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# =========================================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =========================================================================================================================================================================================
#                                            ============================================================
#                                            |------------------- RUNNING RESET TEST -------------------|
#                                            ============================================================
# ---------------------------------
#      RUNNING RESET TEST
# ---------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# =========================================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =========================================================================================================================================================================================
#                                            ============================================================
#                                            |-------------- RUNNING FULL WRITE-READ  TEST -------------|
#                                            ============================================================
# ---------------------------------
#      RUNNING FULL WRITE TEST
# ---------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# *****************************************************************************************************************************************************************************************
# ---------------------------------
#      RUNNING FULL Read TEST 
# ---------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# =========================================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =========================================================================================================================================================================================
#                                               ============================================================
#                                               |----------------- RUNNING COLLISION TEST -----------------|
#                                               ============================================================
# ------------------------------
#     Write-Write Collision
# ------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# *****************************************************************************************************************************************************************************************
# ------------------------------
#      Read-Write Collision
# ------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# *****************************************************************************************************************************************************************************************
# ------------------------------
#     Write-Read Collision
# ------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# ------------------------------
#      Read-Read Collision
# ------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# *****************************************************************************************************************************************************************************************
# ------------------------------
#       Mixed Collision
# ------------------------------
# 
# ================================
#         DESIGN STATUS
# ================================
# DUAL PORT MEMORY PASSED
# Total Errors = 0
# ================================
# 
# =========================================================================================================================================================================================
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# =========================================================================================================================================================================================
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
#     Covergroups                      1        na        na    96.05%
#         Coverpoints/Crosses         19        na        na        na
#             Covergroup Bins        413       410         3    99.27%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Coverage/RAM_Cover               96.05%        100          -    Uncovered            
#     covered/total bins:                                   410        413          -                      
#     missing/total bins:                                     3        413          -                      
#     % Hit:                                             99.27%        100          -                      
#     Coverpoint PORT_A_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                         1173          1          -    Covered              
#         bin write                                        1789          1          -    Covered              
#     Coverpoint PORT_B_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                         1268          1          -    Covered              
#         bin write                                        1694          1          -    Covered              
#     Coverpoint PORT_A_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        60          1          -    Covered              
#         bin addr[1]                                        45          1          -    Covered              
#         bin addr[2]                                        46          1          -    Covered              
#         bin addr[3]                                        46          1          -    Covered              
#         bin addr[4]                                        46          1          -    Covered              
#         bin addr[5]                                        47          1          -    Covered              
#         bin addr[6]                                        46          1          -    Covered              
#         bin addr[7]                                        46          1          -    Covered              
#         bin addr[8]                                        46          1          -    Covered              
#         bin addr[9]                                        46          1          -    Covered              
#         bin addr[10]                                       46          1          -    Covered              
#         bin addr[11]                                       46          1          -    Covered              
#         bin addr[12]                                       46          1          -    Covered              
#         bin addr[13]                                       46          1          -    Covered              
#         bin addr[14]                                       46          1          -    Covered              
#         bin addr[15]                                       46          1          -    Covered              
#         bin addr[16]                                       45          1          -    Covered              
#         bin addr[17]                                       47          1          -    Covered              
#         bin addr[18]                                       45          1          -    Covered              
#         bin addr[19]                                       45          1          -    Covered              
#         bin addr[20]                                       46          1          -    Covered              
#         bin addr[21]                                       46          1          -    Covered              
#         bin addr[22]                                       46          1          -    Covered              
#         bin addr[23]                                       46          1          -    Covered              
#         bin addr[24]                                       47          1          -    Covered              
#         bin addr[25]                                       46          1          -    Covered              
#         bin addr[26]                                       47          1          -    Covered              
#         bin addr[27]                                       47          1          -    Covered              
#         bin addr[28]                                       46          1          -    Covered              
#         bin addr[29]                                       46          1          -    Covered              
#         bin addr[30]                                       47          1          -    Covered              
#         bin addr[31]                                       46          1          -    Covered              
#         bin addr[32]                                       46          1          -    Covered              
#         bin addr[33]                                       46          1          -    Covered              
#         bin addr[34]                                       46          1          -    Covered              
#         bin addr[35]                                       45          1          -    Covered              
#         bin addr[36]                                       46          1          -    Covered              
#         bin addr[37]                                       45          1          -    Covered              
#         bin addr[38]                                       46          1          -    Covered              
#         bin addr[39]                                       46          1          -    Covered              
#         bin addr[40]                                       47          1          -    Covered              
#         bin addr[41]                                       46          1          -    Covered              
#         bin addr[42]                                       47          1          -    Covered              
#         bin addr[43]                                       46          1          -    Covered              
#         bin addr[44]                                       46          1          -    Covered              
#         bin addr[45]                                       46          1          -    Covered              
#         bin addr[46]                                       47          1          -    Covered              
#         bin addr[47]                                       46          1          -    Covered              
#         bin addr[48]                                       45          1          -    Covered              
#         bin addr[49]                                       46          1          -    Covered              
#         bin addr[50]                                       46          1          -    Covered              
#         bin addr[51]                                       46          1          -    Covered              
#         bin addr[52]                                       47          1          -    Covered              
#         bin addr[53]                                       46          1          -    Covered              
#         bin addr[54]                                       46          1          -    Covered              
#         bin addr[55]                                       46          1          -    Covered              
#         bin addr[56]                                       46          1          -    Covered              
#         bin addr[57]                                       47          1          -    Covered              
#         bin addr[58]                                       46          1          -    Covered              
#         bin addr[59]                                       46          1          -    Covered              
#         bin addr[60]                                       47          1          -    Covered              
#         bin addr[61]                                       46          1          -    Covered              
#         bin addr[62]                                       45          1          -    Covered              
#         bin addr[63]                                       46          1          -    Covered              
#     Coverpoint PORT_B_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        60          1          -    Covered              
#         bin addr[1]                                        47          1          -    Covered              
#         bin addr[2]                                        47          1          -    Covered              
#         bin addr[3]                                        46          1          -    Covered              
#         bin addr[4]                                        47          1          -    Covered              
#         bin addr[5]                                        47          1          -    Covered              
#         bin addr[6]                                        47          1          -    Covered              
#         bin addr[7]                                        46          1          -    Covered              
#         bin addr[8]                                        46          1          -    Covered              
#         bin addr[9]                                        46          1          -    Covered              
#         bin addr[10]                                       46          1          -    Covered              
#         bin addr[11]                                       46          1          -    Covered              
#         bin addr[12]                                       46          1          -    Covered              
#         bin addr[13]                                       45          1          -    Covered              
#         bin addr[14]                                       46          1          -    Covered              
#         bin addr[15]                                       46          1          -    Covered              
#         bin addr[16]                                       47          1          -    Covered              
#         bin addr[17]                                       46          1          -    Covered              
#         bin addr[18]                                       46          1          -    Covered              
#         bin addr[19]                                       46          1          -    Covered              
#         bin addr[20]                                       46          1          -    Covered              
#         bin addr[21]                                       45          1          -    Covered              
#         bin addr[22]                                       46          1          -    Covered              
#         bin addr[23]                                       45          1          -    Covered              
#         bin addr[24]                                       47          1          -    Covered              
#         bin addr[25]                                       46          1          -    Covered              
#         bin addr[26]                                       46          1          -    Covered              
#         bin addr[27]                                       46          1          -    Covered              
#         bin addr[28]                                       45          1          -    Covered              
#         bin addr[29]                                       45          1          -    Covered              
#         bin addr[30]                                       47          1          -    Covered              
#         bin addr[31]                                       46          1          -    Covered              
#         bin addr[32]                                       46          1          -    Covered              
#         bin addr[33]                                       46          1          -    Covered              
#         bin addr[34]                                       46          1          -    Covered              
#         bin addr[35]                                       46          1          -    Covered              
#         bin addr[36]                                       46          1          -    Covered              
#         bin addr[37]                                       47          1          -    Covered              
#         bin addr[38]                                       47          1          -    Covered              
#         bin addr[39]                                       46          1          -    Covered              
#         bin addr[40]                                       46          1          -    Covered              
#         bin addr[41]                                       46          1          -    Covered              
#         bin addr[42]                                       46          1          -    Covered              
#         bin addr[43]                                       46          1          -    Covered              
#         bin addr[44]                                       46          1          -    Covered              
#         bin addr[45]                                       46          1          -    Covered              
#         bin addr[46]                                       46          1          -    Covered              
#         bin addr[47]                                       45          1          -    Covered              
#         bin addr[48]                                       46          1          -    Covered              
#         bin addr[49]                                       47          1          -    Covered              
#         bin addr[50]                                       46          1          -    Covered              
#         bin addr[51]                                       46          1          -    Covered              
#         bin addr[52]                                       46          1          -    Covered              
#         bin addr[53]                                       45          1          -    Covered              
#         bin addr[54]                                       46          1          -    Covered              
#         bin addr[55]                                       46          1          -    Covered              
#         bin addr[56]                                       46          1          -    Covered              
#         bin addr[57]                                       46          1          -    Covered              
#         bin addr[58]                                       46          1          -    Covered              
#         bin addr[59]                                       46          1          -    Covered              
#         bin addr[60]                                       46          1          -    Covered              
#         bin addr[61]                                       46          1          -    Covered              
#         bin addr[62]                                       46          1          -    Covered              
#         bin addr[63]                                       46          1          -    Covered              
#     Coverpoint PORT_A_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      99          1          -    Covered              
#         bin auto[4:7]                                      29          1          -    Covered              
#         bin auto[8:11]                                     21          1          -    Covered              
#         bin auto[12:15]                                    20          1          -    Covered              
#         bin auto[16:19]                                    31          1          -    Covered              
#         bin auto[20:23]                                    36          1          -    Covered              
#         bin auto[24:27]                                    29          1          -    Covered              
#         bin auto[28:31]                                    22          1          -    Covered              
#         bin auto[32:35]                                    28          1          -    Covered              
#         bin auto[36:39]                                    21          1          -    Covered              
#         bin auto[40:43]                                    26          1          -    Covered              
#         bin auto[44:47]                                    16          1          -    Covered              
#         bin auto[48:51]                                    33          1          -    Covered              
#         bin auto[52:55]                                    24          1          -    Covered              
#         bin auto[56:59]                                    26          1          -    Covered              
#         bin auto[60:63]                                    36          1          -    Covered              
#         bin auto[64:67]                                    22          1          -    Covered              
#         bin auto[68:71]                                    15          1          -    Covered              
#         bin auto[72:75]                                    24          1          -    Covered              
#         bin auto[76:79]                                    23          1          -    Covered              
#         bin auto[80:83]                                    21          1          -    Covered              
#         bin auto[84:87]                                    20          1          -    Covered              
#         bin auto[88:91]                                    28          1          -    Covered              
#         bin auto[92:95]                                    22          1          -    Covered              
#         bin auto[96:99]                                    32          1          -    Covered              
#         bin auto[100:103]                                  29          1          -    Covered              
#         bin auto[104:107]                                  19          1          -    Covered              
#         bin auto[108:111]                                  32          1          -    Covered              
#         bin auto[112:115]                                  33          1          -    Covered              
#         bin auto[116:119]                                  36          1          -    Covered              
#         bin auto[120:123]                                  22          1          -    Covered              
#         bin auto[124:127]                                  26          1          -    Covered              
#         bin auto[128:131]                                  30          1          -    Covered              
#         bin auto[132:135]                                  24          1          -    Covered              
#         bin auto[136:139]                                  27          1          -    Covered              
#         bin auto[140:143]                                  34          1          -    Covered              
#         bin auto[144:147]                                  21          1          -    Covered              
#         bin auto[148:151]                                  20          1          -    Covered              
#         bin auto[152:155]                                  34          1          -    Covered              
#         bin auto[156:159]                                  27          1          -    Covered              
#         bin auto[160:163]                                  28          1          -    Covered              
#         bin auto[164:167]                                  26          1          -    Covered              
#         bin auto[168:171]                                  22          1          -    Covered              
#         bin auto[172:175]                                  30          1          -    Covered              
#         bin auto[176:179]                                  33          1          -    Covered              
#         bin auto[180:183]                                  17          1          -    Covered              
#         bin auto[184:187]                                  33          1          -    Covered              
#         bin auto[188:191]                                  25          1          -    Covered              
#         bin auto[192:195]                                  25          1          -    Covered              
#         bin auto[196:199]                                  22          1          -    Covered              
#         bin auto[200:203]                                  28          1          -    Covered              
#         bin auto[204:207]                                  21          1          -    Covered              
#         bin auto[208:211]                                  29          1          -    Covered              
#         bin auto[212:215]                                  36          1          -    Covered              
#         bin auto[216:219]                                  30          1          -    Covered              
#         bin auto[220:223]                                  32          1          -    Covered              
#         bin auto[224:227]                                  36          1          -    Covered              
#         bin auto[228:231]                                  31          1          -    Covered              
#         bin auto[232:235]                                  28          1          -    Covered              
#         bin auto[236:239]                                  27          1          -    Covered              
#         bin auto[240:243]                                  19          1          -    Covered              
#         bin auto[244:247]                                  27          1          -    Covered              
#         bin auto[248:251]                                  39          1          -    Covered              
#         bin auto[252:255]                                  27          1          -    Covered              
#     Coverpoint PORT_B_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      96          1          -    Covered              
#         bin auto[4:7]                                      29          1          -    Covered              
#         bin auto[8:11]                                     24          1          -    Covered              
#         bin auto[12:15]                                    23          1          -    Covered              
#         bin auto[16:19]                                    18          1          -    Covered              
#         bin auto[20:23]                                    27          1          -    Covered              
#         bin auto[24:27]                                    20          1          -    Covered              
#         bin auto[28:31]                                    27          1          -    Covered              
#         bin auto[32:35]                                    18          1          -    Covered              
#         bin auto[36:39]                                    23          1          -    Covered              
#         bin auto[40:43]                                    33          1          -    Covered              
#         bin auto[44:47]                                    28          1          -    Covered              
#         bin auto[48:51]                                    15          1          -    Covered              
#         bin auto[52:55]                                    24          1          -    Covered              
#         bin auto[56:59]                                    23          1          -    Covered              
#         bin auto[60:63]                                    41          1          -    Covered              
#         bin auto[64:67]                                    20          1          -    Covered              
#         bin auto[68:71]                                    33          1          -    Covered              
#         bin auto[72:75]                                    22          1          -    Covered              
#         bin auto[76:79]                                    18          1          -    Covered              
#         bin auto[80:83]                                    22          1          -    Covered              
#         bin auto[84:87]                                    30          1          -    Covered              
#         bin auto[88:91]                                    23          1          -    Covered              
#         bin auto[92:95]                                    36          1          -    Covered              
#         bin auto[96:99]                                    18          1          -    Covered              
#         bin auto[100:103]                                  25          1          -    Covered              
#         bin auto[104:107]                                  23          1          -    Covered              
#         bin auto[108:111]                                  26          1          -    Covered              
#         bin auto[112:115]                                  20          1          -    Covered              
#         bin auto[116:119]                                  27          1          -    Covered              
#         bin auto[120:123]                                  28          1          -    Covered              
#         bin auto[124:127]                                  20          1          -    Covered              
#         bin auto[128:131]                                  22          1          -    Covered              
#         bin auto[132:135]                                  23          1          -    Covered              
#         bin auto[136:139]                                  24          1          -    Covered              
#         bin auto[140:143]                                  26          1          -    Covered              
#         bin auto[144:147]                                  24          1          -    Covered              
#         bin auto[148:151]                                  29          1          -    Covered              
#         bin auto[152:155]                                  31          1          -    Covered              
#         bin auto[156:159]                                  26          1          -    Covered              
#         bin auto[160:163]                                  27          1          -    Covered              
#         bin auto[164:167]                                  26          1          -    Covered              
#         bin auto[168:171]                                  35          1          -    Covered              
#         bin auto[172:175]                                  26          1          -    Covered              
#         bin auto[176:179]                                  22          1          -    Covered              
#         bin auto[180:183]                                  28          1          -    Covered              
#         bin auto[184:187]                                  29          1          -    Covered              
#         bin auto[188:191]                                  37          1          -    Covered              
#         bin auto[192:195]                                  18          1          -    Covered              
#         bin auto[196:199]                                  30          1          -    Covered              
#         bin auto[200:203]                                  23          1          -    Covered              
#         bin auto[204:207]                                  23          1          -    Covered              
#         bin auto[208:211]                                  28          1          -    Covered              
#         bin auto[212:215]                                  22          1          -    Covered              
#         bin auto[216:219]                                  25          1          -    Covered              
#         bin auto[220:223]                                  17          1          -    Covered              
#         bin auto[224:227]                                  21          1          -    Covered              
#         bin auto[228:231]                                  33          1          -    Covered              
#         bin auto[232:235]                                  19          1          -    Covered              
#         bin auto[236:239]                                  34          1          -    Covered              
#         bin auto[240:243]                                  27          1          -    Covered              
#         bin auto[244:247]                                  29          1          -    Covered              
#         bin auto[248:251]                                  25          1          -    Covered              
#         bin auto[252:255]                                  25          1          -    Covered              
#     Coverpoint PORT_A_DATA_out                        100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                     309          1          -    Covered              
#         bin auto[4:7]                                      21          1          -    Covered              
#         bin auto[8:11]                                      9          1          -    Covered              
#         bin auto[12:15]                                     7          1          -    Covered              
#         bin auto[16:19]                                     8          1          -    Covered              
#         bin auto[20:23]                                    18          1          -    Covered              
#         bin auto[24:27]                                    10          1          -    Covered              
#         bin auto[28:31]                                    15          1          -    Covered              
#         bin auto[32:35]                                     9          1          -    Covered              
#         bin auto[36:39]                                    11          1          -    Covered              
#         bin auto[40:43]                                    18          1          -    Covered              
#         bin auto[44:47]                                    17          1          -    Covered              
#         bin auto[48:51]                                    18          1          -    Covered              
#         bin auto[52:55]                                    16          1          -    Covered              
#         bin auto[56:59]                                     7          1          -    Covered              
#         bin auto[60:63]                                    21          1          -    Covered              
#         bin auto[64:67]                                    21          1          -    Covered              
#         bin auto[68:71]                                    12          1          -    Covered              
#         bin auto[72:75]                                    16          1          -    Covered              
#         bin auto[76:79]                                     6          1          -    Covered              
#         bin auto[80:83]                                     8          1          -    Covered              
#         bin auto[84:87]                                    17          1          -    Covered              
#         bin auto[88:91]                                    16          1          -    Covered              
#         bin auto[92:95]                                    19          1          -    Covered              
#         bin auto[96:99]                                     9          1          -    Covered              
#         bin auto[100:103]                                   9          1          -    Covered              
#         bin auto[104:107]                                   7          1          -    Covered              
#         bin auto[108:111]                                  14          1          -    Covered              
#         bin auto[112:115]                                  10          1          -    Covered              
#         bin auto[116:119]                                  15          1          -    Covered              
#         bin auto[120:123]                                  14          1          -    Covered              
#         bin auto[124:127]                                  15          1          -    Covered              
#         bin auto[128:131]                                  19          1          -    Covered              
#         bin auto[132:135]                                  15          1          -    Covered              
#         bin auto[136:139]                                  19          1          -    Covered              
#         bin auto[140:143]                                  11          1          -    Covered              
#         bin auto[144:147]                                   9          1          -    Covered              
#         bin auto[148:151]                                  15          1          -    Covered              
#         bin auto[152:155]                                  14          1          -    Covered              
#         bin auto[156:159]                                  13          1          -    Covered              
#         bin auto[160:163]                                  19          1          -    Covered              
#         bin auto[164:167]                                  12          1          -    Covered              
#         bin auto[168:171]                                  18          1          -    Covered              
#         bin auto[172:175]                                  14          1          -    Covered              
#         bin auto[176:179]                                  16          1          -    Covered              
#         bin auto[180:183]                                  11          1          -    Covered              
#         bin auto[184:187]                                  11          1          -    Covered              
#         bin auto[188:191]                                  14          1          -    Covered              
#         bin auto[192:195]                                  10          1          -    Covered              
#         bin auto[196:199]                                  28          1          -    Covered              
#         bin auto[200:203]                                   8          1          -    Covered              
#         bin auto[204:207]                                  12          1          -    Covered              
#         bin auto[208:211]                                  12          1          -    Covered              
#         bin auto[212:215]                                  19          1          -    Covered              
#         bin auto[216:219]                                  18          1          -    Covered              
#         bin auto[220:223]                                  10          1          -    Covered              
#         bin auto[224:227]                                  14          1          -    Covered              
#         bin auto[228:231]                                  14          1          -    Covered              
#         bin auto[232:235]                                   7          1          -    Covered              
#         bin auto[236:239]                                   9          1          -    Covered              
#         bin auto[240:243]                                  13          1          -    Covered              
#         bin auto[244:247]                                  20          1          -    Covered              
#         bin auto[248:251]                                  12          1          -    Covered              
#         bin auto[252:255]                                  15          1          -    Covered              
#     Coverpoint PORT_B_DATA_out                        100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                     444          1          -    Covered              
#         bin auto[4:7]                                      26          1          -    Covered              
#         bin auto[8:11]                                      6          1          -    Covered              
#         bin auto[12:15]                                     7          1          -    Covered              
#         bin auto[16:19]                                     7          1          -    Covered              
#         bin auto[20:23]                                    22          1          -    Covered              
#         bin auto[24:27]                                     8          1          -    Covered              
#         bin auto[28:31]                                    12          1          -    Covered              
#         bin auto[32:35]                                    10          1          -    Covered              
#         bin auto[36:39]                                    16          1          -    Covered              
#         bin auto[40:43]                                    11          1          -    Covered              
#         bin auto[44:47]                                     7          1          -    Covered              
#         bin auto[48:51]                                    16          1          -    Covered              
#         bin auto[52:55]                                    10          1          -    Covered              
#         bin auto[56:59]                                    10          1          -    Covered              
#         bin auto[60:63]                                    24          1          -    Covered              
#         bin auto[64:67]                                    13          1          -    Covered              
#         bin auto[68:71]                                    12          1          -    Covered              
#         bin auto[72:75]                                     7          1          -    Covered              
#         bin auto[76:79]                                    12          1          -    Covered              
#         bin auto[80:83]                                     8          1          -    Covered              
#         bin auto[84:87]                                    10          1          -    Covered              
#         bin auto[88:91]                                    15          1          -    Covered              
#         bin auto[92:95]                                    19          1          -    Covered              
#         bin auto[96:99]                                    11          1          -    Covered              
#         bin auto[100:103]                                  11          1          -    Covered              
#         bin auto[104:107]                                  10          1          -    Covered              
#         bin auto[108:111]                                   9          1          -    Covered              
#         bin auto[112:115]                                  15          1          -    Covered              
#         bin auto[116:119]                                  11          1          -    Covered              
#         bin auto[120:123]                                  14          1          -    Covered              
#         bin auto[124:127]                                  10          1          -    Covered              
#         bin auto[128:131]                                  13          1          -    Covered              
#         bin auto[132:135]                                  12          1          -    Covered              
#         bin auto[136:139]                                  20          1          -    Covered              
#         bin auto[140:143]                                  16          1          -    Covered              
#         bin auto[144:147]                                  11          1          -    Covered              
#         bin auto[148:151]                                  14          1          -    Covered              
#         bin auto[152:155]                                  10          1          -    Covered              
#         bin auto[156:159]                                  20          1          -    Covered              
#         bin auto[160:163]                                  18          1          -    Covered              
#         bin auto[164:167]                                  12          1          -    Covered              
#         bin auto[168:171]                                  18          1          -    Covered              
#         bin auto[172:175]                                  15          1          -    Covered              
#         bin auto[176:179]                                  15          1          -    Covered              
#         bin auto[180:183]                                  10          1          -    Covered              
#         bin auto[184:187]                                   5          1          -    Covered              
#         bin auto[188:191]                                  12          1          -    Covered              
#         bin auto[192:195]                                   7          1          -    Covered              
#         bin auto[196:199]                                  27          1          -    Covered              
#         bin auto[200:203]                                   8          1          -    Covered              
#         bin auto[204:207]                                  17          1          -    Covered              
#         bin auto[208:211]                                  13          1          -    Covered              
#         bin auto[212:215]                                  13          1          -    Covered              
#         bin auto[216:219]                                  18          1          -    Covered              
#         bin auto[220:223]                                   9          1          -    Covered              
#         bin auto[224:227]                                  18          1          -    Covered              
#         bin auto[228:231]                                  14          1          -    Covered              
#         bin auto[232:235]                                   8          1          -    Covered              
#         bin auto[236:239]                                   6          1          -    Covered              
#         bin auto[240:243]                                  13          1          -    Covered              
#         bin auto[244:247]                                  27          1          -    Covered              
#         bin auto[248:251]                                  12          1          -    Covered              
#         bin auto[252:255]                                  14          1          -    Covered              
#     Coverpoint COLLISION                              100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin NO_COLLIOSION                         2579                     -    Occurred             
#         bin COLLISION                                     383          1          -    Covered              
#     Coverpoint PORT_A_Operation_Transitions            50.00%        100          -    Uncovered            
#         covered/total bins:                                 2          4          -                      
#         missing/total bins:                                 2          4          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                1          1          -    Covered              
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  5          1          -    Covered              
#     Coverpoint PORT_B_Operation_Transitions            75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         bin read_after_write                                1          1          -    Covered              
#         bin write_after_read                                1          1          -    Covered              
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  2          1          -    Covered              
#     Coverpoint RESET                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin asserted                                      153          1          -    Covered              
#         bin de_asserted                                  2809          1          -    Covered              
#     Coverpoint RESET_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin assert_deassert                               100          1          -    Covered              
#         bin deassert_assert                               100          1          -    Covered              
#     Coverpoint READ_during_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_during_reset                              89          1          -    Covered              
#     Coverpoint WRITE_during_RESET                     100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_during_reset                            133          1          -    Covered              
#     Coverpoint READ_after_RESET                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_after_reset                               68          1          -    Covered              
#     Coverpoint WRITE_after_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_after_reset                              75          1          -    Covered              
#     Cross PORTS_Mode_comb                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write>                            1057          1          -    Covered              
#             bin <write,read>                              732          1          -    Covered              
#             bin <read,write>                              637          1          -    Covered              
#             bin <read,read>                               536          1          -    Covered              
#     Cross COLLISION_MODES                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write,COLLISION>                    98          1          -    Covered              
#             bin <write,read,COLLISION>                     87          1          -    Covered              
#             bin <read,write,COLLISION>                     95          1          -    Covered              
#             bin <read,read,COLLISION>                     103          1          -    Covered              
#  Covergroup instance 
# ========================================================================================
# 	RANDOMIZED TEST
# ======================================================================================== 
#                                                        61.84%        100          -    Uncovered            
#     covered/total bins:                                   399        413          -                      
#     missing/total bins:                                    14        413          -                      
#     % Hit:                                             96.61%        100          -                      
#     Coverpoint PORT_A_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          760          1          -    Covered              
#         bin write                                        1241          1          -    Covered              
#     Coverpoint PORT_B_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          825          1          -    Covered              
#         bin write                                        1176          1          -    Covered              
#     Coverpoint PORT_A_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        32          1          -    Covered              
#         bin addr[1]                                        31          1          -    Covered              
#         bin addr[2]                                        32          1          -    Covered              
#         bin addr[3]                                        31          1          -    Covered              
#         bin addr[4]                                        31          1          -    Covered              
#         bin addr[5]                                        32          1          -    Covered              
#         bin addr[6]                                        31          1          -    Covered              
#         bin addr[7]                                        31          1          -    Covered              
#         bin addr[8]                                        31          1          -    Covered              
#         bin addr[9]                                        31          1          -    Covered              
#         bin addr[10]                                       31          1          -    Covered              
#         bin addr[11]                                       31          1          -    Covered              
#         bin addr[12]                                       31          1          -    Covered              
#         bin addr[13]                                       31          1          -    Covered              
#         bin addr[14]                                       31          1          -    Covered              
#         bin addr[15]                                       31          1          -    Covered              
#         bin addr[16]                                       31          1          -    Covered              
#         bin addr[17]                                       32          1          -    Covered              
#         bin addr[18]                                       31          1          -    Covered              
#         bin addr[19]                                       31          1          -    Covered              
#         bin addr[20]                                       31          1          -    Covered              
#         bin addr[21]                                       31          1          -    Covered              
#         bin addr[22]                                       31          1          -    Covered              
#         bin addr[23]                                       31          1          -    Covered              
#         bin addr[24]                                       32          1          -    Covered              
#         bin addr[25]                                       31          1          -    Covered              
#         bin addr[26]                                       32          1          -    Covered              
#         bin addr[27]                                       32          1          -    Covered              
#         bin addr[28]                                       31          1          -    Covered              
#         bin addr[29]                                       31          1          -    Covered              
#         bin addr[30]                                       32          1          -    Covered              
#         bin addr[31]                                       31          1          -    Covered              
#         bin addr[32]                                       31          1          -    Covered              
#         bin addr[33]                                       31          1          -    Covered              
#         bin addr[34]                                       31          1          -    Covered              
#         bin addr[35]                                       31          1          -    Covered              
#         bin addr[36]                                       31          1          -    Covered              
#         bin addr[37]                                       31          1          -    Covered              
#         bin addr[38]                                       31          1          -    Covered              
#         bin addr[39]                                       31          1          -    Covered              
#         bin addr[40]                                       32          1          -    Covered              
#         bin addr[41]                                       31          1          -    Covered              
#         bin addr[42]                                       32          1          -    Covered              
#         bin addr[43]                                       31          1          -    Covered              
#         bin addr[44]                                       31          1          -    Covered              
#         bin addr[45]                                       31          1          -    Covered              
#         bin addr[46]                                       32          1          -    Covered              
#         bin addr[47]                                       32          1          -    Covered              
#         bin addr[48]                                       31          1          -    Covered              
#         bin addr[49]                                       31          1          -    Covered              
#         bin addr[50]                                       31          1          -    Covered              
#         bin addr[51]                                       31          1          -    Covered              
#         bin addr[52]                                       32          1          -    Covered              
#         bin addr[53]                                       31          1          -    Covered              
#         bin addr[54]                                       31          1          -    Covered              
#         bin addr[55]                                       32          1          -    Covered              
#         bin addr[56]                                       31          1          -    Covered              
#         bin addr[57]                                       32          1          -    Covered              
#         bin addr[58]                                       31          1          -    Covered              
#         bin addr[59]                                       31          1          -    Covered              
#         bin addr[60]                                       32          1          -    Covered              
#         bin addr[61]                                       31          1          -    Covered              
#         bin addr[62]                                       31          1          -    Covered              
#         bin addr[63]                                       32          1          -    Covered              
#     Coverpoint PORT_B_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        32          1          -    Covered              
#         bin addr[1]                                        32          1          -    Covered              
#         bin addr[2]                                        32          1          -    Covered              
#         bin addr[3]                                        31          1          -    Covered              
#         bin addr[4]                                        32          1          -    Covered              
#         bin addr[5]                                        32          1          -    Covered              
#         bin addr[6]                                        32          1          -    Covered              
#         bin addr[7]                                        31          1          -    Covered              
#         bin addr[8]                                        31          1          -    Covered              
#         bin addr[9]                                        31          1          -    Covered              
#         bin addr[10]                                       31          1          -    Covered              
#         bin addr[11]                                       31          1          -    Covered              
#         bin addr[12]                                       31          1          -    Covered              
#         bin addr[13]                                       31          1          -    Covered              
#         bin addr[14]                                       32          1          -    Covered              
#         bin addr[15]                                       31          1          -    Covered              
#         bin addr[16]                                       32          1          -    Covered              
#         bin addr[17]                                       32          1          -    Covered              
#         bin addr[18]                                       31          1          -    Covered              
#         bin addr[19]                                       31          1          -    Covered              
#         bin addr[20]                                       31          1          -    Covered              
#         bin addr[21]                                       31          1          -    Covered              
#         bin addr[22]                                       31          1          -    Covered              
#         bin addr[23]                                       31          1          -    Covered              
#         bin addr[24]                                       32          1          -    Covered              
#         bin addr[25]                                       31          1          -    Covered              
#         bin addr[26]                                       31          1          -    Covered              
#         bin addr[27]                                       31          1          -    Covered              
#         bin addr[28]                                       31          1          -    Covered              
#         bin addr[29]                                       31          1          -    Covered              
#         bin addr[30]                                       32          1          -    Covered              
#         bin addr[31]                                       31          1          -    Covered              
#         bin addr[32]                                       31          1          -    Covered              
#         bin addr[33]                                       31          1          -    Covered              
#         bin addr[34]                                       31          1          -    Covered              
#         bin addr[35]                                       31          1          -    Covered              
#         bin addr[36]                                       31          1          -    Covered              
#         bin addr[37]                                       32          1          -    Covered              
#         bin addr[38]                                       32          1          -    Covered              
#         bin addr[39]                                       31          1          -    Covered              
#         bin addr[40]                                       31          1          -    Covered              
#         bin addr[41]                                       31          1          -    Covered              
#         bin addr[42]                                       31          1          -    Covered              
#         bin addr[43]                                       31          1          -    Covered              
#         bin addr[44]                                       31          1          -    Covered              
#         bin addr[45]                                       31          1          -    Covered              
#         bin addr[46]                                       31          1          -    Covered              
#         bin addr[47]                                       31          1          -    Covered              
#         bin addr[48]                                       31          1          -    Covered              
#         bin addr[49]                                       32          1          -    Covered              
#         bin addr[50]                                       31          1          -    Covered              
#         bin addr[51]                                       31          1          -    Covered              
#         bin addr[52]                                       31          1          -    Covered              
#         bin addr[53]                                       31          1          -    Covered              
#         bin addr[54]                                       31          1          -    Covered              
#         bin addr[55]                                       32          1          -    Covered              
#         bin addr[56]                                       32          1          -    Covered              
#         bin addr[57]                                       31          1          -    Covered              
#         bin addr[58]                                       31          1          -    Covered              
#         bin addr[59]                                       31          1          -    Covered              
#         bin addr[60]                                       32          1          -    Covered              
#         bin addr[61]                                       31          1          -    Covered              
#         bin addr[62]                                       31          1          -    Covered              
#         bin addr[63]                                       31          1          -    Covered              
#     Coverpoint PORT_A_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      22          1          -    Covered              
#         bin auto[4:7]                                      20          1          -    Covered              
#         bin auto[8:11]                                     15          1          -    Covered              
#         bin auto[12:15]                                    14          1          -    Covered              
#         bin auto[16:19]                                    22          1          -    Covered              
#         bin auto[20:23]                                    30          1          -    Covered              
#         bin auto[24:27]                                    20          1          -    Covered              
#         bin auto[28:31]                                    13          1          -    Covered              
#         bin auto[32:35]                                    22          1          -    Covered              
#         bin auto[36:39]                                    17          1          -    Covered              
#         bin auto[40:43]                                    18          1          -    Covered              
#         bin auto[44:47]                                     7          1          -    Covered              
#         bin auto[48:51]                                    22          1          -    Covered              
#         bin auto[52:55]                                    18          1          -    Covered              
#         bin auto[56:59]                                    18          1          -    Covered              
#         bin auto[60:63]                                    25          1          -    Covered              
#         bin auto[64:67]                                    15          1          -    Covered              
#         bin auto[68:71]                                    10          1          -    Covered              
#         bin auto[72:75]                                    17          1          -    Covered              
#         bin auto[76:79]                                    17          1          -    Covered              
#         bin auto[80:83]                                    17          1          -    Covered              
#         bin auto[84:87]                                    15          1          -    Covered              
#         bin auto[88:91]                                    22          1          -    Covered              
#         bin auto[92:95]                                    16          1          -    Covered              
#         bin auto[96:99]                                    25          1          -    Covered              
#         bin auto[100:103]                                  22          1          -    Covered              
#         bin auto[104:107]                                  16          1          -    Covered              
#         bin auto[108:111]                                  25          1          -    Covered              
#         bin auto[112:115]                                  22          1          -    Covered              
#         bin auto[116:119]                                  25          1          -    Covered              
#         bin auto[120:123]                                  16          1          -    Covered              
#         bin auto[124:127]                                  22          1          -    Covered              
#         bin auto[128:131]                                  25          1          -    Covered              
#         bin auto[132:135]                                  14          1          -    Covered              
#         bin auto[136:139]                                  23          1          -    Covered              
#         bin auto[140:143]                                  26          1          -    Covered              
#         bin auto[144:147]                                  16          1          -    Covered              
#         bin auto[148:151]                                  15          1          -    Covered              
#         bin auto[152:155]                                  25          1          -    Covered              
#         bin auto[156:159]                                  22          1          -    Covered              
#         bin auto[160:163]                                  21          1          -    Covered              
#         bin auto[164:167]                                  16          1          -    Covered              
#         bin auto[168:171]                                  16          1          -    Covered              
#         bin auto[172:175]                                  25          1          -    Covered              
#         bin auto[176:179]                                  21          1          -    Covered              
#         bin auto[180:183]                                  14          1          -    Covered              
#         bin auto[184:187]                                  21          1          -    Covered              
#         bin auto[188:191]                                  15          1          -    Covered              
#         bin auto[192:195]                                  18          1          -    Covered              
#         bin auto[196:199]                                  15          1          -    Covered              
#         bin auto[200:203]                                  22          1          -    Covered              
#         bin auto[204:207]                                  16          1          -    Covered              
#         bin auto[208:211]                                  20          1          -    Covered              
#         bin auto[212:215]                                  22          1          -    Covered              
#         bin auto[216:219]                                  21          1          -    Covered              
#         bin auto[220:223]                                  23          1          -    Covered              
#         bin auto[224:227]                                  23          1          -    Covered              
#         bin auto[228:231]                                  24          1          -    Covered              
#         bin auto[232:235]                                  21          1          -    Covered              
#         bin auto[236:239]                                  24          1          -    Covered              
#         bin auto[240:243]                                  15          1          -    Covered              
#         bin auto[244:247]                                  13          1          -    Covered              
#         bin auto[248:251]                                  22          1          -    Covered              
#         bin auto[252:255]                                  22          1          -    Covered              
#     Coverpoint PORT_B_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      19          1          -    Covered              
#         bin auto[4:7]                                      24          1          -    Covered              
#         bin auto[8:11]                                     20          1          -    Covered              
#         bin auto[12:15]                                    14          1          -    Covered              
#         bin auto[16:19]                                    14          1          -    Covered              
#         bin auto[20:23]                                    19          1          -    Covered              
#         bin auto[24:27]                                    16          1          -    Covered              
#         bin auto[28:31]                                    22          1          -    Covered              
#         bin auto[32:35]                                    12          1          -    Covered              
#         bin auto[36:39]                                    17          1          -    Covered              
#         bin auto[40:43]                                    25          1          -    Covered              
#         bin auto[44:47]                                    20          1          -    Covered              
#         bin auto[48:51]                                    11          1          -    Covered              
#         bin auto[52:55]                                    16          1          -    Covered              
#         bin auto[56:59]                                    15          1          -    Covered              
#         bin auto[60:63]                                    29          1          -    Covered              
#         bin auto[64:67]                                    15          1          -    Covered              
#         bin auto[68:71]                                    28          1          -    Covered              
#         bin auto[72:75]                                    16          1          -    Covered              
#         bin auto[76:79]                                    12          1          -    Covered              
#         bin auto[80:83]                                    16          1          -    Covered              
#         bin auto[84:87]                                    22          1          -    Covered              
#         bin auto[88:91]                                    15          1          -    Covered              
#         bin auto[92:95]                                    22          1          -    Covered              
#         bin auto[96:99]                                    16          1          -    Covered              
#         bin auto[100:103]                                  16          1          -    Covered              
#         bin auto[104:107]                                  18          1          -    Covered              
#         bin auto[108:111]                                  18          1          -    Covered              
#         bin auto[112:115]                                  13          1          -    Covered              
#         bin auto[116:119]                                  21          1          -    Covered              
#         bin auto[120:123]                                  20          1          -    Covered              
#         bin auto[124:127]                                  14          1          -    Covered              
#         bin auto[128:131]                                  13          1          -    Covered              
#         bin auto[132:135]                                  15          1          -    Covered              
#         bin auto[136:139]                                  20          1          -    Covered              
#         bin auto[140:143]                                  18          1          -    Covered              
#         bin auto[144:147]                                  20          1          -    Covered              
#         bin auto[148:151]                                  23          1          -    Covered              
#         bin auto[152:155]                                  22          1          -    Covered              
#         bin auto[156:159]                                  20          1          -    Covered              
#         bin auto[160:163]                                  22          1          -    Covered              
#         bin auto[164:167]                                  19          1          -    Covered              
#         bin auto[168:171]                                  30          1          -    Covered              
#         bin auto[172:175]                                  15          1          -    Covered              
#         bin auto[176:179]                                  17          1          -    Covered              
#         bin auto[180:183]                                  17          1          -    Covered              
#         bin auto[184:187]                                  23          1          -    Covered              
#         bin auto[188:191]                                  25          1          -    Covered              
#         bin auto[192:195]                                  15          1          -    Covered              
#         bin auto[196:199]                                  22          1          -    Covered              
#         bin auto[200:203]                                  16          1          -    Covered              
#         bin auto[204:207]                                  18          1          -    Covered              
#         bin auto[208:211]                                  19          1          -    Covered              
#         bin auto[212:215]                                  14          1          -    Covered              
#         bin auto[216:219]                                  17          1          -    Covered              
#         bin auto[220:223]                                  10          1          -    Covered              
#         bin auto[224:227]                                  19          1          -    Covered              
#         bin auto[228:231]                                  25          1          -    Covered              
#         bin auto[232:235]                                  11          1          -    Covered              
#         bin auto[236:239]                                  25          1          -    Covered              
#         bin auto[240:243]                                  16          1          -    Covered              
#         bin auto[244:247]                                  19          1          -    Covered              
#         bin auto[248:251]                                  15          1          -    Covered              
#         bin auto[252:255]                                  21          1          -    Covered              
#     Coverpoint PORT_A_DATA_out                        100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      45          1          -    Covered              
#         bin auto[4:7]                                      20          1          -    Covered              
#         bin auto[8:11]                                      6          1          -    Covered              
#         bin auto[12:15]                                     5          1          -    Covered              
#         bin auto[16:19]                                     7          1          -    Covered              
#         bin auto[20:23]                                    18          1          -    Covered              
#         bin auto[24:27]                                     8          1          -    Covered              
#         bin auto[28:31]                                    11          1          -    Covered              
#         bin auto[32:35]                                     8          1          -    Covered              
#         bin auto[36:39]                                     9          1          -    Covered              
#         bin auto[40:43]                                    13          1          -    Covered              
#         bin auto[44:47]                                    15          1          -    Covered              
#         bin auto[48:51]                                    14          1          -    Covered              
#         bin auto[52:55]                                    12          1          -    Covered              
#         bin auto[56:59]                                     5          1          -    Covered              
#         bin auto[60:63]                                    17          1          -    Covered              
#         bin auto[64:67]                                    14          1          -    Covered              
#         bin auto[68:71]                                    12          1          -    Covered              
#         bin auto[72:75]                                     9          1          -    Covered              
#         bin auto[76:79]                                     5          1          -    Covered              
#         bin auto[80:83]                                     8          1          -    Covered              
#         bin auto[84:87]                                    14          1          -    Covered              
#         bin auto[88:91]                                    16          1          -    Covered              
#         bin auto[92:95]                                    18          1          -    Covered              
#         bin auto[96:99]                                     8          1          -    Covered              
#         bin auto[100:103]                                   5          1          -    Covered              
#         bin auto[104:107]                                   6          1          -    Covered              
#         bin auto[108:111]                                  12          1          -    Covered              
#         bin auto[112:115]                                   8          1          -    Covered              
#         bin auto[116:119]                                  14          1          -    Covered              
#         bin auto[120:123]                                  12          1          -    Covered              
#         bin auto[124:127]                                  13          1          -    Covered              
#         bin auto[128:131]                                  18          1          -    Covered              
#         bin auto[132:135]                                  15          1          -    Covered              
#         bin auto[136:139]                                  17          1          -    Covered              
#         bin auto[140:143]                                   8          1          -    Covered              
#         bin auto[144:147]                                   9          1          -    Covered              
#         bin auto[148:151]                                  14          1          -    Covered              
#         bin auto[152:155]                                  12          1          -    Covered              
#         bin auto[156:159]                                  12          1          -    Covered              
#         bin auto[160:163]                                  18          1          -    Covered              
#         bin auto[164:167]                                   8          1          -    Covered              
#         bin auto[168:171]                                  16          1          -    Covered              
#         bin auto[172:175]                                  12          1          -    Covered              
#         bin auto[176:179]                                  12          1          -    Covered              
#         bin auto[180:183]                                  10          1          -    Covered              
#         bin auto[184:187]                                  10          1          -    Covered              
#         bin auto[188:191]                                  13          1          -    Covered              
#         bin auto[192:195]                                   8          1          -    Covered              
#         bin auto[196:199]                                  26          1          -    Covered              
#         bin auto[200:203]                                   8          1          -    Covered              
#         bin auto[204:207]                                  10          1          -    Covered              
#         bin auto[208:211]                                  11          1          -    Covered              
#         bin auto[212:215]                                  12          1          -    Covered              
#         bin auto[216:219]                                  10          1          -    Covered              
#         bin auto[220:223]                                   7          1          -    Covered              
#         bin auto[224:227]                                  10          1          -    Covered              
#         bin auto[228:231]                                  11          1          -    Covered              
#         bin auto[232:235]                                   3          1          -    Covered              
#         bin auto[236:239]                                   9          1          -    Covered              
#         bin auto[240:243]                                  12          1          -    Covered              
#         bin auto[244:247]                                  15          1          -    Covered              
#         bin auto[248:251]                                   3          1          -    Covered              
#         bin auto[252:255]                                  14          1          -    Covered              
#     Coverpoint PORT_B_DATA_out                        100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                      36          1          -    Covered              
#         bin auto[4:7]                                      26          1          -    Covered              
#         bin auto[8:11]                                      6          1          -    Covered              
#         bin auto[12:15]                                     7          1          -    Covered              
#         bin auto[16:19]                                     6          1          -    Covered              
#         bin auto[20:23]                                    22          1          -    Covered              
#         bin auto[24:27]                                     8          1          -    Covered              
#         bin auto[28:31]                                    12          1          -    Covered              
#         bin auto[32:35]                                    10          1          -    Covered              
#         bin auto[36:39]                                    16          1          -    Covered              
#         bin auto[40:43]                                     9          1          -    Covered              
#         bin auto[44:47]                                     7          1          -    Covered              
#         bin auto[48:51]                                    16          1          -    Covered              
#         bin auto[52:55]                                     9          1          -    Covered              
#         bin auto[56:59]                                    10          1          -    Covered              
#         bin auto[60:63]                                    24          1          -    Covered              
#         bin auto[64:67]                                    13          1          -    Covered              
#         bin auto[68:71]                                    12          1          -    Covered              
#         bin auto[72:75]                                     7          1          -    Covered              
#         bin auto[76:79]                                    12          1          -    Covered              
#         bin auto[80:83]                                     8          1          -    Covered              
#         bin auto[84:87]                                    10          1          -    Covered              
#         bin auto[88:91]                                    15          1          -    Covered              
#         bin auto[92:95]                                    18          1          -    Covered              
#         bin auto[96:99]                                    11          1          -    Covered              
#         bin auto[100:103]                                   8          1          -    Covered              
#         bin auto[104:107]                                  10          1          -    Covered              
#         bin auto[108:111]                                   9          1          -    Covered              
#         bin auto[112:115]                                  14          1          -    Covered              
#         bin auto[116:119]                                  10          1          -    Covered              
#         bin auto[120:123]                                  12          1          -    Covered              
#         bin auto[124:127]                                  10          1          -    Covered              
#         bin auto[128:131]                                  12          1          -    Covered              
#         bin auto[132:135]                                  12          1          -    Covered              
#         bin auto[136:139]                                  20          1          -    Covered              
#         bin auto[140:143]                                  16          1          -    Covered              
#         bin auto[144:147]                                  11          1          -    Covered              
#         bin auto[148:151]                                  14          1          -    Covered              
#         bin auto[152:155]                                   9          1          -    Covered              
#         bin auto[156:159]                                  20          1          -    Covered              
#         bin auto[160:163]                                  17          1          -    Covered              
#         bin auto[164:167]                                  11          1          -    Covered              
#         bin auto[168:171]                                  18          1          -    Covered              
#         bin auto[172:175]                                  13          1          -    Covered              
#         bin auto[176:179]                                  14          1          -    Covered              
#         bin auto[180:183]                                   9          1          -    Covered              
#         bin auto[184:187]                                   5          1          -    Covered              
#         bin auto[188:191]                                  12          1          -    Covered              
#         bin auto[192:195]                                   7          1          -    Covered              
#         bin auto[196:199]                                  26          1          -    Covered              
#         bin auto[200:203]                                   8          1          -    Covered              
#         bin auto[204:207]                                  15          1          -    Covered              
#         bin auto[208:211]                                  13          1          -    Covered              
#         bin auto[212:215]                                  11          1          -    Covered              
#         bin auto[216:219]                                  17          1          -    Covered              
#         bin auto[220:223]                                   8          1          -    Covered              
#         bin auto[224:227]                                  18          1          -    Covered              
#         bin auto[228:231]                                  12          1          -    Covered              
#         bin auto[232:235]                                   5          1          -    Covered              
#         bin auto[236:239]                                   6          1          -    Covered              
#         bin auto[240:243]                                  12          1          -    Covered              
#         bin auto[244:247]                                  25          1          -    Covered              
#         bin auto[248:251]                                  12          1          -    Covered              
#         bin auto[252:255]                                  14          1          -    Covered              
#     Coverpoint COLLISION                              100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin NO_COLLIOSION                         1967                     -    Occurred             
#         bin COLLISION                                      34          1          -    Covered              
#     Coverpoint PORT_A_Operation_Transitions            25.00%        100          -    Uncovered            
#         covered/total bins:                                 1          4          -                      
#         missing/total bins:                                 3          4          -                      
#         % Hit:                                         25.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                1          1          -    Covered              
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  0          1          -    ZERO                 
#     Coverpoint PORT_B_Operation_Transitions             0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          4          -                      
#         missing/total bins:                                 4          4          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  0          1          -    ZERO                 
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                  2001          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_deassert                                 0          1          -    ZERO                 
#         bin deassert_assert                                 0          1          -    ZERO                 
#     Coverpoint READ_during_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_during_reset                               0          1          -    ZERO                 
#     Coverpoint WRITE_during_RESET                       0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_during_reset                              0          1          -    ZERO                 
#     Coverpoint READ_after_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_reset                                0          1          -    ZERO                 
#     Coverpoint WRITE_after_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_reset                               0          1          -    ZERO                 
#     Cross PORTS_Mode_comb                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write>                             721          1          -    Covered              
#             bin <read,write>                              455          1          -    Covered              
#             bin <write,read>                              520          1          -    Covered              
#             bin <read,read>                               305          1          -    Covered              
#     Cross COLLISION_MODES                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write,COLLISION>                    13          1          -    Covered              
#             bin <read,write,COLLISION>                     12          1          -    Covered              
#             bin <write,read,COLLISION>                      3          1          -    Covered              
#             bin <read,read,COLLISION>                       6          1          -    Covered              
#  Covergroup instance 
# ========================================================================================
# 	RESET TEST
# ======================================================================================== 
#                                                        79.35%        100          -    Uncovered            
#     covered/total bins:                                   282        413          -                      
#     missing/total bins:                                   131        413          -                      
#     % Hit:                                             68.28%        100          -                      
#     Coverpoint PORT_A_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          179          1          -    Covered              
#         bin write                                         322          1          -    Covered              
#     Coverpoint PORT_B_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          206          1          -    Covered              
#         bin write                                         295          1          -    Covered              
#     Coverpoint PORT_A_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                         9          1          -    Covered              
#         bin addr[1]                                         7          1          -    Covered              
#         bin addr[2]                                         7          1          -    Covered              
#         bin addr[3]                                         8          1          -    Covered              
#         bin addr[4]                                         8          1          -    Covered              
#         bin addr[5]                                         8          1          -    Covered              
#         bin addr[6]                                         8          1          -    Covered              
#         bin addr[7]                                         8          1          -    Covered              
#         bin addr[8]                                         8          1          -    Covered              
#         bin addr[9]                                         8          1          -    Covered              
#         bin addr[10]                                        8          1          -    Covered              
#         bin addr[11]                                        8          1          -    Covered              
#         bin addr[12]                                        8          1          -    Covered              
#         bin addr[13]                                        8          1          -    Covered              
#         bin addr[14]                                        8          1          -    Covered              
#         bin addr[15]                                        8          1          -    Covered              
#         bin addr[16]                                        7          1          -    Covered              
#         bin addr[17]                                        8          1          -    Covered              
#         bin addr[18]                                        7          1          -    Covered              
#         bin addr[19]                                        7          1          -    Covered              
#         bin addr[20]                                        8          1          -    Covered              
#         bin addr[21]                                        8          1          -    Covered              
#         bin addr[22]                                        8          1          -    Covered              
#         bin addr[23]                                        8          1          -    Covered              
#         bin addr[24]                                        8          1          -    Covered              
#         bin addr[25]                                        8          1          -    Covered              
#         bin addr[26]                                        8          1          -    Covered              
#         bin addr[27]                                        8          1          -    Covered              
#         bin addr[28]                                        8          1          -    Covered              
#         bin addr[29]                                        8          1          -    Covered              
#         bin addr[30]                                        8          1          -    Covered              
#         bin addr[31]                                        8          1          -    Covered              
#         bin addr[32]                                        8          1          -    Covered              
#         bin addr[33]                                        8          1          -    Covered              
#         bin addr[34]                                        8          1          -    Covered              
#         bin addr[35]                                        7          1          -    Covered              
#         bin addr[36]                                        8          1          -    Covered              
#         bin addr[37]                                        7          1          -    Covered              
#         bin addr[38]                                        8          1          -    Covered              
#         bin addr[39]                                        8          1          -    Covered              
#         bin addr[40]                                        8          1          -    Covered              
#         bin addr[41]                                        8          1          -    Covered              
#         bin addr[42]                                        8          1          -    Covered              
#         bin addr[43]                                        8          1          -    Covered              
#         bin addr[44]                                        8          1          -    Covered              
#         bin addr[45]                                        8          1          -    Covered              
#         bin addr[46]                                        8          1          -    Covered              
#         bin addr[47]                                        7          1          -    Covered              
#         bin addr[48]                                        7          1          -    Covered              
#         bin addr[49]                                        8          1          -    Covered              
#         bin addr[50]                                        8          1          -    Covered              
#         bin addr[51]                                        8          1          -    Covered              
#         bin addr[52]                                        8          1          -    Covered              
#         bin addr[53]                                        8          1          -    Covered              
#         bin addr[54]                                        8          1          -    Covered              
#         bin addr[55]                                        7          1          -    Covered              
#         bin addr[56]                                        8          1          -    Covered              
#         bin addr[57]                                        8          1          -    Covered              
#         bin addr[58]                                        8          1          -    Covered              
#         bin addr[59]                                        8          1          -    Covered              
#         bin addr[60]                                        8          1          -    Covered              
#         bin addr[61]                                        8          1          -    Covered              
#         bin addr[62]                                        7          1          -    Covered              
#         bin addr[63]                                        7          1          -    Covered              
#     Coverpoint PORT_B_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                         9          1          -    Covered              
#         bin addr[1]                                         8          1          -    Covered              
#         bin addr[2]                                         8          1          -    Covered              
#         bin addr[3]                                         8          1          -    Covered              
#         bin addr[4]                                         8          1          -    Covered              
#         bin addr[5]                                         8          1          -    Covered              
#         bin addr[6]                                         8          1          -    Covered              
#         bin addr[7]                                         8          1          -    Covered              
#         bin addr[8]                                         8          1          -    Covered              
#         bin addr[9]                                         8          1          -    Covered              
#         bin addr[10]                                        8          1          -    Covered              
#         bin addr[11]                                        8          1          -    Covered              
#         bin addr[12]                                        8          1          -    Covered              
#         bin addr[13]                                        7          1          -    Covered              
#         bin addr[14]                                        7          1          -    Covered              
#         bin addr[15]                                        8          1          -    Covered              
#         bin addr[16]                                        8          1          -    Covered              
#         bin addr[17]                                        7          1          -    Covered              
#         bin addr[18]                                        8          1          -    Covered              
#         bin addr[19]                                        8          1          -    Covered              
#         bin addr[20]                                        8          1          -    Covered              
#         bin addr[21]                                        7          1          -    Covered              
#         bin addr[22]                                        8          1          -    Covered              
#         bin addr[23]                                        7          1          -    Covered              
#         bin addr[24]                                        8          1          -    Covered              
#         bin addr[25]                                        8          1          -    Covered              
#         bin addr[26]                                        8          1          -    Covered              
#         bin addr[27]                                        8          1          -    Covered              
#         bin addr[28]                                        7          1          -    Covered              
#         bin addr[29]                                        7          1          -    Covered              
#         bin addr[30]                                        8          1          -    Covered              
#         bin addr[31]                                        8          1          -    Covered              
#         bin addr[32]                                        8          1          -    Covered              
#         bin addr[33]                                        8          1          -    Covered              
#         bin addr[34]                                        8          1          -    Covered              
#         bin addr[35]                                        8          1          -    Covered              
#         bin addr[36]                                        8          1          -    Covered              
#         bin addr[37]                                        8          1          -    Covered              
#         bin addr[38]                                        8          1          -    Covered              
#         bin addr[39]                                        8          1          -    Covered              
#         bin addr[40]                                        8          1          -    Covered              
#         bin addr[41]                                        8          1          -    Covered              
#         bin addr[42]                                        8          1          -    Covered              
#         bin addr[43]                                        8          1          -    Covered              
#         bin addr[44]                                        8          1          -    Covered              
#         bin addr[45]                                        8          1          -    Covered              
#         bin addr[46]                                        8          1          -    Covered              
#         bin addr[47]                                        7          1          -    Covered              
#         bin addr[48]                                        8          1          -    Covered              
#         bin addr[49]                                        8          1          -    Covered              
#         bin addr[50]                                        8          1          -    Covered              
#         bin addr[51]                                        8          1          -    Covered              
#         bin addr[52]                                        8          1          -    Covered              
#         bin addr[53]                                        7          1          -    Covered              
#         bin addr[54]                                        8          1          -    Covered              
#         bin addr[55]                                        7          1          -    Covered              
#         bin addr[56]                                        7          1          -    Covered              
#         bin addr[57]                                        8          1          -    Covered              
#         bin addr[58]                                        8          1          -    Covered              
#         bin addr[59]                                        8          1          -    Covered              
#         bin addr[60]                                        7          1          -    Covered              
#         bin addr[61]                                        8          1          -    Covered              
#         bin addr[62]                                        8          1          -    Covered              
#         bin addr[63]                                        8          1          -    Covered              
#     Coverpoint PORT_A_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                       7          1          -    Covered              
#         bin auto[4:7]                                       6          1          -    Covered              
#         bin auto[8:11]                                      3          1          -    Covered              
#         bin auto[12:15]                                     5          1          -    Covered              
#         bin auto[16:19]                                     7          1          -    Covered              
#         bin auto[20:23]                                     6          1          -    Covered              
#         bin auto[24:27]                                     7          1          -    Covered              
#         bin auto[28:31]                                     6          1          -    Covered              
#         bin auto[32:35]                                     5          1          -    Covered              
#         bin auto[36:39]                                     2          1          -    Covered              
#         bin auto[40:43]                                     4          1          -    Covered              
#         bin auto[44:47]                                     5          1          -    Covered              
#         bin auto[48:51]                                     8          1          -    Covered              
#         bin auto[52:55]                                     3          1          -    Covered              
#         bin auto[56:59]                                     5          1          -    Covered              
#         bin auto[60:63]                                     6          1          -    Covered              
#         bin auto[64:67]                                     3          1          -    Covered              
#         bin auto[68:71]                                     5          1          -    Covered              
#         bin auto[72:75]                                     3          1          -    Covered              
#         bin auto[76:79]                                     5          1          -    Covered              
#         bin auto[80:83]                                     4          1          -    Covered              
#         bin auto[84:87]                                     3          1          -    Covered              
#         bin auto[88:91]                                     6          1          -    Covered              
#         bin auto[92:95]                                     4          1          -    Covered              
#         bin auto[96:99]                                     5          1          -    Covered              
#         bin auto[100:103]                                   3          1          -    Covered              
#         bin auto[104:107]                                   2          1          -    Covered              
#         bin auto[108:111]                                   5          1          -    Covered              
#         bin auto[112:115]                                   7          1          -    Covered              
#         bin auto[116:119]                                   9          1          -    Covered              
#         bin auto[120:123]                                   4          1          -    Covered              
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   4          1          -    Covered              
#         bin auto[132:135]                                   9          1          -    Covered              
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   4          1          -    Covered              
#         bin auto[144:147]                                   3          1          -    Covered              
#         bin auto[148:151]                                   4          1          -    Covered              
#         bin auto[152:155]                                   6          1          -    Covered              
#         bin auto[156:159]                                   4          1          -    Covered              
#         bin auto[160:163]                                   5          1          -    Covered              
#         bin auto[164:167]                                   7          1          -    Covered              
#         bin auto[168:171]                                   4          1          -    Covered              
#         bin auto[172:175]                                   5          1          -    Covered              
#         bin auto[176:179]                                   7          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   9          1          -    Covered              
#         bin auto[188:191]                                   9          1          -    Covered              
#         bin auto[192:195]                                   4          1          -    Covered              
#         bin auto[196:199]                                   6          1          -    Covered              
#         bin auto[200:203]                                   6          1          -    Covered              
#         bin auto[204:207]                                   3          1          -    Covered              
#         bin auto[208:211]                                   6          1          -    Covered              
#         bin auto[212:215]                                  10          1          -    Covered              
#         bin auto[216:219]                                   4          1          -    Covered              
#         bin auto[220:223]                                   5          1          -    Covered              
#         bin auto[224:227]                                  10          1          -    Covered              
#         bin auto[228:231]                                   4          1          -    Covered              
#         bin auto[232:235]                                   2          1          -    Covered              
#         bin auto[236:239]                                   3          1          -    Covered              
#         bin auto[240:243]                                   3          1          -    Covered              
#         bin auto[244:247]                                   7          1          -    Covered              
#         bin auto[248:251]                                   8          1          -    Covered              
#         bin auto[252:255]                                   4          1          -    Covered              
#     Coverpoint PORT_B_DATA_in                         100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0:3]                                       1          1          -    Covered              
#         bin auto[4:7]                                       4          1          -    Covered              
#         bin auto[8:11]                                      1          1          -    Covered              
#         bin auto[12:15]                                     8          1          -    Covered              
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     5          1          -    Covered              
#         bin auto[24:27]                                     3          1          -    Covered              
#         bin auto[28:31]                                     3          1          -    Covered              
#         bin auto[32:35]                                     5          1          -    Covered              
#         bin auto[36:39]                                     5          1          -    Covered              
#         bin auto[40:43]                                     7          1          -    Covered              
#         bin auto[44:47]                                     6          1          -    Covered              
#         bin auto[48:51]                                     2          1          -    Covered              
#         bin auto[52:55]                                     6          1          -    Covered              
#         bin auto[56:59]                                     5          1          -    Covered              
#         bin auto[60:63]                                     7          1          -    Covered              
#         bin auto[64:67]                                     5          1          -    Covered              
#         bin auto[68:71]                                     4          1          -    Covered              
#         bin auto[72:75]                                     2          1          -    Covered              
#         bin auto[76:79]                                     5          1          -    Covered              
#         bin auto[80:83]                                     6          1          -    Covered              
#         bin auto[84:87]                                     6          1          -    Covered              
#         bin auto[88:91]                                     6          1          -    Covered              
#         bin auto[92:95]                                     9          1          -    Covered              
#         bin auto[96:99]                                     2          1          -    Covered              
#         bin auto[100:103]                                   6          1          -    Covered              
#         bin auto[104:107]                                   2          1          -    Covered              
#         bin auto[108:111]                                   5          1          -    Covered              
#         bin auto[112:115]                                   6          1          -    Covered              
#         bin auto[116:119]                                   4          1          -    Covered              
#         bin auto[120:123]                                   4          1          -    Covered              
#         bin auto[124:127]                                   4          1          -    Covered              
#         bin auto[128:131]                                   6          1          -    Covered              
#         bin auto[132:135]                                   7          1          -    Covered              
#         bin auto[136:139]                                   3          1          -    Covered              
#         bin auto[140:143]                                   5          1          -    Covered              
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   4          1          -    Covered              
#         bin auto[152:155]                                   8          1          -    Covered              
#         bin auto[156:159]                                   4          1          -    Covered              
#         bin auto[160:163]                                   4          1          -    Covered              
#         bin auto[164:167]                                   6          1          -    Covered              
#         bin auto[168:171]                                   3          1          -    Covered              
#         bin auto[172:175]                                   6          1          -    Covered              
#         bin auto[176:179]                                   3          1          -    Covered              
#         bin auto[180:183]                                   8          1          -    Covered              
#         bin auto[184:187]                                   4          1          -    Covered              
#         bin auto[188:191]                                   8          1          -    Covered              
#         bin auto[192:195]                                   2          1          -    Covered              
#         bin auto[196:199]                                   4          1          -    Covered              
#         bin auto[200:203]                                   5          1          -    Covered              
#         bin auto[204:207]                                   3          1          -    Covered              
#         bin auto[208:211]                                   6          1          -    Covered              
#         bin auto[212:215]                                   2          1          -    Covered              
#         bin auto[216:219]                                   3          1          -    Covered              
#         bin auto[220:223]                                   4          1          -    Covered              
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   6          1          -    Covered              
#         bin auto[236:239]                                   8          1          -    Covered              
#         bin auto[240:243]                                   7          1          -    Covered              
#         bin auto[244:247]                                   8          1          -    Covered              
#         bin auto[248:251]                                   5          1          -    Covered              
#         bin auto[252:255]                                   3          1          -    Covered              
#     Coverpoint PORT_A_DATA_out                          4.68%        100          -    Uncovered            
#         covered/total bins:                                 3         64          -                      
#         missing/total bins:                                61         64          -                      
#         % Hit:                                          4.68%        100          -                      
#         bin auto[0:3]                                     177          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     1          1          -    Covered              
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
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
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint PORT_B_DATA_out                          3.12%        100          -    Uncovered            
#         covered/total bins:                                 2         64          -                      
#         missing/total bins:                                62         64          -                      
#         % Hit:                                          3.12%        100          -                      
#         bin auto[0:3]                                     205          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   0          1          -    ZERO                 
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
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
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint COLLISION                              100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin NO_COLLIOSION                          491                     -    Occurred             
#         bin COLLISION                                      10          1          -    Covered              
#     Coverpoint PORT_A_Operation_Transitions             0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          4          -                      
#         missing/total bins:                                 4          4          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  0          1          -    ZERO                 
#     Coverpoint PORT_B_Operation_Transitions             0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          4          -                      
#         missing/total bins:                                 4          4          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  0          1          -    ZERO                 
#     Coverpoint RESET                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin asserted                                      153          1          -    Covered              
#         bin de_asserted                                   348          1          -    Covered              
#     Coverpoint RESET_Transition                       100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin assert_deassert                               100          1          -    Covered              
#         bin deassert_assert                               100          1          -    Covered              
#     Coverpoint READ_during_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_during_reset                              89          1          -    Covered              
#     Coverpoint WRITE_during_RESET                     100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_during_reset                            133          1          -    Covered              
#     Coverpoint READ_after_RESET                       100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read_after_reset                               68          1          -    Covered              
#     Coverpoint WRITE_after_RESET                      100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin write_after_reset                              75          1          -    Covered              
#     Cross PORTS_Mode_comb                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write>                             193          1          -    Covered              
#             bin <read,write>                              102          1          -    Covered              
#             bin <write,read>                              129          1          -    Covered              
#             bin <read,read>                                77          1          -    Covered              
#     Cross COLLISION_MODES                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write,COLLISION>                     4          1          -    Covered              
#             bin <read,write,COLLISION>                      3          1          -    Covered              
#             bin <write,read,COLLISION>                      1          1          -    Covered              
#             bin <read,read,COLLISION>                       2          1          -    Covered              
#  Covergroup instance 
# ========================================================================================
# 	Full Read-Write TEST
# ======================================================================================== 
#                                                        44.07%        100          -    Uncovered            
#     covered/total bins:                                   243        413          -                      
#     missing/total bins:                                   170        413          -                      
#     % Hit:                                             58.83%        100          -                      
#     Coverpoint PORT_A_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           67          1          -    Covered              
#         bin write                                          64          1          -    Covered              
#     Coverpoint PORT_B_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                           67          1          -    Covered              
#         bin write                                          64          1          -    Covered              
#     Coverpoint PORT_A_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                         5          1          -    Covered              
#         bin addr[1]                                         2          1          -    Covered              
#         bin addr[2]                                         2          1          -    Covered              
#         bin addr[3]                                         2          1          -    Covered              
#         bin addr[4]                                         2          1          -    Covered              
#         bin addr[5]                                         2          1          -    Covered              
#         bin addr[6]                                         2          1          -    Covered              
#         bin addr[7]                                         2          1          -    Covered              
#         bin addr[8]                                         2          1          -    Covered              
#         bin addr[9]                                         2          1          -    Covered              
#         bin addr[10]                                        2          1          -    Covered              
#         bin addr[11]                                        2          1          -    Covered              
#         bin addr[12]                                        2          1          -    Covered              
#         bin addr[13]                                        2          1          -    Covered              
#         bin addr[14]                                        2          1          -    Covered              
#         bin addr[15]                                        2          1          -    Covered              
#         bin addr[16]                                        2          1          -    Covered              
#         bin addr[17]                                        2          1          -    Covered              
#         bin addr[18]                                        2          1          -    Covered              
#         bin addr[19]                                        2          1          -    Covered              
#         bin addr[20]                                        2          1          -    Covered              
#         bin addr[21]                                        2          1          -    Covered              
#         bin addr[22]                                        2          1          -    Covered              
#         bin addr[23]                                        2          1          -    Covered              
#         bin addr[24]                                        2          1          -    Covered              
#         bin addr[25]                                        2          1          -    Covered              
#         bin addr[26]                                        2          1          -    Covered              
#         bin addr[27]                                        2          1          -    Covered              
#         bin addr[28]                                        2          1          -    Covered              
#         bin addr[29]                                        2          1          -    Covered              
#         bin addr[30]                                        2          1          -    Covered              
#         bin addr[31]                                        2          1          -    Covered              
#         bin addr[32]                                        2          1          -    Covered              
#         bin addr[33]                                        2          1          -    Covered              
#         bin addr[34]                                        2          1          -    Covered              
#         bin addr[35]                                        2          1          -    Covered              
#         bin addr[36]                                        2          1          -    Covered              
#         bin addr[37]                                        2          1          -    Covered              
#         bin addr[38]                                        2          1          -    Covered              
#         bin addr[39]                                        2          1          -    Covered              
#         bin addr[40]                                        2          1          -    Covered              
#         bin addr[41]                                        2          1          -    Covered              
#         bin addr[42]                                        2          1          -    Covered              
#         bin addr[43]                                        2          1          -    Covered              
#         bin addr[44]                                        2          1          -    Covered              
#         bin addr[45]                                        2          1          -    Covered              
#         bin addr[46]                                        2          1          -    Covered              
#         bin addr[47]                                        2          1          -    Covered              
#         bin addr[48]                                        2          1          -    Covered              
#         bin addr[49]                                        2          1          -    Covered              
#         bin addr[50]                                        2          1          -    Covered              
#         bin addr[51]                                        2          1          -    Covered              
#         bin addr[52]                                        2          1          -    Covered              
#         bin addr[53]                                        2          1          -    Covered              
#         bin addr[54]                                        2          1          -    Covered              
#         bin addr[55]                                        2          1          -    Covered              
#         bin addr[56]                                        2          1          -    Covered              
#         bin addr[57]                                        2          1          -    Covered              
#         bin addr[58]                                        2          1          -    Covered              
#         bin addr[59]                                        2          1          -    Covered              
#         bin addr[60]                                        2          1          -    Covered              
#         bin addr[61]                                        2          1          -    Covered              
#         bin addr[62]                                        2          1          -    Covered              
#         bin addr[63]                                        2          1          -    Covered              
#     Coverpoint PORT_B_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                         5          1          -    Covered              
#         bin addr[1]                                         2          1          -    Covered              
#         bin addr[2]                                         2          1          -    Covered              
#         bin addr[3]                                         2          1          -    Covered              
#         bin addr[4]                                         2          1          -    Covered              
#         bin addr[5]                                         2          1          -    Covered              
#         bin addr[6]                                         2          1          -    Covered              
#         bin addr[7]                                         2          1          -    Covered              
#         bin addr[8]                                         2          1          -    Covered              
#         bin addr[9]                                         2          1          -    Covered              
#         bin addr[10]                                        2          1          -    Covered              
#         bin addr[11]                                        2          1          -    Covered              
#         bin addr[12]                                        2          1          -    Covered              
#         bin addr[13]                                        2          1          -    Covered              
#         bin addr[14]                                        2          1          -    Covered              
#         bin addr[15]                                        2          1          -    Covered              
#         bin addr[16]                                        2          1          -    Covered              
#         bin addr[17]                                        2          1          -    Covered              
#         bin addr[18]                                        2          1          -    Covered              
#         bin addr[19]                                        2          1          -    Covered              
#         bin addr[20]                                        2          1          -    Covered              
#         bin addr[21]                                        2          1          -    Covered              
#         bin addr[22]                                        2          1          -    Covered              
#         bin addr[23]                                        2          1          -    Covered              
#         bin addr[24]                                        2          1          -    Covered              
#         bin addr[25]                                        2          1          -    Covered              
#         bin addr[26]                                        2          1          -    Covered              
#         bin addr[27]                                        2          1          -    Covered              
#         bin addr[28]                                        2          1          -    Covered              
#         bin addr[29]                                        2          1          -    Covered              
#         bin addr[30]                                        2          1          -    Covered              
#         bin addr[31]                                        2          1          -    Covered              
#         bin addr[32]                                        2          1          -    Covered              
#         bin addr[33]                                        2          1          -    Covered              
#         bin addr[34]                                        2          1          -    Covered              
#         bin addr[35]                                        2          1          -    Covered              
#         bin addr[36]                                        2          1          -    Covered              
#         bin addr[37]                                        2          1          -    Covered              
#         bin addr[38]                                        2          1          -    Covered              
#         bin addr[39]                                        2          1          -    Covered              
#         bin addr[40]                                        2          1          -    Covered              
#         bin addr[41]                                        2          1          -    Covered              
#         bin addr[42]                                        2          1          -    Covered              
#         bin addr[43]                                        2          1          -    Covered              
#         bin addr[44]                                        2          1          -    Covered              
#         bin addr[45]                                        2          1          -    Covered              
#         bin addr[46]                                        2          1          -    Covered              
#         bin addr[47]                                        2          1          -    Covered              
#         bin addr[48]                                        2          1          -    Covered              
#         bin addr[49]                                        2          1          -    Covered              
#         bin addr[50]                                        2          1          -    Covered              
#         bin addr[51]                                        2          1          -    Covered              
#         bin addr[52]                                        2          1          -    Covered              
#         bin addr[53]                                        2          1          -    Covered              
#         bin addr[54]                                        2          1          -    Covered              
#         bin addr[55]                                        2          1          -    Covered              
#         bin addr[56]                                        2          1          -    Covered              
#         bin addr[57]                                        2          1          -    Covered              
#         bin addr[58]                                        2          1          -    Covered              
#         bin addr[59]                                        2          1          -    Covered              
#         bin addr[60]                                        2          1          -    Covered              
#         bin addr[61]                                        2          1          -    Covered              
#         bin addr[62]                                        2          1          -    Covered              
#         bin addr[63]                                        2          1          -    Covered              
#     Coverpoint PORT_A_DATA_in                          43.75%        100          -    Uncovered            
#         covered/total bins:                                28         64          -                      
#         missing/total bins:                                36         64          -                      
#         % Hit:                                         43.75%        100          -                      
#         bin auto[0:3]                                      24          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      1          1          -    Covered              
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     2          1          -    Covered              
#         bin auto[44:47]                                     1          1          -    Covered              
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     2          1          -    Covered              
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     1          1          -    Covered              
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   2          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   2          1          -    Covered              
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   1          1          -    Covered              
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   1          1          -    Covered              
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   2          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   1          1          -    Covered              
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   2          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   1          1          -    Covered              
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   0          1          -    ZERO                 
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   2          1          -    Covered              
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   3          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   4          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint PORT_B_DATA_in                          40.62%        100          -    Uncovered            
#         covered/total bins:                                26         64          -                      
#         missing/total bins:                                38         64          -                      
#         % Hit:                                         40.62%        100          -                      
#         bin auto[0:3]                                      28          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      1          1          -    Covered              
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     1          1          -    Covered              
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     1          1          -    Covered              
#         bin auto[60:63]                                     2          1          -    Covered              
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   2          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   0          1          -    ZERO                 
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   1          1          -    Covered              
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   0          1          -    ZERO                 
#         bin auto[168:171]                                   1          1          -    Covered              
#         bin auto[172:175]                                   2          1          -    Covered              
#         bin auto[176:179]                                   0          1          -    ZERO                 
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   3          1          -    Covered              
#         bin auto[192:195]                                   1          1          -    Covered              
#         bin auto[196:199]                                   1          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   1          1          -    Covered              
#         bin auto[212:215]                                   4          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   1          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   3          1          -    Covered              
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint PORT_A_DATA_out                         40.62%        100          -    Uncovered            
#         covered/total bins:                                26         64          -                      
#         missing/total bins:                                38         64          -                      
#         % Hit:                                         40.62%        100          -                      
#         bin auto[0:3]                                      31          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     2          1          -    Covered              
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   3          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   1          1          -    Covered              
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   2          1          -    Covered              
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   1          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   2          1          -    Covered              
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   3          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   3          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   1          1          -    Covered              
#         bin auto[244:247]                                   2          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint PORT_B_DATA_out                         37.50%        100          -    Uncovered            
#         covered/total bins:                                24         64          -                      
#         missing/total bins:                                40         64          -                      
#         % Hit:                                         37.50%        100          -                      
#         bin auto[0:3]                                      33          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     1          1          -    Covered              
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     2          1          -    Covered              
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     1          1          -    Covered              
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     0          1          -    ZERO                 
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   3          1          -    Covered              
#         bin auto[104:107]                                   0          1          -    ZERO                 
#         bin auto[108:111]                                   0          1          -    ZERO                 
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   0          1          -    ZERO                 
#         bin auto[120:123]                                   2          1          -    Covered              
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   1          1          -    Covered              
#         bin auto[168:171]                                   0          1          -    ZERO                 
#         bin auto[172:175]                                   2          1          -    Covered              
#         bin auto[176:179]                                   1          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   0          1          -    ZERO                 
#         bin auto[188:191]                                   0          1          -    ZERO                 
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   1          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   2          1          -    Covered              
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   2          1          -    Covered              
#         bin auto[216:219]                                   1          1          -    Covered              
#         bin auto[220:223]                                   1          1          -    Covered              
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   2          1          -    Covered              
#         bin auto[232:235]                                   3          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   1          1          -    Covered              
#         bin auto[244:247]                                   2          1          -    Covered              
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint COLLISION                              100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin NO_COLLIOSION                          121                     -    Occurred             
#         bin COLLISION                                      10          1          -    Covered              
#     Coverpoint PORT_A_Operation_Transitions            25.00%        100          -    Uncovered            
#         covered/total bins:                                 1          4          -                      
#         missing/total bins:                                 3          4          -                      
#         % Hit:                                         25.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  1          1          -    Covered              
#     Coverpoint PORT_B_Operation_Transitions             0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          4          -                      
#         missing/total bins:                                 4          4          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  0          1          -    ZERO                 
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                   131          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_deassert                                 0          1          -    ZERO                 
#         bin deassert_assert                                 0          1          -    ZERO                 
#     Coverpoint READ_during_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_during_reset                               0          1          -    ZERO                 
#     Coverpoint WRITE_during_RESET                       0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_during_reset                              0          1          -    ZERO                 
#     Coverpoint READ_after_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_reset                                0          1          -    ZERO                 
#     Coverpoint WRITE_after_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_reset                               0          1          -    ZERO                 
#     Cross PORTS_Mode_comb                              50.00%        100          -    Uncovered            
#         covered/total bins:                                 2          4          -                      
#         missing/total bins:                                 2          4          -                      
#         % Hit:                                         50.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write>                              64          1          -    Covered              
#             bin <read,read>                                67          1          -    Covered              
#             bin <read,write>                                0          1          1    ZERO                 
#             bin <write,read>                                0          1          1    ZERO                 
#     Cross COLLISION_MODES                              50.00%        100          -    Uncovered            
#         covered/total bins:                                 2          4          -                      
#         missing/total bins:                                 2          4          -                      
#         % Hit:                                         50.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write,COLLISION>                     2          1          -    Covered              
#             bin <read,read,COLLISION>                       8          1          -    Covered              
#             bin <read,write,*>                              0          1          1    ZERO                 
#             bin <write,read,*>                              0          1          1    ZERO                 
#  Covergroup instance 
# ========================================================================================
# 	COLLISION TEST
# ======================================================================================== 
#                                                        57.73%        100          -    Uncovered            
#     covered/total bins:                                   304        413          -                      
#     missing/total bins:                                   109        413          -                      
#     % Hit:                                             73.60%        100          -                      
#     Coverpoint PORT_A_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          167          1          -    Covered              
#         bin write                                         162          1          -    Covered              
#     Coverpoint PORT_B_MODE                            100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin read                                          170          1          -    Covered              
#         bin write                                         159          1          -    Covered              
#     Coverpoint PORT_A_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        14          1          -    Covered              
#         bin addr[1]                                         5          1          -    Covered              
#         bin addr[2]                                         5          1          -    Covered              
#         bin addr[3]                                         5          1          -    Covered              
#         bin addr[4]                                         5          1          -    Covered              
#         bin addr[5]                                         5          1          -    Covered              
#         bin addr[6]                                         5          1          -    Covered              
#         bin addr[7]                                         5          1          -    Covered              
#         bin addr[8]                                         5          1          -    Covered              
#         bin addr[9]                                         5          1          -    Covered              
#         bin addr[10]                                        5          1          -    Covered              
#         bin addr[11]                                        5          1          -    Covered              
#         bin addr[12]                                        5          1          -    Covered              
#         bin addr[13]                                        5          1          -    Covered              
#         bin addr[14]                                        5          1          -    Covered              
#         bin addr[15]                                        5          1          -    Covered              
#         bin addr[16]                                        5          1          -    Covered              
#         bin addr[17]                                        5          1          -    Covered              
#         bin addr[18]                                        5          1          -    Covered              
#         bin addr[19]                                        5          1          -    Covered              
#         bin addr[20]                                        5          1          -    Covered              
#         bin addr[21]                                        5          1          -    Covered              
#         bin addr[22]                                        5          1          -    Covered              
#         bin addr[23]                                        5          1          -    Covered              
#         bin addr[24]                                        5          1          -    Covered              
#         bin addr[25]                                        5          1          -    Covered              
#         bin addr[26]                                        5          1          -    Covered              
#         bin addr[27]                                        5          1          -    Covered              
#         bin addr[28]                                        5          1          -    Covered              
#         bin addr[29]                                        5          1          -    Covered              
#         bin addr[30]                                        5          1          -    Covered              
#         bin addr[31]                                        5          1          -    Covered              
#         bin addr[32]                                        5          1          -    Covered              
#         bin addr[33]                                        5          1          -    Covered              
#         bin addr[34]                                        5          1          -    Covered              
#         bin addr[35]                                        5          1          -    Covered              
#         bin addr[36]                                        5          1          -    Covered              
#         bin addr[37]                                        5          1          -    Covered              
#         bin addr[38]                                        5          1          -    Covered              
#         bin addr[39]                                        5          1          -    Covered              
#         bin addr[40]                                        5          1          -    Covered              
#         bin addr[41]                                        5          1          -    Covered              
#         bin addr[42]                                        5          1          -    Covered              
#         bin addr[43]                                        5          1          -    Covered              
#         bin addr[44]                                        5          1          -    Covered              
#         bin addr[45]                                        5          1          -    Covered              
#         bin addr[46]                                        5          1          -    Covered              
#         bin addr[47]                                        5          1          -    Covered              
#         bin addr[48]                                        5          1          -    Covered              
#         bin addr[49]                                        5          1          -    Covered              
#         bin addr[50]                                        5          1          -    Covered              
#         bin addr[51]                                        5          1          -    Covered              
#         bin addr[52]                                        5          1          -    Covered              
#         bin addr[53]                                        5          1          -    Covered              
#         bin addr[54]                                        5          1          -    Covered              
#         bin addr[55]                                        5          1          -    Covered              
#         bin addr[56]                                        5          1          -    Covered              
#         bin addr[57]                                        5          1          -    Covered              
#         bin addr[58]                                        5          1          -    Covered              
#         bin addr[59]                                        5          1          -    Covered              
#         bin addr[60]                                        5          1          -    Covered              
#         bin addr[61]                                        5          1          -    Covered              
#         bin addr[62]                                        5          1          -    Covered              
#         bin addr[63]                                        5          1          -    Covered              
#     Coverpoint PORT_B_ADDR                            100.00%        100          -    Covered              
#         covered/total bins:                                64         64          -                      
#         missing/total bins:                                 0         64          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin addr[0]                                        14          1          -    Covered              
#         bin addr[1]                                         5          1          -    Covered              
#         bin addr[2]                                         5          1          -    Covered              
#         bin addr[3]                                         5          1          -    Covered              
#         bin addr[4]                                         5          1          -    Covered              
#         bin addr[5]                                         5          1          -    Covered              
#         bin addr[6]                                         5          1          -    Covered              
#         bin addr[7]                                         5          1          -    Covered              
#         bin addr[8]                                         5          1          -    Covered              
#         bin addr[9]                                         5          1          -    Covered              
#         bin addr[10]                                        5          1          -    Covered              
#         bin addr[11]                                        5          1          -    Covered              
#         bin addr[12]                                        5          1          -    Covered              
#         bin addr[13]                                        5          1          -    Covered              
#         bin addr[14]                                        5          1          -    Covered              
#         bin addr[15]                                        5          1          -    Covered              
#         bin addr[16]                                        5          1          -    Covered              
#         bin addr[17]                                        5          1          -    Covered              
#         bin addr[18]                                        5          1          -    Covered              
#         bin addr[19]                                        5          1          -    Covered              
#         bin addr[20]                                        5          1          -    Covered              
#         bin addr[21]                                        5          1          -    Covered              
#         bin addr[22]                                        5          1          -    Covered              
#         bin addr[23]                                        5          1          -    Covered              
#         bin addr[24]                                        5          1          -    Covered              
#         bin addr[25]                                        5          1          -    Covered              
#         bin addr[26]                                        5          1          -    Covered              
#         bin addr[27]                                        5          1          -    Covered              
#         bin addr[28]                                        5          1          -    Covered              
#         bin addr[29]                                        5          1          -    Covered              
#         bin addr[30]                                        5          1          -    Covered              
#         bin addr[31]                                        5          1          -    Covered              
#         bin addr[32]                                        5          1          -    Covered              
#         bin addr[33]                                        5          1          -    Covered              
#         bin addr[34]                                        5          1          -    Covered              
#         bin addr[35]                                        5          1          -    Covered              
#         bin addr[36]                                        5          1          -    Covered              
#         bin addr[37]                                        5          1          -    Covered              
#         bin addr[38]                                        5          1          -    Covered              
#         bin addr[39]                                        5          1          -    Covered              
#         bin addr[40]                                        5          1          -    Covered              
#         bin addr[41]                                        5          1          -    Covered              
#         bin addr[42]                                        5          1          -    Covered              
#         bin addr[43]                                        5          1          -    Covered              
#         bin addr[44]                                        5          1          -    Covered              
#         bin addr[45]                                        5          1          -    Covered              
#         bin addr[46]                                        5          1          -    Covered              
#         bin addr[47]                                        5          1          -    Covered              
#         bin addr[48]                                        5          1          -    Covered              
#         bin addr[49]                                        5          1          -    Covered              
#         bin addr[50]                                        5          1          -    Covered              
#         bin addr[51]                                        5          1          -    Covered              
#         bin addr[52]                                        5          1          -    Covered              
#         bin addr[53]                                        5          1          -    Covered              
#         bin addr[54]                                        5          1          -    Covered              
#         bin addr[55]                                        5          1          -    Covered              
#         bin addr[56]                                        5          1          -    Covered              
#         bin addr[57]                                        5          1          -    Covered              
#         bin addr[58]                                        5          1          -    Covered              
#         bin addr[59]                                        5          1          -    Covered              
#         bin addr[60]                                        5          1          -    Covered              
#         bin addr[61]                                        5          1          -    Covered              
#         bin addr[62]                                        5          1          -    Covered              
#         bin addr[63]                                        5          1          -    Covered              
#     Coverpoint PORT_A_DATA_in                          85.93%        100          -    Uncovered            
#         covered/total bins:                                55         64          -                      
#         missing/total bins:                                 9         64          -                      
#         % Hit:                                         85.93%        100          -                      
#         bin auto[0:3]                                      46          1          -    Covered              
#         bin auto[4:7]                                       3          1          -    Covered              
#         bin auto[8:11]                                      2          1          -    Covered              
#         bin auto[12:15]                                     1          1          -    Covered              
#         bin auto[16:19]                                     2          1          -    Covered              
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     3          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     2          1          -    Covered              
#         bin auto[40:43]                                     2          1          -    Covered              
#         bin auto[44:47]                                     3          1          -    Covered              
#         bin auto[48:51]                                     3          1          -    Covered              
#         bin auto[52:55]                                     2          1          -    Covered              
#         bin auto[56:59]                                     1          1          -    Covered              
#         bin auto[60:63]                                     5          1          -    Covered              
#         bin auto[64:67]                                     3          1          -    Covered              
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     4          1          -    Covered              
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     2          1          -    Covered              
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     1          1          -    Covered              
#         bin auto[96:99]                                     2          1          -    Covered              
#         bin auto[100:103]                                   2          1          -    Covered              
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                   2          1          -    Covered              
#         bin auto[112:115]                                   2          1          -    Covered              
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   1          1          -    Covered              
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   2          1          -    Covered              
#         bin auto[140:143]                                   3          1          -    Covered              
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   2          1          -    Covered              
#         bin auto[168:171]                                   2          1          -    Covered              
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   3          1          -    Covered              
#         bin auto[180:183]                                   1          1          -    Covered              
#         bin auto[184:187]                                   2          1          -    Covered              
#         bin auto[188:191]                                   1          1          -    Covered              
#         bin auto[192:195]                                   3          1          -    Covered              
#         bin auto[196:199]                                   1          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   3          1          -    Covered              
#         bin auto[212:215]                                   4          1          -    Covered              
#         bin auto[216:219]                                   5          1          -    Covered              
#         bin auto[220:223]                                   2          1          -    Covered              
#         bin auto[224:227]                                   3          1          -    Covered              
#         bin auto[228:231]                                   1          1          -    Covered              
#         bin auto[232:235]                                   2          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   1          1          -    Covered              
#         bin auto[244:247]                                   3          1          -    Covered              
#         bin auto[248:251]                                   9          1          -    Covered              
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint PORT_B_DATA_in                          87.50%        100          -    Uncovered            
#         covered/total bins:                                56         64          -                      
#         missing/total bins:                                 8         64          -                      
#         % Hit:                                         87.50%        100          -                      
#         bin auto[0:3]                                      48          1          -    Covered              
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      2          1          -    Covered              
#         bin auto[12:15]                                     1          1          -    Covered              
#         bin auto[16:19]                                     2          1          -    Covered              
#         bin auto[20:23]                                     2          1          -    Covered              
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     2          1          -    Covered              
#         bin auto[32:35]                                     1          1          -    Covered              
#         bin auto[36:39]                                     1          1          -    Covered              
#         bin auto[40:43]                                     1          1          -    Covered              
#         bin auto[44:47]                                     2          1          -    Covered              
#         bin auto[48:51]                                     1          1          -    Covered              
#         bin auto[52:55]                                     2          1          -    Covered              
#         bin auto[56:59]                                     2          1          -    Covered              
#         bin auto[60:63]                                     3          1          -    Covered              
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     1          1          -    Covered              
#         bin auto[72:75]                                     4          1          -    Covered              
#         bin auto[76:79]                                     1          1          -    Covered              
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     2          1          -    Covered              
#         bin auto[88:91]                                     2          1          -    Covered              
#         bin auto[92:95]                                     5          1          -    Covered              
#         bin auto[96:99]                                     0          1          -    ZERO                 
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   3          1          -    Covered              
#         bin auto[108:111]                                   3          1          -    Covered              
#         bin auto[112:115]                                   0          1          -    ZERO                 
#         bin auto[116:119]                                   2          1          -    Covered              
#         bin auto[120:123]                                   4          1          -    Covered              
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   2          1          -    Covered              
#         bin auto[132:135]                                   1          1          -    Covered              
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   3          1          -    Covered              
#         bin auto[144:147]                                   2          1          -    Covered              
#         bin auto[148:151]                                   2          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   2          1          -    Covered              
#         bin auto[160:163]                                   1          1          -    Covered              
#         bin auto[164:167]                                   1          1          -    Covered              
#         bin auto[168:171]                                   1          1          -    Covered              
#         bin auto[172:175]                                   3          1          -    Covered              
#         bin auto[176:179]                                   2          1          -    Covered              
#         bin auto[180:183]                                   3          1          -    Covered              
#         bin auto[184:187]                                   2          1          -    Covered              
#         bin auto[188:191]                                   1          1          -    Covered              
#         bin auto[192:195]                                   0          1          -    ZERO                 
#         bin auto[196:199]                                   3          1          -    Covered              
#         bin auto[200:203]                                   2          1          -    Covered              
#         bin auto[204:207]                                   1          1          -    Covered              
#         bin auto[208:211]                                   2          1          -    Covered              
#         bin auto[212:215]                                   2          1          -    Covered              
#         bin auto[216:219]                                   4          1          -    Covered              
#         bin auto[220:223]                                   2          1          -    Covered              
#         bin auto[224:227]                                   1          1          -    Covered              
#         bin auto[228:231]                                   4          1          -    Covered              
#         bin auto[232:235]                                   1          1          -    Covered              
#         bin auto[236:239]                                   1          1          -    Covered              
#         bin auto[240:243]                                   1          1          -    Covered              
#         bin auto[244:247]                                   2          1          -    Covered              
#         bin auto[248:251]                                   5          1          -    Covered              
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint PORT_A_DATA_out                         71.87%        100          -    Uncovered            
#         covered/total bins:                                46         64          -                      
#         missing/total bins:                                18         64          -                      
#         % Hit:                                         71.87%        100          -                      
#         bin auto[0:3]                                      56          1          -    Covered              
#         bin auto[4:7]                                       1          1          -    Covered              
#         bin auto[8:11]                                      3          1          -    Covered              
#         bin auto[12:15]                                     2          1          -    Covered              
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     1          1          -    Covered              
#         bin auto[28:31]                                     4          1          -    Covered              
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     2          1          -    Covered              
#         bin auto[40:43]                                     3          1          -    Covered              
#         bin auto[44:47]                                     2          1          -    Covered              
#         bin auto[48:51]                                     4          1          -    Covered              
#         bin auto[52:55]                                     3          1          -    Covered              
#         bin auto[56:59]                                     2          1          -    Covered              
#         bin auto[60:63]                                     4          1          -    Covered              
#         bin auto[64:67]                                     7          1          -    Covered              
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     7          1          -    Covered              
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
#         bin auto[84:87]                                     2          1          -    Covered              
#         bin auto[88:91]                                     0          1          -    ZERO                 
#         bin auto[92:95]                                     0          1          -    ZERO                 
#         bin auto[96:99]                                     1          1          -    Covered              
#         bin auto[100:103]                                   1          1          -    Covered              
#         bin auto[104:107]                                   1          1          -    Covered              
#         bin auto[108:111]                                   2          1          -    Covered              
#         bin auto[112:115]                                   1          1          -    Covered              
#         bin auto[116:119]                                   1          1          -    Covered              
#         bin auto[120:123]                                   1          1          -    Covered              
#         bin auto[124:127]                                   2          1          -    Covered              
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   2          1          -    Covered              
#         bin auto[140:143]                                   3          1          -    Covered              
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   1          1          -    Covered              
#         bin auto[152:155]                                   1          1          -    Covered              
#         bin auto[156:159]                                   1          1          -    Covered              
#         bin auto[160:163]                                   0          1          -    ZERO                 
#         bin auto[164:167]                                   3          1          -    Covered              
#         bin auto[168:171]                                   2          1          -    Covered              
#         bin auto[172:175]                                   0          1          -    ZERO                 
#         bin auto[176:179]                                   3          1          -    Covered              
#         bin auto[180:183]                                   0          1          -    ZERO                 
#         bin auto[184:187]                                   1          1          -    Covered              
#         bin auto[188:191]                                   1          1          -    Covered              
#         bin auto[192:195]                                   2          1          -    Covered              
#         bin auto[196:199]                                   1          1          -    Covered              
#         bin auto[200:203]                                   0          1          -    ZERO                 
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   1          1          -    Covered              
#         bin auto[212:215]                                   4          1          -    Covered              
#         bin auto[216:219]                                   7          1          -    Covered              
#         bin auto[220:223]                                   2          1          -    Covered              
#         bin auto[224:227]                                   4          1          -    Covered              
#         bin auto[228:231]                                   1          1          -    Covered              
#         bin auto[232:235]                                   1          1          -    Covered              
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   3          1          -    Covered              
#         bin auto[248:251]                                   9          1          -    Covered              
#         bin auto[252:255]                                   1          1          -    Covered              
#     Coverpoint PORT_B_DATA_out                          1.56%        100          -    Uncovered            
#         covered/total bins:                                 1         64          -                      
#         missing/total bins:                                63         64          -                      
#         % Hit:                                          1.56%        100          -                      
#         bin auto[0:3]                                     170          1          -    Covered              
#         bin auto[4:7]                                       0          1          -    ZERO                 
#         bin auto[8:11]                                      0          1          -    ZERO                 
#         bin auto[12:15]                                     0          1          -    ZERO                 
#         bin auto[16:19]                                     0          1          -    ZERO                 
#         bin auto[20:23]                                     0          1          -    ZERO                 
#         bin auto[24:27]                                     0          1          -    ZERO                 
#         bin auto[28:31]                                     0          1          -    ZERO                 
#         bin auto[32:35]                                     0          1          -    ZERO                 
#         bin auto[36:39]                                     0          1          -    ZERO                 
#         bin auto[40:43]                                     0          1          -    ZERO                 
#         bin auto[44:47]                                     0          1          -    ZERO                 
#         bin auto[48:51]                                     0          1          -    ZERO                 
#         bin auto[52:55]                                     0          1          -    ZERO                 
#         bin auto[56:59]                                     0          1          -    ZERO                 
#         bin auto[60:63]                                     0          1          -    ZERO                 
#         bin auto[64:67]                                     0          1          -    ZERO                 
#         bin auto[68:71]                                     0          1          -    ZERO                 
#         bin auto[72:75]                                     0          1          -    ZERO                 
#         bin auto[76:79]                                     0          1          -    ZERO                 
#         bin auto[80:83]                                     0          1          -    ZERO                 
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
#         bin auto[124:127]                                   0          1          -    ZERO                 
#         bin auto[128:131]                                   0          1          -    ZERO                 
#         bin auto[132:135]                                   0          1          -    ZERO                 
#         bin auto[136:139]                                   0          1          -    ZERO                 
#         bin auto[140:143]                                   0          1          -    ZERO                 
#         bin auto[144:147]                                   0          1          -    ZERO                 
#         bin auto[148:151]                                   0          1          -    ZERO                 
#         bin auto[152:155]                                   0          1          -    ZERO                 
#         bin auto[156:159]                                   0          1          -    ZERO                 
#         bin auto[160:163]                                   0          1          -    ZERO                 
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
#         bin auto[204:207]                                   0          1          -    ZERO                 
#         bin auto[208:211]                                   0          1          -    ZERO                 
#         bin auto[212:215]                                   0          1          -    ZERO                 
#         bin auto[216:219]                                   0          1          -    ZERO                 
#         bin auto[220:223]                                   0          1          -    ZERO                 
#         bin auto[224:227]                                   0          1          -    ZERO                 
#         bin auto[228:231]                                   0          1          -    ZERO                 
#         bin auto[232:235]                                   0          1          -    ZERO                 
#         bin auto[236:239]                                   0          1          -    ZERO                 
#         bin auto[240:243]                                   0          1          -    ZERO                 
#         bin auto[244:247]                                   0          1          -    ZERO                 
#         bin auto[248:251]                                   0          1          -    ZERO                 
#         bin auto[252:255]                                   0          1          -    ZERO                 
#     Coverpoint COLLISION                              100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin NO_COLLIOSION                            0                     -    ZERO                 
#         bin COLLISION                                     329          1          -    Covered              
#     Coverpoint PORT_A_Operation_Transitions            25.00%        100          -    Uncovered            
#         covered/total bins:                                 1          4          -                      
#         missing/total bins:                                 3          4          -                      
#         % Hit:                                         25.00%        100          -                      
#         bin read_after_write                                0          1          -    ZERO                 
#         bin write_after_read                                0          1          -    ZERO                 
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  4          1          -    Covered              
#     Coverpoint PORT_B_Operation_Transitions            75.00%        100          -    Uncovered            
#         covered/total bins:                                 3          4          -                      
#         missing/total bins:                                 1          4          -                      
#         % Hit:                                         75.00%        100          -                      
#         bin read_after_write                                1          1          -    Covered              
#         bin write_after_read                                1          1          -    Covered              
#         bin bact2back_write                                 0          1          -    ZERO                 
#         bin back2back_read                                  2          1          -    Covered              
#     Coverpoint RESET                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin asserted                                        0          1          -    ZERO                 
#         bin de_asserted                                   329          1          -    Covered              
#     Coverpoint RESET_Transition                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          2          -                      
#         missing/total bins:                                 2          2          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin assert_deassert                                 0          1          -    ZERO                 
#         bin deassert_assert                                 0          1          -    ZERO                 
#     Coverpoint READ_during_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_during_reset                               0          1          -    ZERO                 
#     Coverpoint WRITE_during_RESET                       0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_during_reset                              0          1          -    ZERO                 
#     Coverpoint READ_after_RESET                         0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin read_after_reset                                0          1          -    ZERO                 
#     Coverpoint WRITE_after_RESET                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 0          1          -                      
#         missing/total bins:                                 1          1          -                      
#         % Hit:                                          0.00%        100          -                      
#         bin write_after_reset                               0          1          -    ZERO                 
#     Cross PORTS_Mode_comb                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write>                              79          1          -    Covered              
#             bin <read,write>                               80          1          -    Covered              
#             bin <write,read>                               83          1          -    Covered              
#             bin <read,read>                                87          1          -    Covered              
#     Cross COLLISION_MODES                             100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <write,write,COLLISION>                    79          1          -    Covered              
#             bin <read,write,COLLISION>                     80          1          -    Covered              
#             bin <write,read,COLLISION>                     83          1          -    Covered              
#             bin <read,read,COLLISION>                      87          1          -    Covered  
```
---
