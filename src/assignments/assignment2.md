
<center>
    <h1>Assignment 2</h1>
</center>

---

## Problem Statement

Perform Correlation Power Analysis (CPA) attack on AES implementation to recover the secret key.

## Description

The goal is to analyze power traces collected from an AES hardware implementation and use statistical techniques to deduce the encryption key.

Download the trace assigned to your team from this link: [power_traces](https://iitbacin-my.sharepoint.com/:f:/g/personal/23m0815_iitb_ac_in/EtmktXQHLtVBmngzaOJQmIEBLj7-1JvfmUHx2CX2YmNaQA?e=PFHkq3)

> **IMPORTANT:** Kindly read the document at this [link](https://docs.google.com/document/d/1mSn4DSswocpQWICLW3UECwfau9wv4tnNMKFrlwPCODQ/edit?usp=sharing) to create a private repository for the assignment. Do not push everything at the last moment. Maintain a proper commit history.

## Deadline: 13th March 2025, 17:00 Hrs

---

## Objective

- Understand side-channel attacks, specifically CPA.
- Work with real-world power traces which is given to each team. Note-Each team is assigned with different power traces.
- Remove noise from the power traces. The original power trace has `5000` length and contains `250` points with random noise.
- Implement statistical correlation techniques to retrieve encryption key i.e. Implement a CPA attack to derive the encryption key from power traces.

## Provided Code

The provided `IPython Notebook` file (`.ipynb`) template sets up the environment for conducting a CPA attack. The template contains the following sections:

- Reads a dataset containing
  - Power traces (`trace_array`)
  - Plaintext (`textin_array`)
  - Ciphertext (`textout_array`)
  - Key used for encryption (`key_array`)
- Defines AES substitution box (`sbox`) for byte substitution operation
- Prints trace_array shape, sample plaintext, actual key, and ciphertext for reference

  <center>
    <iframe
      src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=python&width=680&ds=false&dsyoff=20px&dsblur=68px&wc=false&wa=true&pv=7px&ph=7px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2523%2520put%2520the%2520path%2520of%2520the%2520downloaded%2520h5%2520file%2520which%2520was%2520assigned%2520to%2520your%2520team%250Afile%2520%253D%2520%2522path_to_file%252Fteam_name.h5%2522%250A%250A%2523------------------------------DO%2520NOT%2520EDIT%2520THE%2520BELOW%2520CODE----------------------------------%2523%250Aimport%2520h5py%250Aimport%2520numpy%2520as%2520np%250Awith%2520h5py.File%28file%252C%2520%2522r%2522%29%2520as%2520hf%253A%250A%2520%2520%2520%2520trace_array%2520%253D%2520np.array%28hf%255B%2522trace_array%2522%255D%29%250A%2520%2520%2520%2520textin_array%2520%253D%2520np.array%28hf%255B%2522textin_array%2522%255D%29%250A%2520%2520%2520%2520textout_array%2520%253D%2520np.array%28hf%255B%2522textout_array%2522%255D%29%250A%2520%2520%2520%2520key_array%2520%253D%2520np.array%28hf%255B%2522key_array%2522%255D%29%250A%250Asbox%2520%253D%2520%255B%250A%2520%2520%2520%2520%2523%25200%2520%2520%2520%25201%2520%2520%2520%25202%2520%2520%2520%25203%2520%2520%2520%25204%2520%2520%2520%25205%2520%2520%2520%25206%2520%2520%2520%25207%2520%2520%2520%25208%2520%2520%2520%25209%2520%2520%2520%2520a%2520%2520%2520%2520b%2520%2520%2520%2520c%2520%2520%2520%2520d%2520%2520%2520%2520e%2520%2520%2520%2520f%2520%250A%2520%2520%2520%25200x63%252C0x7c%252C0x77%252C0x7b%252C0xf2%252C0x6b%252C0x6f%252C0xc5%252C0x30%252C0x01%252C0x67%252C0x2b%252C0xfe%252C0xd7%252C0xab%252C0x76%252C%2520%2523%25200%250A%2520%2520%2520%25200xca%252C0x82%252C0xc9%252C0x7d%252C0xfa%252C0x59%252C0x47%252C0xf0%252C0xad%252C0xd4%252C0xa2%252C0xaf%252C0x9c%252C0xa4%252C0x72%252C0xc0%252C%2520%2523%25201%250A%2520%2520%2520%25200xb7%252C0xfd%252C0x93%252C0x26%252C0x36%252C0x3f%252C0xf7%252C0xcc%252C0x34%252C0xa5%252C0xe5%252C0xf1%252C0x71%252C0xd8%252C0x31%252C0x15%252C%2520%2523%25202%250A%2520%2520%2520%25200x04%252C0xc7%252C0x23%252C0xc3%252C0x18%252C0x96%252C0x05%252C0x9a%252C0x07%252C0x12%252C0x80%252C0xe2%252C0xeb%252C0x27%252C0xb2%252C0x75%252C%2520%2523%25203%250A%2520%2520%2520%25200x09%252C0x83%252C0x2c%252C0x1a%252C0x1b%252C0x6e%252C0x5a%252C0xa0%252C0x52%252C0x3b%252C0xd6%252C0xb3%252C0x29%252C0xe3%252C0x2f%252C0x84%252C%2520%2523%25204%250A%2520%2520%2520%25200x53%252C0xd1%252C0x00%252C0xed%252C0x20%252C0xfc%252C0xb1%252C0x5b%252C0x6a%252C0xcb%252C0xbe%252C0x39%252C0x4a%252C0x4c%252C0x58%252C0xcf%252C%2520%2523%25205%250A%2520%2520%2520%25200xd0%252C0xef%252C0xaa%252C0xfb%252C0x43%252C0x4d%252C0x33%252C0x85%252C0x45%252C0xf9%252C0x02%252C0x7f%252C0x50%252C0x3c%252C0x9f%252C0xa8%252C%2520%2523%25206%250A%2520%2520%2520%25200x51%252C0xa3%252C0x40%252C0x8f%252C0x92%252C0x9d%252C0x38%252C0xf5%252C0xbc%252C0xb6%252C0xda%252C0x21%252C0x10%252C0xff%252C0xf3%252C0xd2%252C%2520%2523%25207%250A%2520%2520%2520%25200xcd%252C0x0c%252C0x13%252C0xec%252C0x5f%252C0x97%252C0x44%252C0x17%252C0xc4%252C0xa7%252C0x7e%252C0x3d%252C0x64%252C0x5d%252C0x19%252C0x73%252C%2520%2523%25208%250A%2520%2520%2520%25200x60%252C0x81%252C0x4f%252C0xdc%252C0x22%252C0x2a%252C0x90%252C0x88%252C0x46%252C0xee%252C0xb8%252C0x14%252C0xde%252C0x5e%252C0x0b%252C0xdb%252C%2520%2523%25209%250A%2520%2520%2520%25200xe0%252C0x32%252C0x3a%252C0x0a%252C0x49%252C0x06%252C0x24%252C0x5c%252C0xc2%252C0xd3%252C0xac%252C0x62%252C0x91%252C0x95%252C0xe4%252C0x79%252C%2520%2523%2520a%250A%2520%2520%2520%25200xe7%252C0xc8%252C0x37%252C0x6d%252C0x8d%252C0xd5%252C0x4e%252C0xa9%252C0x6c%252C0x56%252C0xf4%252C0xea%252C0x65%252C0x7a%252C0xae%252C0x08%252C%2520%2523%2520b%250A%2520%2520%2520%25200xba%252C0x78%252C0x25%252C0x2e%252C0x1c%252C0xa6%252C0xb4%252C0xc6%252C0xe8%252C0xdd%252C0x74%252C0x1f%252C0x4b%252C0xbd%252C0x8b%252C0x8a%252C%2520%2523%2520c%250A%2520%2520%2520%25200x70%252C0x3e%252C0xb5%252C0x66%252C0x48%252C0x03%252C0xf6%252C0x0e%252C0x61%252C0x35%252C0x57%252C0xb9%252C0x86%252C0xc1%252C0x1d%252C0x9e%252C%2520%2523%2520d%250A%2520%2520%2520%25200xe1%252C0xf8%252C0x98%252C0x11%252C0x69%252C0xd9%252C0x8e%252C0x94%252C0x9b%252C0x1e%252C0x87%252C0xe9%252C0xce%252C0x55%252C0x28%252C0xdf%252C%2520%2523%2520e%250A%2520%2520%2520%25200x8c%252C0xa1%252C0x89%252C0x0d%252C0xbf%252C0xe6%252C0x42%252C0x68%252C0x41%252C0x99%252C0x2d%252C0x0f%252C0xb0%252C0x54%252C0xbb%252C0x16%2520%2520%2523%2520f%250A%255D%250Aprint%28trace_array.shape%29%250Aprint%28%27plaintext%253A%27%252Ctextin_array%255B0%255D%29%250Aprint%28%27actual%2520key%253A%27%252Ckey_array%255B0%255D%29%250Aprint%28%27ciphertext%253A%27%252Ctextout_array%255B0%255D%29%250A"
      style="width: 813px; height: 714px; border:0; transform: scale(1); overflow:hidden;"
      sandbox="allow-scripts allow-same-origin">
    </iframe>
  </center>

## Expected Outcome

Upon successful implementation, the program should output a key guess that matches the actual encryption key. You should compare the derived key with the original key and analyze the correlation results.

---

## Evaluation Criteria

- Correct implementation of statistical functions.
- Accuracy of the key guess.
- Understanding and explanation of the CPA technique.
- Correlation plots to analyze the given trace with and without the random noise.
- A README file explaining the techniques and results the team has achieved. The README should also contain plots and their respective inferences.

## Additional Notes

- The assignment requires basic knowledge of AES encryption and Python programming.
- Ensure that all required dependencies (`numpy`, `h5py`) are installed.
- Submit a well-commented code explaining each step of the process.

---

## Submission

Create a directory named `<team-name>_a2` which contains the following files:
- `assignment2.ipynb`
- `README.md`

Compress this directory into a `tar.gz` file using the command:

```sh
tar -czvf <team-name>_a2.tar.gz <team-name>_a2
```

Upload this `<team-name>_a2.tar.gz` on the Moodle at the **respective link**.

> **IMPORTANT:** Apart from updating your team's private GitHub repository for this assignment, you also need to upload your submission on Moodle.

---

<br>
<center>
  Best Wishes! 😊
</center>
<br>

---
