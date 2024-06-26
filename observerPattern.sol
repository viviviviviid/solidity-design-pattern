contract Subject {
    event StateChanged(uint256 newState);
    
    uint256 private state;
    address[] private observers;

    // 상태 변경 함수
    function setState(uint256 _newState) public {
        state = _newState;
        emit StateChanged(_newState); 
        notifyObservers();
    }

    function registerObserver(address _observer) public {
        observers.push(_observer);
    }

    function removeObserver(address _observer) public {
        for (uint i = 0; i < observers.length; i++) {
            if (observers[i] == _observer) {
                observers[i] = observers[observers.length - 1];
                observers.pop();
                break;
            }
        }
    }

    // 알림 함수
    function notifyObservers() private {
        for (uint i = 0; i < observers.length; i++) {
            (bool success, ) = observers[i].call(abi.encodeWithSignature("update(uint256)", state));
            require(success, "Observer update failed");
        }
    }
}

contract Observer {
    uint256 public observedState;

    // 상태 업데이트 함수
    function update(uint256 _newState) public {
        observedState = _newState;
    }
}