// script/MintToken.s.sol
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/BridgeToken.sol";

contract MintToken is Script {
    function run() external {
        address tokenAddress = 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0;
        
        address toAddress = 0x2981c6771a57aF3A9522e38223784b6D125C89C0;
        
        uint256 amount = 10 * 10 ** 18;

        Token token = Token(tokenAddress);

        vm.startBroadcast();

        token.mint(toAddress, amount);

        vm.stopBroadcast();
    }
}