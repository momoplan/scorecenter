// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.scorecenter.domain;

import java.lang.String;
import java.math.BigDecimal;
import java.util.Date;

privileged aspect TuserinfoScore_Roo_JavaBean {
    
    public String TuserinfoScore.getUserno() {
        return this.userno;
    }
    
    public void TuserinfoScore.setUserno(String userno) {
        this.userno = userno;
    }
    
    public BigDecimal TuserinfoScore.getScore() {
        return this.score;
    }
    
    public void TuserinfoScore.setScore(BigDecimal score) {
        this.score = score;
    }
    
    public Date TuserinfoScore.getCreateTime() {
        return this.createTime;
    }
    
    public void TuserinfoScore.setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
    public Date TuserinfoScore.getLastModifyTime() {
        return this.lastModifyTime;
    }
    
    public void TuserinfoScore.setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }
    
}
