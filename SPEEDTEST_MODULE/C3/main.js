const scope = document.querySelector('.scope')
const topEl = document.querySelector('.top')
const bottomEl = document.querySelector('.bottom')
const leftEl = document.querySelector('.left')
const rightEl = document.querySelector('.right')
document.addEventListener('mousemove', (e) => {
    topEl.style.height = e.clientY - 200 + 'px'
    bottomEl.style.height = innerHeight - e.clientY - 200 + 'px'
    leftEl.style.width = e.clientX - 200 + 'px'
    rightEl.style.width = innerWidth - e.clientX - 200 + 'px'
})