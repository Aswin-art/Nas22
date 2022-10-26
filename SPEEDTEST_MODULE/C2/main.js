const image = document.querySelector('.image')
const container = document.querySelector('.container')
const bounding = image.getBoundingClientRect()

function move(e){
    let x = e.pageX - bounding.left
    let y = e.pageY - bounding.top
    image.style.width = x + 'px' 
}

container.addEventListener('mousedown', () => {
    document.addEventListener('mousemove', (e) => {
        move(e)
    })
})

container.addEventListener('mouseup', () => {
    document.addEventListener('mousemove', (e) => {
        move(e)
    })
})