const slider = document.querySelector('.slider')
const img = document.querySelector('image')
slider.addEventListener('input', () => {
    let value = slider.value
    img.style.filter = grayscale('100%') 
})