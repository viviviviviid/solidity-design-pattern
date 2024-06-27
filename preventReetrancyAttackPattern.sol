import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract ReentrancyGuardContract is ReentrancyGuard {
    mapping(address => uint256) private balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public nonReentrant {
        require(balances[msg.sender] >= amount, "돈이 부족합니다");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "전송 실패");
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}