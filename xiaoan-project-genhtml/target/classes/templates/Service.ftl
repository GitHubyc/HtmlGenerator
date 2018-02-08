package com.xakj.service;


import java.util.HashMap;

import net.sf.json.JSONObject;

public interface ${modelName}Service {

    /**
     * 获取${table_annotation}
     */
    public JSONObject list(HashMap<String, Object> paramMap);

    /**
     * 新增${table_annotation}
     */
    public JSONObject add(HashMap<String, Object> paramMap);

    /**
     * 删除${table_annotation}
     */
    public JSONObject del(HashMap<String, Object> paramMap);

    /**
     * 更新${table_annotation}
     */
    public JSONObject edit(HashMap<String, Object> paramMap);

    /**
     * 查看${table_annotation}
     */
    public JSONObject details(HashMap<String, Object> paramMap);

}