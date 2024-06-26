// 싱글톤 인스턴스가 배포되었는지 확인하는 flag 또는 bool 변수를 이용하는 것

contract Singleton {
    bool private deployed;

    constructor() private {
        require(!deployed, "싱글톤 인스턴스가 이미 배포되었습니다.");
        deployed = true;
	// logic
    }
}

// Factory 패턴을 이용하는 것

contract Singleton {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function do() public view returns (string memory) {
        require(msg.sender == owner, "owner만 이 함수를 이용할 수 있습니다.");
        return "You can do it.";
    }
}

import "./Singleton.sol";

contract SingletonFactory {
    Singleton private singletonInstance;

    function createSingleton() public returns (address) {
        require(address(singletonInstance) == address(0), "싱글톤 인스턴스가 이미 존재합니다.");
        singletonInstance = new Singleton();
        return address(singletonInstance);
    }

    function getSingletonInstance() public view returns (address) {
        return address(singletonInstance);
    }
}

