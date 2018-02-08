package com.xakj.service.impl;

import com.xakj.constant.Constant;
import com.xakj.service.*;
import com.xakj.util.HttpClientUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Component;

import java.util.HashMap;
@Component
public class ${modelName}ServiceImpl implements ${modelName}Service {
    /**
     * 获取${table_annotation}
     */
    @Override
    public JSONObject list(HashMap<String, Object> paramMap){
        String url = Constant.SERVERURL + "/${modelName?uncap_first}";
        return HttpClientUtil.get(url, HttpClientUtil.getToken(), paramMap);
    };

    /**
     * 新增${table_annotation}
     */
    @Override
    public JSONObject add(HashMap<String, Object> paramMap){
        String url = Constant.SERVERURL + "/${modelName?uncap_first}";
        return HttpClientUtil.postByBody(url, HttpClientUtil.getToken(), paramMap);
    };

    /**
     * 删除${table_annotation}
     */
    @Override
    public JSONObject del(HashMap<String, Object> paramMap){
        String url = Constant.SERVERURL + "/${modelName?uncap_first}/"+paramMap.get("${modelName?uncap_first}Id");
        return HttpClientUtil.delete(url, HttpClientUtil.getToken(), paramMap);
    };

    /**
     * 更新${table_annotation}
     */
    @Override
    public JSONObject edit(HashMap<String, Object> paramMap){
        String url = Constant.SERVERURL + "/${modelName?uncap_first}/"+paramMap.get("${modelName?uncap_first}Id");
        return HttpClientUtil.putByBody(url, HttpClientUtil.getToken(), paramMap);
    };

    /**
     * 查看${table_annotation}
     */
    @Override
    public JSONObject details(HashMap<String, Object> paramMap){
        String url = Constant.SERVERURL + "/${modelName?uncap_first}/"+paramMap.get("${modelName?uncap_first}Id");
        return HttpClientUtil.get(url, HttpClientUtil.getToken(), paramMap);
    }
}
