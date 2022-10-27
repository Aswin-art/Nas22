/**@type {HTMLCanvasElement} */

const canvas = document.getElementById('game')
const ctx = canvas.getContext('2d')

const gameWrapper = document.querySelector('.game-wrapper')
const menuScreen = document.querySelector('.menuScreen')
const firstMenu = document.querySelector('.menu .first')
const secondMenu = document.querySelector('.menu .second')
const btnLevel = document.querySelector('.btnLevel')
const btnPlay = document.querySelector('.btn-play')
const inputLevel = document.querySelector('.inputLevel')
const pickEnemy = document.querySelector('.inputEnemy')
const inputNamePlayer = document.querySelector('.inputNamePlayer')
const inputPlayer2 = document.querySelector('.player2')
const player2Name = document.querySelector('.inputNameEnemy')

canvas.width = 900
canvas.height = 700

let turn = 1
let player1 = {
    totalTiles: [],
    color: 'red'
}
let player2 = {
    totalTiles: [],
    color: 'green'
}
let canvasPosition = canvas.getBoundingClientRect()
const mouse = {
    position: {
        x: 0,
        y: 0,
    },
    width: 0.1,
    height: 0.1
}

function collision(first, second){
    if(
        !(
            first.x > second.position.x + second.width ||
            first.x + first.radius < second.position.x ||
            first.y > second.position.y + second.height ||
            first.y + first.radius < second.position.y
        )
    ){
        return true
    }
}

function drawBoard(width, height){
    let boards = []

    const a = 2 * Math.PI / 6
    const r = 35

    for(let y = 0; y < 8; ++y){
        for(let x = 0; x < 10; ++x){
            if(y & 1){
                boards.push(new Board(x * 60 + r + 30, y * 70 + r, a, r))
            }else{
                boards.push(new Board(x * 60 + r, y * 70 + r, a, r))
            }
        }
    }

    return boards
}

class Board{
    constructor(x, y, a, radius){
        this.x = x
        this.y = y
        this.a = a
        this.radius = radius
    }

    draw(){
        ctx.beginPath()
        if(collision(this, mouse)){
            ctx.strokeStyle = 'red'
        }else{
            ctx.strokeStyle = 'gray'
        }

        ctx.strokeStyle = 'gray'
        ctx.fillStyle = 'white'
        ctx.fillText(6, this.x, this.y)
        for(let i = 0; i < 6; ++i){
            ctx.lineTo(this.x + this.radius * Math.sin(this.a * i), this.y + this.radius * Math.cos(this.a * i))
        }
        ctx.closePath()
        ctx.stroke()
    }

    update(){

    }
}

class EventHandler{
    constructor(){
        document.addEventListener('mousemove', (e) => {
            mouse.position.x = e.x - canvasPosition.x
            mouse.position.y = e.y - canvasPosition.y
        })

        document.addEventListener('mouseleave', (e) => {
            mouse.position.x = undefined
            mouse.position.y = undefined
        })

        document.addEventListener('click', (e) => {
            const position = {
                x: mouse.position.x - (mouse.position.x % cellSize),
                y: mouse.position.y - (mouse.position.y % cellSize)
            }

            for(let i = 0; i < game.defenders.length; ++i){
                if(game.defenders[i].position.x == position.x && game.defenders[i].position.y == position.y){
                    return
                }
            }

            if(game.resources >= defenderCost){
                game.defenders.push(drawDefender(position))
                game.resources -= defenderCost
            }
        })
    }
}

class Game{
    constructor(){
        this.setup()
    }

    setup(){
        this.hexagon = drawBoard(canvas.width, canvas.height)
    }

    draw(){
        [...this.hexagon].forEach(e => e.draw())
    }
    
    update(){
        [...this.hexagon].forEach(e => e.draw())
    }
}

const game = new Game()

let pause = false

function animate(){
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    game.draw()
    game.update()

    if(!pause){
        requestAnimationFrame(animate)
    }
}

animate()

// function play(){
//     localStorage.setItem('player1', inputNamePlayer.value)
//     let enemyType = localStorage.getItem('enemyType')
//     if(enemyType == 'bot'){
//         if(localStorage.getItem('level') && (localStorage.getItem('player1') && localStorage.getItem('player1') != undefined) && inputNamePlayer.value){
//             menuScreen.style.display = 'none'
//             gameWrapper.style.display = 'block'
//             pause = false
//             animate()
//         }
//     }else{
//         if(localStorage.getItem('level') && (localStorage.getItem('player1') && localStorage.getItem('player1') != undefined) && (inputNamePlayer.value && player2Name.value)){
//             menuScreen.style.display = 'none'
//             gameWrapper.style.display = 'block'
//             pause = false
//             animate()
//         }
//     }
// }

// inputLevel.addEventListener('input', () => {
//     if(inputLevel.value){
//         btnLevel.style.pointerEvents = 'visible'
//         btnLevel.style.cursor = 'pointer'
//         btnLevel.style.backgroundColor = 'salmon'
//         btnLevel.addEventListener('click', () => {
//             localStorage.setItem('level', inputLevel.value)
//             firstMenu.style.display = 'none'
//             secondMenu.style.display = 'block'
//             localStorage.setItem('enemyType', 'player')
//         })
//     }else{
//         btnLevel.style.pointerEvents = 'none'
//         btnLevel.style.cursor = 'default'
//         btnLevel.style.backgroundColor = 'rgba(215, 102, 90, .5)'
//     }
// })

// pickEnemy.addEventListener('input', () => {
//     localStorage.setItem('enemyType', pickEnemy.value)
//     if(pickEnemy.value == 'player'){
//         inputPlayer2.style.display = 'block'
//     }else{
//         inputPlayer2.style.display = 'none'
//     }
// })

// player2Name.addEventListener('input', () => {
//     if(player2Name.value && localStorage.getItem('enemyType') == 'player'){
//         btnPlay.style.pointerEvents = 'visible'
//         btnPlay.style.cursor = 'pointer'
//         btnPlay.style.backgroundColor = 'salmon'
//     }else{
//         btnPlay.style.pointerEvents = 'none'
//         btnPlay.style.cursor = 'default'
//         btnPlay.style.backgroundColor = 'rgba(215, 102, 90, .5)'
//     }
// })

// inputNamePlayer.addEventListener('input', () => {
//     if(inputNamePlayer.value && localStorage.getItem('enemyType') == 'bot'){
//         btnPlay.style.pointerEvents = 'visible'
//         btnPlay.style.cursor = 'pointer'
//         btnPlay.style.backgroundColor = 'salmon'
//         btnPlay.addEventListener('click', play)

//     }else{
//         btnPlay.style.pointerEvents = 'none'
//         btnPlay.style.cursor = 'default'
//         btnPlay.style.backgroundColor = 'rgba(215, 102, 90, .5)'
//     }
// })
