pragma solidity ^0.6.12;

contract KYC {
    struct Customer{
        string AadharNo;
        string VoterId;
        string DrivingLicense;
        string PassportId;
        string PanCard;
        string Address;
        string Photocopy;
        string signature;
    }
     address admin;
    
    constructor() public{
        admin = msg.sender;
        }
    
     mapping(string => Customer) kycdetails;
    
     modifier ifadmin(){
        require(admin == msg.sender);
        _;
        }
        
        function EnterKyc(string memory _AadharNo,string memory _PassportId,
        string memory _VoterId,string memory _Address,string memory _Photocopy,string memory _Signature) public ifadmin{
            kycdetails[_AadharNo].AadharNo = _AadharNo;
            kycdetails[_AadharNo].PassportId = _PassportId;
            kycdetails[_AadharNo].VoterId = _VoterId;
            kycdetails[_AadharNo].Address = _Address;
            kycdetails[_AadharNo].Photocopy = _Photocopy;
            kycdetails[_AadharNo].signature = _Signature;
            
        }
        
        function ModifyKyc(string memory _AadharNo,string memory _newAddress,string memory _newPhotocopy) public ifadmin{
            kycdetails[_AadharNo].Address = _newAddress;
            kycdetails[_AadharNo].Photocopy = _newPhotocopy;
        }
         function GetKycDetails(string memory _AadharNo) public view returns(string memory,string memory,string memory,string memory){
            return (
                  kycdetails[_AadharNo].AadharNo,
                  kycdetails[_AadharNo].VoterId,
                  kycdetails[_AadharNo].Address,
                  kycdetails[_AadharNo].Photocopy
                       
                );
        }
}
