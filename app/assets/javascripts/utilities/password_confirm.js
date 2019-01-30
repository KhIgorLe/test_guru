document.addEventListener('turbolinks:load', function () {
  var password = document.getElementById('user_password');
  var password_confirmation = document.getElementById('user_password_confirmation');

  if (password && password_confirmation) {
    password.addEventListener('input', checkPassword);
    password_confirmation.addEventListener('input', checkConfirmation)
  }
});

function checkPassword() {
  if (!this.value) {
    hideIcon()
  }
}

function checkConfirmation() {
  var password = document.getElementById('user_password');

  if (password.value) {
    (password.value == this.value) ? successIcon() : dangerIcon()
  }

  if (!this.value) {
    hideIcon()
  }
}

function hideIcon() {
  document.querySelector('.octicon-key').classList.remove('text-success');
  document.querySelector('.octicon-key').classList.remove('text-danger');
  document.querySelector('.octicon-key').classList.add('hide')
}

function successIcon() {
  document.querySelector('.octicon-key').classList.remove('text-danger');
  document.querySelector('.octicon-key').classList.remove('hide');
  document.querySelector('.octicon-key').classList.add('text-success')
}

function dangerIcon() {
  document.querySelector('.octicon-key').classList.remove('hide');
  document.querySelector('.octicon-key').classList.remove('text-success');
  document.querySelector('.octicon-key').classList.add('text-danger')
}
