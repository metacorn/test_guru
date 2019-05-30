document.addEventListener('turbolinks:load', function() {
  var passwordField = document.querySelector('#user_password')
  var confirmationField = document.querySelector('#user_password_confirmation') 

  if (passwordField && confirmationField) {
    passwordField.addEventListener('input', passwordMatchingNotification)
    confirmationField.addEventListener('input', passwordMatchingNotification)
  }
})

function passwordMatchingNotification() {
  password = document.querySelector('#user_password').value
  confirmation = document.querySelector('#user_password_confirmation').value

  if (confirmation == "") {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  } else if (password != confirmation) {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  } else {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }
}