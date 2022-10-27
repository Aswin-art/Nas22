/**@type {HTMLCanvasElement} */

const canvas = document.getElementById('game')
const ctx = canvas.getContext('2d')

const menuScreen = document.querySelector('.menuScreen')
const firstMenu = document.querySelector('.menu .first')
const secondMenu = document.querySelector('.menu .second')
const btnLevel = document.querySelector('.btnLevel')
const btnPlay = document.querySelector('.btn-play')
const inputLevel = document.querySelector('.inputLevel')
const pickEnemy = document.querySelector('.inputEnemy')
const inputNamePlayer = document.querySelector('.inputNamePlayer')
const inputPlayer2 = document.querySelector('.player2')

canvas.width = 500
canvas.height = 400

class Game{
    constructor(){

    }

    setup(){

    }

    draw(){

    }

    update(){

    }
}

const game = new Game()

let pause = true

function animate(){
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    game.draw()
    game.update()

    if(!pause){
        requestAnimationFrame(animate)
    }
}

function play(){
    localStorage.setItem('player1', inputNamePlayer.value)
    if(localStorage.getItem('level') && (localStorage.getItem('player1') && localStorage.getItem('player1') != undefined)){
        menuScreen.style.display = 'none'
        pause = false
        animate()
    }
}

inputLevel.addEventListener('input', () => {
    console.log(inputLevel.value)
    if(inputLevel.value){
        btnLevel.style.pointerEvents = 'visible'
        btnLevel.style.cursor = 'pointer'
        btnLevel.style.backgroundColor = 'salmon'
        btnLevel.addEventListener('click', () => {
            localStorage.setItem('level', inputLevel.value)
            firstMenu.style.display = 'none'
            secondMenu.style.display = 'block'
        })
    }else{
        btnLevel.style.pointerEvents = 'none'
        btnLevel.style.cursor = 'default'
        btnLevel.style.backgroundColor = 'rgba(215, 102, 90, .5)'
    }
})

pickEnemy.addEventListener('input', () => {
    if(pickEnemy.value == 'player'){
        inputPlayer2.style.display = 'block'
    }else{
        inputPlayer2.style.display = 'none'
    }
})

inputNamePlayer.addEventListener('input', () => {
    if(inputNamePlayer.value){
        btnPlay.style.pointerEvents = 'visible'
        btnPlay.style.cursor = 'pointer'
        btnPlay.style.backgroundColor = 'salmon'
    }else{
        btnPlay.style.pointerEvents = 'none'
        btnPlay.style.cursor = 'default'
        btnPlay.style.backgroundColor = 'rgba(215, 102, 90, .5)'
    }
})

btnPlay.addEventListener('click', play)