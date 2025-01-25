// script/BurnToken.s.sol
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/BridgeToken.sol";

contract BurnToken is Script {
    function run() external {
        address tokenAddress = 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0;
        
        uint256 amount = 10 * 10 ** 18;

        Token token = Token(tokenAddress);

        vm.startBroadcast();

        token.burn(amount);

        vm.stopBroadcast();
    }
}