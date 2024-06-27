// RBAC : Role Based Access Control

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RBAC is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant USER_ROLE = keccak256("USER_ROLE");

    constructor() {
        // 컨트랙트 배포자에게 ADMIN 역할 부여
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(ADMIN_ROLE, msg.sender);
    }

    function addUser(address account) public onlyRole(ADMIN_ROLE) {
    	// AccessControl 컨트랙트의 역할을 부여하는 함수입니다. (grantRole)
        grantRole(USER_ROLE, account);
    }

    function adminFunction() public onlyRole(ADMIN_ROLE) {
        Admin 역할을 가진 사람만 할 수 있는 기능입니다.
    }

    function userFunction() public onlyRole(USER_ROLE) {
        User 역할을 가진 사람만 할 수 있는 기능입니다.
    }
}