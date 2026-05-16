# Synchronous Decade Counter Verification Results

## Simulation Status

```diff
+ SIMULATION PASSED
+ DUT : SYNCHRONOUS DECADE COUNTER WITH SYNCHRONOUS RESET
+ Total Errors : 0
```

---

# Console Output

```systemverilog
==================================================================
    SYNC DECADE COUNTER WITH SYNC RESET VERIFICATION STARTED
==================================================================
[MONITOR] : rst=1 q=0
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=1 q=6
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=1 q=9
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=1 q=3
[MONITOR] : rst=0 q=0
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
[MONITOR] : rst=1 q=8
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=0 q=8
[MONITOR] : rst=1 q=9
[MONITOR] : rst=0 q=0
[MONITOR] : rst=1 q=1
[MONITOR] : rst=0 q=0
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
[MONITOR] : rst=1 q=1
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=1 q=2
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=1 q=5
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=0 q=5
[MONITOR] : rst=0 q=6
[MONITOR] : rst=0 q=7
[MONITOR] : rst=1 q=8
[MONITOR] : rst=0 q=0
[MONITOR] : rst=1 q=1
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4
[MONITOR] : rst=1 q=5
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=1 q=3
[MONITOR] : rst=0 q=0
[MONITOR] : rst=0 q=1
[MONITOR] : rst=0 q=2
[MONITOR] : rst=0 q=3
[MONITOR] : rst=0 q=4

===================================
        DESIGN STATUS
===================================
DECADE COUNTER VERIFICATION PASSED
Total Errors = 0
===================================
```

---

# Verification Summary

| Parameter | Status |
|---|---|
| DUT | Synchronous Decade Counter |
| Counter Type | MOD-10 Counter |
| Reset Type | Synchronous Reset |
| Transactions Tested | 100 |
| Errors Detected | 0 |
| Verification Result | PASSED |

---


# Expected Counter Sequence

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

---

# Observations

- Counter incremented correctly on every positive clock edge
- Counter successfully wrapped from 9 back to 0
- Synchronous reset operation verified successfully
- No Mismatch encountered during simulation




- No mismatches detected between expected and actual counter values
- Verification environment operated correctly throughout simulation
