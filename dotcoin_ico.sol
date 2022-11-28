pragma solidity ^0.8.0;

contract dotcoin_ico {
    // Introducing the amount of `dotcoins` available for sale
    uint public max_dotcoins = 1000000;

    // Introducing the USD to `dotcoins` conversion rate
    uint public usd_to_dotcoins = 1000;

    // Introducing the amount of `dotcoins` that have been bought by investors
    uint public total_dotcoins_bought = 0;
}
