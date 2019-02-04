document.addEventListener('turbolinks:load', function() {
  var time = document.getElementById('timer')

  if (time) { downCount(time) }
})

function downCount(time) {

  var seconds = time.dataset.remainingSeconds

  var intervalId = setInterval(function() {
    seconds--

    if (seconds <= 0) {
      clearInterval(intervalId);
      alert('Время вышло')
      window.location.replace(window.location + '/result');
    }

    showRemainingTime(seconds, time)

  }, 1000)
}

function showRemainingTime(remaining_seconds, time) {
  minutes = parseInt(remaining_seconds / 60)
  seconds = remaining_seconds % 60
  time.innerHTML = minutes + ":" + seconds
}
