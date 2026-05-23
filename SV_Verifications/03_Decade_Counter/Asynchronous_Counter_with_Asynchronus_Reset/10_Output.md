# Asynchronous Decade Counter Verification Results

![Status](https://img.shields.io/badge/Simulation-PASSED-brightgreen)
![DUT](https://img.shields.io/badge/DUT-Asynchronous%20Decade%20Counter-blue)
![Reset-Type](https://img.shields.io/badge/Reset-Asynchronous-orange)
![Errors](https://img.shields.io/badge/Errors-0-success)
![Coverage](https://img.shields.io/badge/Coverage-Implicit%20Checked-lightgrey)

---

## Simulation Status

```diff
+ SIMULATION PASSED
+ DUT : ASYNCHRONOUS DECADE COUNTER WITH ASYNCHRONOUS RESET
+ Counter Type : MOD-10 (0 → 9 → 0)
+ Total Transactions : 100
+ Total Errors : 0
```

---

## Console Output

```systemverilog
==================================================================
    ASYNC DECADE COUNTER VERIFICATION STARTED
==================================================================
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=0 q=9
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=0 q=9
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=0 q=9
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=0 q=9
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=1 q=0
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4

==================================================================
        DESIGN STATUS
==================================================================
ASYNC DECADE COUNTER VERIFICATION PASSED
Total Errors = 0
==================================================================
```

---

## Verification Summary

| Parameter | Value |
|----------|-------|
| DUT | Asynchronous Decade Counter |
| Counter Type | MOD-10 (0–9 sequence) |
| Reset Type | Asynchronous Reset (active high) |
| Transactions Tested | 100 |
| Functional Checks | Reset behavior, wrap-around, sequencing |
| Errors Detected | 0 |
| Verification Result | PASSED |

---

## Expected Counter Behavior

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

---

## Key Observations

- Counter transitions verified across all 10 states (MOD-10 behavior)
- Asynchronous reset correctly forces immediate Q → 0 irrespective of clock
- Back-to-back reset assertions handled correctly
- Proper wrap-around observed from 9 → 0 without glitches in sampled output
- No mismatches between DUT output and scoreboard expected model
- Functional stability confirmed under randomized reset stimulus

---

## Conclusion

The Asynchronous Decade Counter design has been successfully verified using a constrained-random SystemVerilog testbench. The DUT demonstrates correct MOD-10 counting behavior with reliable asynchronous reset handling. All 100 transactions passed without mismatch, confirming functional correctness.
