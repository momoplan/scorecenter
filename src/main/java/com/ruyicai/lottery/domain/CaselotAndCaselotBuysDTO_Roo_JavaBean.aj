// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.lottery.domain;

import com.ruyicai.lottery.domain.CaseLot;
import com.ruyicai.lottery.domain.CaseLotBuyAndUserDTO;
import java.util.List;

privileged aspect CaselotAndCaselotBuysDTO_Roo_JavaBean {
    
    public List<CaseLotBuyAndUserDTO> CaselotAndCaselotBuysDTO.getCaseLotBuyAndUser() {
        return this.caseLotBuyAndUser;
    }
    
    public void CaselotAndCaselotBuysDTO.setCaseLotBuyAndUser(List<CaseLotBuyAndUserDTO> caseLotBuyAndUser) {
        this.caseLotBuyAndUser = caseLotBuyAndUser;
    }
    
    public CaseLot CaselotAndCaselotBuysDTO.getCaseLot() {
        return this.caseLot;
    }
    
    public void CaselotAndCaselotBuysDTO.setCaseLot(CaseLot caseLot) {
        this.caseLot = caseLot;
    }
    
}
