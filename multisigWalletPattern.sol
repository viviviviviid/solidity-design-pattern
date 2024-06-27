contract MultiSigWallet {

    function setOwner(){
        다중서명지갑의 일원으로 등록합니다.
    }

    function getSign(){
        지갑의 오너 중 한명일때 서명을 받아올 수 있습니다.
    }

    function countSign(){
        서명의 개수를 확인합니다.
    }

    function excute(){
        require(countSign() > 과반수, "서명의 개수가 부족합니다.");

        서명의 개수가 과반수가 넘는다면, 트랜잭션을 제출합니다.
    }
    
}
