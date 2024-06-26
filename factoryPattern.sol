contract Token {
    string public name;
    address public owner;

    constructor(string memory _name, address _owner) {
        name = _name;
        owner = _owner;
    }
}

import "./Token.sol";

contract TokenFactory {
    address[] public tokens;

    event TokenCreated(address tokenAddress, string name, address owner);

    function createToken(string memory _name) public {
        SimpleToken newToken = new SimpleToken(_name, msg.sender);
        tokens.push(address(newToken));
        emit TokenCreated(address(newToken), _name, msg.sender);
    }

    function getTokens() public view returns (address[] memory) {
        return tokens;
    }
}