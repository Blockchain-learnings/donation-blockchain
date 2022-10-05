// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Donation {
    int256 public count = 0;
    mapping(int256 => address) campaigns; //campaign to owner mapping
    mapping(int256 => mapping(address => uint256)) campaignDonations; //campaign to donation maping
    mapping(int256 => uint256) campaignsTotalDonation;

    receive() external payable {}

    function startCampaign() external returns (int256) {
        count += 1;
        campaigns[count] = msg.sender;
        return count;
    }

    function donate(int256 _campaign) external payable {
        require(campaigns[_campaign] != address(0), "no campaign");
        campaignDonations[_campaign][msg.sender] = msg.value;
        campaignsTotalDonation[_campaign] += msg.value;
    }

    function withdraw(int256 _campaign) external returns (uint256) {
        require(campaigns[_campaign] == msg.sender, "not the owner");
        payable(msg.sender).call{value: campaignsTotalDonation[_campaign]};
        campaignsTotalDonation[_campaign] = 0;
        return campaignsTotalDonation[_campaign];
    }

    function donationSum(int256 _campaign) external view returns (uint256) {
        return campaignsTotalDonation[_campaign];
    }
}
