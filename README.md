# Computer Architecture – Assembly Homework

This repository contains two homework assignments completed as part of a university course
on computer architecture. The course covered the general architecture of a computer and its
individual components. Both assignments were implemented in **MIPS assembly language**.

---

## Assignment 1 – ZIP Code Extraction (`plz`)

**Task:** Given a string (typically a postal address), extract and return the first sequence
of exactly five consecutive digits as an integer.

**Approach:**
- Iterate character by character through the input string
- Track consecutive digit characters using a counter
- Once five consecutive digits are found, convert the ASCII sequence to an integer
  using repeated multiply-by-10 accumulation (`x * 10 = x * 8 + x * 2` via bit shifts)
- Return 0 if no valid ZIP code is found

**Example:**
```
address: 81212 Konstanz Hauptbahnhof
Rueckgabewert: 81212
```

---

## Assignment 2 – Substring Count (`count`)

**Task:** Given two strings `text` and `part`, count and return how many times `part`
appears in `text`.

**Approach:**
- Uses a **rolling hash** (via the provided `rollhash` helper function) to efficiently
  compare a sliding window of `text` against the hash of `part`
- The hash of `part` is computed once during initialization
- A sliding window of the same length is maintained over `text`, updating the hash
  incrementally by adding the incoming character and removing the outgoing one
- When the two hashes match, the occurrence counter is incremented

**Example:**
```
text: AxyzTESTxyz1xyxyzxyz
part: xyz
Rueckgabewert: 4
```
