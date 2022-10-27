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
// const player1El = document.querySelector('.player1-info')
// const player2El = document.querySelector('.player2-info')
// const player1ColorEl = player1El.querySelector('.color')
// const player2ColorEl = player2El.querySelector('.color')
// const player1ScoreEl = player1El.querySelector('.score')
// const player2ScoreEl = player2El.querySelector('.score')
// const player1NameEl = player1El.querySelector('.name')
// const player2NameEl = player2El.querySelector('.name')

canvas.width = 640
canvas.height = 555

let turn = 1
let player1 = {
    totalTiles: 0,
    color: 'red'
}
let player2 = {
    totalTiles: 0,
    color: 'blue'
}


let canvasPosition = canvas.getBoundingClientRect()
let hexes = null
let currentTiles = {
    color: 'red',
    number: Math.round(Math.random() * 19 + 1)
}
const mouse = {
    position: {
        x: 0,
        y: 0,
    },
    width: 0.1,
    height: 0.1
}

function collision(hexa, mouse){
    return (
        mouse.position.x > hexa.x - hexa.radius &&
        mouse.position.x < hexa.x + hexa.radius &&
        mouse.position.y > hexa.y - hexa.radius &&
        mouse.position.y < hexa.y + hexa.radius
    )
}

function drawBoard(){
    let boards = []

    const a = 2 * Math.PI / 6
    const r = 35

    for(let y = 0; y < 8; ++y){
        for(let x = 0; x < 10; ++x){

            if(y & 1){
                boards.push(new Board(x * 60 + r + 30, y * 55 + r, a, r))
            }else{
                boards.push(new Board(x * 60 + r, y * 55 + r, a, r))
            }
        }
    }
    return boards
}

function drawTile(position){
    return new Tile(position)
}

class Board{
    constructor(x, y, a, r){
        this.x = x
        this.y = y
        this.a = a
        this.radius = r
        this.color = 'gray'
        this.backgroundColor = 'transparent'
        this.number = ''
        this.disabled = false
    }

    draw(){
        ctx.beginPath()
        if(collision(this, mouse)){
            hexes = this
        }
        
        ctx.strokeStyle = this.color
        
        ctx.fillStyle = this.backgroundColor
        for(let i = 0; i < 6; ++i){
            ctx.lineTo(this.x + this.radius * Math.sin(this.a * i), this.y + this.radius * Math.cos(this.a * i))
        }
        ctx.fill()
        ctx.closePath()
        ctx.stroke()
        ctx.fillStyle = 'white'
        ctx.fillText(this.number, this.x - 5, this.y)
    }

    update(){
        
    }
}

class EventHandler{
    constructor(game){
        document.addEventListener('mousemove', (e) => {
            mouse.position.x = e.x - canvasPosition.x
            mouse.position.y = e.y - canvasPosition.y
        })

        document.addEventListener('mouseleave', (e) => {
            mouse.position.x = undefined
            mouse.position.y = undefined
        })

        document.addEventListener('click', (e) => {
            // const position = {
            //     x: mouse.position.x - (mouse.position.x % 35),
            //     y: mouse.position.y - (mouse.position.y % 35)
            // }

            if(hexes.disabled){
                return
            }else{
                hexes.number = currentTiles.number
                if(turn == 1){
                    currentTiles = {
                        color: 'red',
                        number: Math.round(Math.random() * 19 + 1)
                    }
                    hexes.color = currentTiles.color
                    hexes.backgroundColor = currentTiles.color
                    player1.totalTiles += hexes.number
                    turn = 2
                }else{
                    currentTiles = {
                        color: 'blue',
                        number: Math.round(Math.random() * 19 + 1)
                    }
                    hexes.color = currentTiles.color
                    hexes.backgroundColor = currentTiles.color
                    player2.totalTiles += hexes.number
                    turn = 1
                }
                hexes.disabled = true
            }

            // game.hexagons.forEach(e => {
            //     if(collision(e, mouse)){
            //         game.tiles.push(drawTile(position))
            //     }
            // })
            
        })
    }
}

class Tile{
    constructor(hexa, mouse, position){
        this.position = position
        this.a = 2 * Math.PI / 6
        this.radius = 35
        // this.hexa = hexa
        // this.mouse = mouse
    }

    draw(){
        // if(collision(this.hexa, this.mouse)){

        // }
        console.log('oke')
        ctx.beginPath()
        for(let i = 0; i < 6; ++i){
            ctx.lineTo(this.position.x + this.radius * Math.sin(this.a * i), this.position.y + this.radius * Math.cos(this.a * i))
        }
        ctx.closePath()
    }

    update(){

    }
}

class Current{
    constructor(x, y, r, a){
        this.color = 'white'
        this.backgroundColor = currentTiles.color
        this.number = currentTiles.number
        this.a = a
        this.x = x
        this.y = y
        this.radius = r
    }

    draw(){
        ctx.strokeStyle = this.color
        
        ctx.fillStyle = this.backgroundColor
        ctx.beginPath()
        for(let i = 0; i < 6; ++i){
            ctx.lineTo(this.x + this.radius * Math.sin(this.a * i), this.y + this.radius * Math.cos(this.a * i))
        }
        ctx.fill()
        ctx.closePath()
        ctx.stroke()
        ctx.fillStyle = 'white'
        ctx.fillText('Current: ', canvas.width / 2 - 60, canvas.height - 65)
        ctx.fillText(this.number, this.x - 5, this.y)
    }
}

class Game{
    constructor(){
        this.setup()
    }

    setup(){
        this.hexagons = drawBoard(canvas.width, canvas.height)
        this.tiles = []
        this.current = new Current(canvas.width / 2, canvas.height - 70, 15, 2 * Math.PI / 6)
        new EventHandler()
    }

    draw(){
        [...this.hexagons, ...this.tiles, this.current].forEach(e => e.draw())
    }
    
    update(){
        [...this.hexagons, ...this.tiles].forEach(e => e.draw())

        // if(turn == 1){
        //     currentTiles = {
        //         color: 'red',
        //         number: Math.round(Math.random() * 19 + 1)
        //     }
        // }else{
        //     currentTiles = {
        //         color: 'blue',
        //         number: Math.round(Math.random() * 19 + 1)
        //     }
        // }
    }
}

const game = new Game()

let pause = false

function animate(){
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    game.draw()
    game.update()
    // player1ColorEl.style.backgroundColor = 'red'
    // player2ColorEl.style.backgroundColor = 'blue'
    // player1ColorEl.style.width = '5px'
    // player2ColorEl.style.width = '5px'
    // player1ColorEl.style.height = '5px'
    // player2ColorEl.style.height = '5px'

    // player1ScoreEl.innerHTML = player1.totalTiles
    // player2ScoreEl.innerHTML = player2.totalTiles

    // player1NameEl.innerHTML = localStorage.getItem('player1')
    // player2NameEl.innerHTML = localStorage.getItem('player2')
    ctx.fillStyle = 'red'
    ctx.fillRect(canvas.width / 2 - 50, canvas.height - 40, 10, 10)
    ctx.fillStyle = 'white'
    ctx.fillText(localStorage.getItem('player1'), canvas.width / 2 - 50 + 20, canvas.height - 32)
    ctx.fillStyle = 'blue'
    ctx.fillRect(canvas.width / 2, canvas.height - 40, 10, 10)
    ctx.fillStyle = 'white'
    ctx.fillText(localStorage.getItem('player2'), canvas.width / 2 + 20, canvas.height - 32)

    ctx.fillText(player1.totalTiles, canvas.width / 2 - 50, canvas.height - 2.5)
    ctx.fillText(player2.totalTiles, canvas.width / 2, canvas.height - 2.5)
    if(!pause){
        requestAnimationFrame(animate)
    }
}

animate()

// function play(){
//     localStorage.setItem('player1', inputNamePlayer.value)
//     localStorage.setItem('player2', player2Name.value)
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
