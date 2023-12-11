"use strict";

const appForm = document.getElementById('app-form');
const resTXT = document.getElementById('app-res-txt');

const convertirArabigos = (num = 1,char1 = '',char2 = '',char3 = '',char4 = '') => {
	let res = '';
	if (num > 0) {
		for (let i = 1; i <= num; i++) {
			if (i <= 3) res+= char1;
            if (i > 3 & i < 9) {
                if (i == 4) {
                    res = char2;
                    continue;
                }
                if (i == 5) {
                    res = char3;
                    continue;
                }
                res += char1;
            }
			if (i == 9) res = char4
        }
    }
    if (res.includes('^')) {
        let elevatedSpan = '<span class="elevated">';
        for (let i = 0; i < res.length; i++) {
            if (res.charAt(i).includes('^')) elevatedSpan += res.charAt(i-1);
        }
        elevatedSpan += "</span>";
        return res = elevatedSpan;
    }
    return res;
}

const chars = [
    ['I', 'IV', 'V', 'IX'],
    ['X', 'XL', 'L', 'XC'], 
    ['C','CD','D','CM'],
    ['M','IV^','V^','IX^'],
    [
        'X^',
        `<span class='elevated'>XL</span>`,
        `<span class='elevated'>L</span>`,
        `<span class='elevated'>XC</span>`
    ],
    [
        `C^`,
        `<span class='elevated'>CD</span>`,
        `<span class='elevated'>D</span>`,
        `<span class='elevated'>CM</span>`
    ]
]

const concatenarResultados = (numChars = '1') => {
    let listaNums = []; let listaChars = [];

    for (let i = numChars.length - 1; i >= 0; i--) {
        listaNums.unshift(numChars.charAt(i));
        listaChars.push([...chars[i]]);
    }
	let res = '';
    for (let i = 0; i < listaNums.length; i++) {
        let currentNum = convertirArabigos(listaNums[i],
            listaChars[i][0],listaChars[i][1],
            listaChars[i][2],listaChars[i][3]
        );
        res+=currentNum;
    };
    return res;
}

window.onsubmit = e => {
    e.preventDefault();
    const obj = e.target;
    if (obj == appForm) {
        let numChars = obj[0].value;
        let numInt = obj[0].valueAsNumber;

        if (numChars == '' || numChars == null || isNaN(numInt)) return;
        if (numInt < 0) return alert('No se aceptan números negativos.');
        if (numInt == 0) return alert('EL NÚMERO CERO NO EXISTE.');

        let res = '';
        if (numChars.length < 8) {
            if (numChars.length == 7) {
                resTXT.innerHTML = `<span class='million'></span>`
                for (let i = 0; i < numChars.charAt(0); i++) {
                    resTXT.querySelector('.million').innerHTML += 'M'
                }
                let newNumChars = numChars.slice(1);
                res = concatenarResultados(newNumChars);
                return resTXT.innerHTML += res;
            }
            res = concatenarResultados(numChars);
            return resTXT.innerHTML = res;
        }
        
        return alert('Por motivos de flojera, el autor de este algoritmo no lo programó para retornar valores mayores a 9.999.999 millones.');
    }
}