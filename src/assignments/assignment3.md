
<center>
    <h1>Assignment 3</h1>
</center>

---

## Problem Statement

Perform Statistical Fault attack on AES implementation to recover a byte of the last round key.

## Description

The assignment focuses upon implementation of an attack on AES by leveraging faulty ciphertexts to recover the encryption key.

- In this assignment, you will be given multiple faulty ciphertexts, the fault has been injected at the input of 10th round at the `0th` byte of the state.
- The fault is a single bit flip randomly happening at any of the bits in the `0th` byte i.e. in two faulty executions the index of the faulty bit can be different.
- You have to do a statistical fault attack to analyze the faulty ciphertexts and determine the `0th` byte of the AES last round key.

**Note:** You may need to find out your own distinguisher function and SEI metric defined in the class **should not** be used.

## Instructions

- Each team is assigned with their own faulty ciphertexts. You can download your faulty cipher texts by clicking the following link: [fault_ciphertexts](https://iitbacin-my.sharepoint.com/:f:/g/personal/23m0815_iitb_ac_in/Eo4JFLu0ELVDghTf_Ot9G_gBPkmZIKwEg-ZwF4mY9YILxA?e=Z2lkGx)
- **Input file:**: The program takes a text file as an argument, where each line contains a faulty ciphertext, the last line contains the correct key byte which you can use to verify your output.
- **Output:** Your code output should **only** print the correct byte of the AES last round key and no other text should be printed.
- **Note:** The output should be in hexadecimal format, i.e. `0x00` to `0xFF`.
- **Example:** If the correct key byte is `0x01`, your output should be:

  ```bash
     python assignment3.py <input_file>
     0x01
  ```

> **IMPORTANT:** Kindly read the document at this [link](https://docs.google.com/document/d/1mSn4DSswocpQWICLW3UECwfau9wv4tnNMKFrlwPCODQ/edit?usp=sharing) to create a private repository for the assignment. Do not push everything at the last moment. Maintain a proper commit history.

## Deadline: 10th April 2025, 23:59 Hrs

---

## Deliverables

1. **Code Execution Output:** Run the script with provided faulty ciphertexts and submit the generated results.
2. **Report:** Submit a brief report including:
      - Explanation of how your distinguisher works.
      - Observations regarding each of the methods you tried.

---

## Evaluation Criteria

- Correctness of implementation and execution.
- Clarity of explanations in the report.
- Github commits.
- Your code should work on our input files that are not available with you.
- A well documented report in the form of a README file.

## Additional Notes

- The provided script assumes AES encryption knowledge and specifically focuses on analyzing the first byte of each faulty ciphertext.
- Feel free to modify and extend the script for further analysis.

---

## Submission

Create a directory named `<team-name>_a3` which contains the following files:
- `assignment3.py`
- `README.md`

Compress this directory into a `tar.gz` file using the command:

```sh
tar -czvf <team-name>_a3.tar.gz <team-name>_a3
```

Upload this `<team-name>_a3.tar.gz` on the Moodle at the **respective link**.

> **IMPORTANT:** Apart from updating your team's private GitHub repository for this assignment, you also need to upload your submission on Moodle.

---

<br>
<center>
  Best Wishes! 😊
</center>
<br>

---
