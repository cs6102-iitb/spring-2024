<center>
    <h1>Welcome to Implementation Security in Cryptography</h1>
    <h2>Instructor: <a href="https://sites.google.com/view/sayandeepsaha/home" target=_blank>Prof. Sayandeep Saha</a></h2>
</center>

---------

<h2>Course Details</h2>


<table>

<tr>
<td>

* Lecture Slot: 6
* Lecture Venue: CC 105
* Lecture Days: Wednesday and Friday \
(11:05 am to 12:30 pm)
* Piazza class: [link](https://piazza.com/iit_bombay/spring2025/cs6102) \
Access code: `cs6102`
* Instructor office hours: After class or get \
an appointment via email

</td>
<td>

TAs:
- [Kalind Karia](https://kalindkaria.github.io/) (kalind.karia@iitb.ac.in)
- [Giriraj Singh](https://rajsng3737.github.io/) (23m0815@iitb.ac.in)

</td>
</tr>
</table>

<br>

---------

<h2>Course Outline</h2>

Checkout the <a href="https://sites.google.com/view/sayandeepsaha/courses/implementation-security-in-cryptography" target=_blank>course page</a>.

<br>

---------

<h2>Grading Policy (Tentative)</h2>

- Programming Assignments  : **30 %** (Best 2 among 3 will be considered)
- Quiz                     : **15 %** (Best of 2 will be considered)
- Midsem, Endsem           : **40 %**
- Paper Presentation       : **15 %** (Physical; Group/Individual)

**Bonus Marks**

1. Best Presentation                    : +5
2. Best assignment                      : +5
3. "Optional" extra coding assignment   : +5 (max.)
4. Constructive and useful feedback     : +2

---------

<h2>Lecture Schedule (Tentative)</h2>

1. Week 1 to 2: Connecting the dots and building the basics
    - How does the hardware security connect to the theory of crypto
    - Basics of block ciphers and hardware design

2. Week 3 to 5/6: Hardware design of AES
    - Finite field maths
    - Finite field multiplier
    - AES design

3. Week 7 to 9: Side-channel attacks
    - Power attack basics
    - Different types of power attacks
    - Power attack countermeasures

4. Week 10 onwards
    - Fault attacks
    - Fault attack countermeasures
    - Advanced topics
    - Paper presentations

---
<br>

|   Date    | Lecture Topic | Pre-req |  Lecture Slides  |  Reading Material  |
| :-------------: | :--------------------------------------------: | :-------------: | :-------------: | :-------------: |
|   Jan 08  |  Course Prelude, Introduction |  -  |  [pdf](./downloadables/lec_slides/ISC_lec1.pdf)  |  -  |
|   Jan 10  |  Intro to Theoretical Cryptography |  -  | [pdf](./downloadables/lec_slides/ISC_lec2.pdf)  |  Intro to Modern Cryptography, Chapters 2 to 3.4 <br>[pdf](./downloadables/ref_books/intro_to_modern_crypto-chap_2-3.4.pdf)  |
|   Jan 15  |  Introduction to Block Ciphers |  Bayes theorem, Basic probability, Boolean algebra  |  [pdf](./downloadables/lec_slides/ISC_lec3.pdf)  |  -  |
|   Jan 17  |  Hardware Design using Verilog |  Digital logic design, Verilog (see the resources on webpage and also [asic-world.com](https://asic-world.com/verilog/index.html))  | [pdf](./downloadables/lec_slides/ISC_lec4.pdf)  |  Prof. Debdeep Mukhopadhyay's lecture on Algorithm to Hardware <br>[video](https://www.youtube.com/watch?v=sACVot8QFWY&list=PLQBbcgo55TX-7vygatpMHOOtgflvYtkeZ&index=3)  |
|   Jan 22  |  Some Essential Concepts in Hardware Design  |  -  |  [pdf](./downloadables/lec_slides/ISC_lec5.pdf)  |  -  |
|   Jan 24  |  Finite Field and Hardware |  [pdf](./downloadables/lec_slides/ISC_lec6_prereq.pdf)  |  [pdf](./downloadables/lec_slides/ISC_lec6.pdf) | hard copy (due to some copyright issues) of a book will be provided in next class   |
|   Jan 29  |  The Anatomy of AES |  -  |  [pdf](./downloadables/lec_slides/ISC_lec7.pdf) |  -  |
|   Jan 31  |  Field Isomorphism  |  -  |  [pdf](./downloadables/lec_slides/ISC_lec8.pdf) |  -  |
|   Feb 5, 7  |  Composite Field Mapping  |  -  |  [pdf](./downloadables/lec_slides/ISC_lec9_10.pdf) |  -  |
| Feb 12, 19, 21 | Entering the world of attacks | - | [pdf](./downloadables/lec_slides/ISC_lec11_13.pdf) | - |
| Mar 05, 07 | Entering the world of attacks (from page 72) | - | [pdf](./downloadables/lec_slides/ISC_lec11_15.pdf) | - |
| Mar 12, 19 | Entering the world of attacks (from page 117) | - | [pdf](./downloadables/lec_slides/ISC_lec11_17.pdf) | - |
| Mar 21, 26 | Side channel attack countermeasures | - | [pdf](./downloadables/lec_slides/ISC_lec18_19.pdf) | - |
| Mar 28 | Fault Attacks | - | [pdf](./downloadables/lec_slides/ISC_lec20.pdf) | - |
| Apr 2 | Fault Attacks (from page 35) | - | [pdf](./downloadables/lec_slides/ISC_lec21.pdf) | - |
| Apr 4 | Fault Attacks (from page 64) | - | [pdf](./downloadables/lec_slides/ISC_lec22.pdf) | - |

<!--

|   Date    | Lecture Topic | Quiz |  Lecture Slides  |
| :-------------: | :--------------------------------------------: | :-------------: | :-------------: |
|   Jan 05  |   Course Prelude, Introduction |  -  |  [Intro](./resources/Slides/2024_01_05_ES01_intro.pdf)  |
|   Jan 09  |   NRE Cost and Software Engineering Issues |  -  | [Diversity & Cost](./resources/Slides/2024_01_09_ES02_intro_diversity_&_costs.pdf)  |
|   Jan 12  |   Embedded Systems Applications (Digital Camera) |  -  | [Applications of ES](./resources/Slides/2024_01_12_cs684_ES03_appn.pdf)  |
|   Jan 16  |   Embedded Systems Applications (Digital Camera) |  -  | [FSM](./resources/Slides/2024_01_16_ES04_model1.pdf)  |
|   Jan 19  |   Model Based Design (Intro + FSM) | - | [Statecharts](./resources/Slides/2024_01_19_ES05_model2.pdf) |
|   Jan 23  |   Reactive Kernel |  -  |  [Cyber Physical Systems](./resources/Slides/2024_Lect1Ann.pdf)  |
|   Jan 30  |   Model-Based Design (LUSTRE) |  -  | [Synchronous Dataflow Programming](./resources/Slides/2024_Lect2and3Ann1.pdf) |
|   Feb 02  |   Model-Based Design (LUSTRE) |  -  | [Array, Map, Fold](./resources/Slides/2024_Lect4aAnnotated.pdf) |
|   Feb 06  |   Model-Based Design (LUSTRE) |  -  | [Uni-Mode & Multi-Mode Controllers](./resources/Slides/2024_Lect4bAnnotated.pdf) |
|   Feb 09  |   Model-Based Design (LUSTRE) |  Quiz 2  | No Slides |
|   Feb 13  |   Model-Based Design (LUSTRE) |  -  | [Multi-Mode Controllers](./resources/Slides/2024_Lect5b.pdf) |
|   Feb 16  |   Model-Based Design (LUSTRE)  |  -  | [Finite-State Automata](./resources/Slides/2024_Lect6.pdf) |
|   Feb 20  |   Model-Based Design (LUSTRE) |  -  | No Slides |
|   Feb 23 - March2nd  |   midsem |  -  | - |
|   March 05 - 12 |  White Line Following - PID Control   |  -  | - |
|   March 15  |   Scheduling Theory  |  -  | [Schedulig Theory](./resources/Slides/2024_schedulabilityAnn12.pdf) |
|   March 19  |   Scheduling Theory  |  -  | [Schedulig Theory](./resources/Slides/2024_schedulabilityAnn2.pdf) |
|   March 22  |   Scheduling Theory |  -  |        |
|   March 26  |   Scheduling Theory |  Quiz 3  |    |
|   April 02 - 5  |   Project Presentations (mid) |  -  |   |
|   April 12  |   Project Doubt clearing |  -  |        |
|   April 16 - 19 |   Project Presentations (end) |  -  |   |
|   April 22 - May 2  |   Endsem   |  -  |  |

-->

<br>

---------
<!-- <!-- -->

<!-- <h2>Assignment Schedule:[Tentative]</h2>

|   Sr. No    | Assignment | Release Date |  End Date  |
| :-------------: | :---------------------------: | :---------------------------: |  :---------------------------: |
|   1    |   Part1: S-box implementation        | Thursday, January 12, 2023 |  Thursday January 19, 2023  |
|   1    |   Part2: Present block cipher design        |  Thursday, February 02, 2023 | Thursday, February 09, 2023 |
|   2    |   Side-channel attack     |  Thursday, February 09, 2023 |  Thursday, February 16, 2023 |
|   3    |   Fault attack       |  Thursday, March 16, 2023 |  Thursday, March 30, 2023  | -->

<!-- -->
