// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.scorecenter.domain;

import java.lang.String;

privileged aspect ScoreType_Roo_ToString {
    
    public String ScoreType.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Memo: ").append(getMemo()).append(", ");
        sb.append("ModifyTime: ").append(getModifyTime()).append(", ");
        sb.append("ScoreJson: ").append(getScoreJson()).append(", ");
        sb.append("ScoreType: ").append(getScoreType()).append(", ");
        sb.append("State: ").append(getState()).append(", ");
        sb.append("Times: ").append(getTimes());
        return sb.toString();
    }
    
}
