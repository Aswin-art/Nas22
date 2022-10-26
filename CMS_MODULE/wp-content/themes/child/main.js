const genre = document.getElementById('menu-item-61')
const submenu_genre = genre.querySelector('.sub-menu')
genre.addEventListener('click', () => {
    submenu_genre.classList.toggle('show')
})

const season = document.getElementById('menu-item-62')
const submenu_season = season.querySelector('.sub-menu')
season.addEventListener('click', () => {
    submenu_season.classList.toggle('show')
})