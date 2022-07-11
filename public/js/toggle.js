var body = document.body
var switcher = document.getElementsByClassName('js-toggle')[0]

switcher.addEventListener("click", function() {
  this.classList.toggle('js-toggle--checked')
  this.classList.add('js-toggle--focus')
  if (this.classList.contains('js-toggle--checked')) {
    body.classList.add('dark-mode')
    localStorage.setItem('darkMode', 'true')
  } else {
    body.classList.remove('dark-mode')
    setTimeout(function() {
      localStorage.removeItem('darkMode')
    }, 100)
  }
})

if (localStorage.getItem('darkMode')) {
  switcher.classList.add('js-toggle--checked')
  body.classList.add('dark-mode')
}
