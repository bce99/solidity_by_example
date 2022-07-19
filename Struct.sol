// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Struct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory nissan = Car("Nissan", 2015, msg.sender);
        Car memory lambo = Car({year: 2020, model: "Lamborghini", owner: msg.sender});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2018;
        tesla.owner = msg.sender;

        cars.push(nissan);
        cars.push(lambo);
        cars.push(tesla);
        cars.push(Car("Ferrari", 1990, msg.sender));

        Car storage _car = cars[0];
        _car.model = "Nisssan";
        delete _car.owner;

        delete cars[1];
    }
}