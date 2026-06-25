// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "../contracts/StudentGrades.sol";
import "../contracts/StoreInventory.sol";

contract BasicConstructionsTest {
    StudentGrades grades;
    StoreInventory store;

    function beforeAll() public {
        grades = new StudentGrades();
        store  = new StoreInventory();
    }

    function testDeploy() public {
        Assert.ok(address(grades) != address(0), "StudentGrades should be deployed");
        Assert.ok(address(store)  != address(0), "StoreInventory should be deployed");
    }
}
