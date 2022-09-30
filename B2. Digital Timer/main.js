const start = document.querySelector('.start')
const stop = document.querySelector('.stop')
const reset = document.querySelector('.reset')

const ratusan1 = document.querySelector('.ratusan-1')
const ratusan2 = document.querySelector('.ratusan-2')
const ratusan3 = document.querySelector('.ratusan-3')
const puluhan1 = document.querySelector('.puluhan-1')
const puluhan2 = document.querySelector('.puluhan-2')

let time = 0
let times = 0
let arrays = []

start.addEventListener('click', () => {
    startCount = setInterval(() => {
        time++
        // if(time < 10){
        //     puluhan2.innerHTML = time
        // }else{
        //     puluhan2.style.display = 'none'
        //     puluhan1.innerHTML = time;
        // }

        // if(time >= 60){
        //     ratusan3.innerHTML = Math.round(time / 60)
        // }
        if(Math.round(time / 60) > 0){
            let ratusan = Math.round(time / 60)
            ratusan3.innerHTML = ratusan
            time = 0
        }

        let ratusan = ratusan3.innerHTML / 10
        let numberRatusan = ratusan.toString().split('.')
        ratusan2.innerHTML = numberRatusan[0] ? numberRatusan[0] : '0'
        ratusan3.innerHTML = numberRatusan[2] ? numberRatusan[2] : '0'

        number = time / 10
        times = number.toString()
        arrays = times.split('.')
        console.log(arrays)
        puluhan1.innerHTML = arrays[0]
        puluhan2.innerHTML = (arrays[1]) ? arrays[1] : '0'
        
    }, 1000)
})

stop.addEventListener('click', () => {
    clearInterval(startCount)
})

reset.addEventListener('click', () => {
    ratusan1.innerHTML = 0
    ratusan2.innerHTML = 0
    ratusan3.innerHTML = 0
    
    puluhan1.innerHTML = 0
    puluhan2.innerHTML = 0
    clearInterval(startCount)
    time = 0
})