// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.scorecenter.domain;

import java.lang.String;

privileged aspect TuserinfoScore_Roo_ToString {
    
    public String TuserinfoScore.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CreateTime: ").append(getCreateTime()).append(", ");
        sb.append("LastModifyTime: ").append(getLastModifyTime()).append(", ");
        sb.append("Score: ").append(getScore()).append(", ");
        sb.append("Userno: ").append(getUserno());
        return sb.toString();
    }
    
}
