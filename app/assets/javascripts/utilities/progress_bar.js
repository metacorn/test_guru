document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('progress')

  if (progressBar) {
    var current = progressBar.dataset.current
    var total = progressBar.dataset.total

    var progressPercent = (current - 1) * 100 / total

    progressBar.value = progressPercent.toString(10)
  }
})