pragma solidity ^0.8.0;

contract dotcoin_ico {
    // Introducing the amount of `dotcoins` available for sale
    uint public max_dotcoins = 1000000;

    // Introducing the USD to `dotcoins` conversion rate
    uint public usd_to_dotcoins = 1000;

    // Introducing the amount of `dotcoins` that have been bought by investors
    uint public total_dotcoins_bought = 0;

    // Mapping from the investor address to its equity in `dotcoins` and USD
    mapping(address => uint) equity_dotcoins;
    mapping(address => uint) equity_usd;

    // Checking if an investor can buy `dotcoins`
    modifier can_buy_dotcoins(uint usd_invested) {
        require (usd_invested * usd_to_dotcoins + total_dotcoins_bought <= max_dotcoins);
        _;
    }

    // Getting the equity in `dotcoins` of an investor
    function equity_in_dotcoins(address investor) external constant returns (uint) {
        return equity_dotcoins[investor];
    }

    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }

    // Buying `dotcoins`
    function buy_dotcoins(address investor, uint usd_invested) external
    can_buy_dotcoins(usd_invested) {
        uint dotcoins_bought = usd_invested * usd_to_dotcoins;
        equity_dotcoins[investor] += dotcoins_bought;
        equity_usd[investor] = equity_dotcoins[investor] / usd_to_dotcoins;
        total_dotcoins_bought += dotcoins_bought;
    }

    // Selling `dotcoins`
    function sell_dotcoins(address investor, uint dotcoins_sold) external {
        equity_dotcoins[investor] -= dotcoins_sold;
        equity_usd[investor] = equity_dotcoins[investor] / usd_to_dotcoins;
        total_dotcoins_bought -= dotcoins_sold;
    }
}
