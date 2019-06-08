document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('#timer')

  if (timer) {
    remaining_time = parseInt(timer.getAttribute("data"), 10)
    console.log(remaining_time)
    setInterval(updateTimer, 1000)
  }
})

function updateTimer() {  
  minutes = Math.floor(remaining_time / 60)
  seconds = remaining_time - minutes * 60
  timer.textContent = minutes + " min " + seconds + " sec left!"
  remaining_time--
  if (remaining_time < 0) {
    clearInterval()
    timer.textContent = "Time is over! Redirecting to result page..."
    var nextButton = document.querySelector('#next_button')
    nextButton.disabled = true
    setTimeout(function() {
      nextButton.disabled = false
      nextButton.click()
    }, 2000)
  }
}