//문제 1.
function changeColor(){
    let inputColor = document.getElementById('color').value;
    document.getElementById('colorDiv').style.backgroundColor = inputColor;
}
//문제 2.
function setSize(size){
    let imgSize = document.getElementById('imgSize');
    imgSize.style.width  = size;
    imgSize.style.height = size;
}
//문제3.
function textOutput(){
    let buyer    = document.getElementsByTagName('input')[1].value; 
    let product  = document.getElementById('product').value; 
    let price    = document.getElementsByName('price')[0].value;
    let output   = document.querySelector('form>span'); 
    output.get
    
    let text = '';

    //${buyer}님의 구매상품은 ${}, 구매 가격은 ${}원 입니다.
    if(buyer != '' && product != '' && price != '')
    {
        text = `${buyer}님의 구매상품은 ${product}, 구매 가격은 ${price}원 입니다.`;
    }
    output.innerHTML = text;
}