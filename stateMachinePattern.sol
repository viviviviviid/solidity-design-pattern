ontract Delivery {
    enum State { 주문됨, 인수됨, 배송중, 배송됨, 취소됨 }
    State public currentState;

    event StateChanged(State newState);

    constructor() {
        buyer = msg.sender;
        currentState = State.주문됨;
    }

    // 배송 상태 변경 함수
    function setState(State _newState) public {
		currentState = _newState;
        emit StateChanged(_newState);
    }

    // 배송 취소 함수
    function cancelDelivery() public {
        require(msg.sender == buyer, "구매자만이 취소할 수 있습니다.");
        require(currentState == State.주문됨 || currentState == State.인수됨, "배송전인 상태에서만 취소가 가능합니다.");

        currentState = State.취소됨;
        emit StateChanged(State.취소됨);
    }
}