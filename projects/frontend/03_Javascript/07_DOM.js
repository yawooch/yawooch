window.onload = () => {
    //1) 텍스트 노드가 있는 요소 노드 생성
    let btn1 = document.getElementById('btn1');

    btn1.addEventListener('click', () => {
        //요소 노드 생성
        let title = document.createElement('h3');
        console.log(title);
        
        //텍스트 노드 생성
        let textNode = document.createTextNode('안녕하세요');
        console.log(title);
        
        title.appendChild(textNode);
        console.log(title);
        console.log('textNode.textContent : ' + textNode.textContent);
        console.log('title.innerHTML : ' + title.innerHTML);
        console.log(title);

        let div1 = document.getElementById('div1');
        div1.innerHTML = title;
        div1.appendChild(title);
        div1.appendChild(title);
        console.log(title);
        
    });
    let btn2 = document.getElementById('btn2');

    //2) 텍스트 노드가 없는 요소 노드 생성
    btn2.addEventListener('click', () => {
        let img = document.createElement('img');
        let div2 = document.getElementById('div2');

        //C:/workspace/11_Dart/profileImage.jfif
        img.setAttribute('src', '../resources/image/profileImage.jfif');
        // img.setAttribute('src', 'C:/workspace/11_Dart/profileImage.jfif');
        img.style.width = '200px';

        div2.appendChild(img);
        // div2.innerHTML = '<img src="C:/workspace/11_Dart/profileImage.jfif" style="width: 200px;">';

        console.log(img);
    });

    //2. 노드삭제
    let btn3 = document.getElementById('btn3');

    btn3.addEventListener('click', () => {
        let div3 = document.getElementById('div3');
        // document.body.removeChild(document.getElementById('div2'));
        if(div3 === null)
        {
            div3 = document.createElement('div');
            div3.setAttribute('id', 'div3');
            div3.setAttribute('class', 'area');
            document.getElementById('parentNodeDel').appendChild(div3);
        }
        else{
            div3.remove();
        }

        console.log(div3);
    });
}