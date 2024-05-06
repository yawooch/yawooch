//card 클래스를 갖는 카드들의 요소를 수집한다.
const cards = document.querySelectorAll(".card");

let hasFlippedCard = false;
let lockBoard = false;
let firstCard, secondCard;

//card에 flip클래스를 줘서 뒤집는 역할
function flipCard() {
    if (lockBoard) return;

    if (this === firstCard) return;//이미 뒤집어진 카드(첫번째)를 다시 선택하는 경우를 막는다.
    
    this.classList.add("flip");// card 요소에 flip 클래스를 추가한다.
    //뒤집어진 카드일때
    if (!hasFlippedCard) {
        hasFlippedCard = true;
        firstCard = this;
        return;
    }

    //뒤집어진 카드가 아닐때
    hasFlippedCard = false;
    secondCard = this;
    checkForMatch();
}

//뒤집어진 두 카드가 서로 같은 카드인지 확인한다.
function checkForMatch() {
    let isMatch = firstCard.dataset.name === secondCard.dataset.name;

    isMatch ? disableCards() : unflipCards();
}

//각 .card 에 적용된 flipCard 메서드를 제거한다.(짝이 맞은 두 카드는 뒤집지 못한다.)
function disableCards() {
    firstCard.removeEventListener("click", flipCard);
    secondCard.removeEventListener("click", flipCard);

    resetBoard();
}
//일정시간 후에 뒤집어진 두카드를 다시 돌려놓는다.
function unflipCards() {
    lockBoard = true;//일정시간동안 제 3의 카드가 뒤집어지지 않도록 처리
    setTimeout(() => {
        firstCard.classList.remove("flip");
        secondCard.classList.remove("flip");
        lockBoard = false;
    }, 500);
}
//보드 설정을 다시 초기화 해준다.
function resetBoard() {
//    hasFlippedCard = false;
//    lockBoard = false;
//    firstCard = null;
//    secondCard = null;
    [hasFlippedCard, lockBoard, firstCard, secondCard] = [false, false,null, null];
}
//입력된 배열의 수만큰 서로 순서를 바꾸는 함수
function shuffleArray(arr) {
    arr.forEach((_, idx) => {
        const randomIdx = Math.floor(Math.random() * arr.length);//0~3까지의 숫자 랜덤
        [arr[randomIdx], arr[idx]] = [arr[idx], arr[randomIdx]];//randomIdx 와 idx 번째를 서로 바꾼다. (자신끼리 바꿀수도 있음)
    });
}

const orderList = [0, 1, 2, 3];

//맨 처음에 카드를 섞어주는 shuffle() 함수가 초기에 한번만 실행된다.
(function shuffle() {
    shuffleArray(orderList);
    cards.forEach((card, idx) => {
        card.style.order = orderList[idx];//값이 섞여진 OrderList순서대로 card에 있는 order를 설정한다.
    });
})();

//클릭 Event에 flipCard를 추가해줘서 실행되도록한다.
cards.forEach((card) => card.addEventListener("click", flipCard));

/*
flipCard 실행 -> checkForMatch();  실행 -> 일치   disableCards() -> resetBoard();  실행
                                           불일치 unflipCards();
*/