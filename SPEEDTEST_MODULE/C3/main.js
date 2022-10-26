const scope = document.querySelector('.scope')
document.addEventListener('mousemove', (e) => {
    scope.style.left = e.pageX + 'px'
    scope.style.top = e.pageY + 'px'
})