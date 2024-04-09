pragam solidity 0.8.17;

contract Hasher {
    
    uint256 p = XX;
    uint8 nRounds = 10;
    uint256[10] c = [];

    function MiMC5(uint256 x, uint256 k) public view returns(uint256 h) {
        uint256 lastOutput = x;
        uint256 base;
        uint256 base2;
        uint256 base4;


        for(uint8 i = 0; i <nRounds; i++) {
            base = addmod(lastOutput, k, p);
            base = addmod(base, c[i], p);

            base2 = mulmod(base, base, p);
            base4 = mulmod(base2, base2, p);
            
            lastOutput = mulmod(base4, base, p);
        }

        h = addmod(lastOutput, k, p);
    }
}