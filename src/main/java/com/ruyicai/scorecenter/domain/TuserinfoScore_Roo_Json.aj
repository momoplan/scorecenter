// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.scorecenter.domain;

import com.ruyicai.scorecenter.domain.TuserinfoScore;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect TuserinfoScore_Roo_Json {
    
    public String TuserinfoScore.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static TuserinfoScore TuserinfoScore.fromJsonToTuserinfoScore(String json) {
        return new JSONDeserializer<TuserinfoScore>().use(null, TuserinfoScore.class).deserialize(json);
    }
    
    public static String TuserinfoScore.toJsonArray(Collection<TuserinfoScore> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<TuserinfoScore> TuserinfoScore.fromJsonArrayToTuserinfoScores(String json) {
        return new JSONDeserializer<List<TuserinfoScore>>().use(null, ArrayList.class).use("values", TuserinfoScore.class).deserialize(json);
    }
    
}
