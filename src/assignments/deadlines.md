
<center>
    <h1>Assignments</h1>
</center>

---

<script>
function startCountdown (targetDate, elementId) {
    // Set the date we're counting down to
    let countDownDate = new Date(targetDate).getTime();

    // Update the count down every minute
    let x = setInterval(() => {

        // Get today's date and time
        let now = new Date().getTime();

        // Find the difference between now and the count down date
        let difference = countDownDate - now;

        // If the count down is over, write some text
        if (difference < 0) {
            clearInterval(x);
            document.getElementById(elementId).innerHTML = "-";
        } else {
            // Time calculations for days, hours, and minutes
            let days = Math.floor(difference / (1000 * 60 * 60 * 24));
            let hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
            let seconds = Math.floor((difference % (1000 * 60)) / (1000));

            // Output the result in the specified element
            document.getElementById(elementId).innerHTML = days + "d " + hours + "h " + minutes + "m";
            // document.getElementById(elementId).innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s";
        }

    }, 1000);
}

startCountdown('25 Jan, 2025 23:59:59', 'timer_a1_part1a');
startCountdown('01 Feb, 2025 23:59:59', 'timer_a1_part1b');
startCountdown('13 Mar, 2025 23:59:59', 'timer_a2');
startCountdown('10 Apr, 2025 23:59:59', 'timer_a3');

</script>

<br>

<table style="width:100%">

<tr style="background-color: let(--quote-bg);">
    <th align="center">#</th>
    <th align="center">Start Date</th>
    <th align="center">End Date</th>
    <th align="center">Duration</th>
    <th align="center">Time Remaining</th>
</tr>

<tr>
    <td align="center"> <p><a href="../assignments/assignment1.md#part-a-deadline-jan-25-2025-1159-pm">1 (Part A)</a></p> </td>
    <td align="center"> <p>18 Jan 2025</p> </td>
    <td align="center"> <p>25 Jan 2025</p> </td>
    <td align="center"> <p>6 Days</p> </td>
    <td align="center"> <p id="timer_a1_part1a"></p> </td>
</tr>

<tr>
    <td align="center"> <p><a href="../assignments/assignment1.md#part-b-deadline-feb-01-2025-1159-pm">1 (Part B)</a></p> </td>
    <td align="center"> <p>18 Jan 2025</p> </td>
    <td align="center"> <p>01 Feb 2025</p> </td>
    <td align="center"> <p>13 Days</p> </td>
    <td align="center"> <p id="timer_a1_part1b"></p> </td>
</tr>

<tr>
    <td align="center"> <p><a><a href="../assignments/assignment2.md#deadline-13th-march-2025-1700-hrs">2</a></p> </td>
    <td align="center"> <p>08 Mar 2025</p> </td>
    <td align="center"> <p>13 Mar 2025</p> </td>
    <td align="center"> <p>5 Days</p> </td>
    <td align="center"> <p id="timer_a2"></p> </td>
</tr>

<tr>
    <td align="center"> <p><a><a href="../assignments/assignment3.md#deadline-10th-april-2025-2359-hrs">3</a></p> </td>
    <td align="center"> <p>04 Apr 2025</p> </td>
    <td align="center"> <p>10 Apr 2025</p> </td>
    <td align="center"> <p>7 Days</p> </td>
    <td align="center"> <p id="timer_a3"></p> </td>
</tr>

</table>
