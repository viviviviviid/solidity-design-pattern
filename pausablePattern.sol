contract PausableContract is Ownable {
    modifier whenNotPausedOnly() {
        require(!getPauseStatus(), "Contract is paused");
        _;
    }
    
    constructor() {
    	pauseStatus = false;
    }

    // owner만이 일시정지 상태로 만들 수 있습니다.
    function pause() public onlyOwner {
        _pause();
    }
    
    function getPauseStatus() public returns (bool) {
    	return pauseStatus;
    }

    function excuteSomething() public whenNotPausedOnly {
        특정 행동을 합니다.
    }
}