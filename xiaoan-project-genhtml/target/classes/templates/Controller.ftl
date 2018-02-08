package com.xakj.controller;

import com.xakj.service.*;
import com.xakj.util.HttpClientUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * Created by hcmony on 2017/9/5.
 */
@Controller
public class ${modelName}Controller {
    
	@Autowired
	private ${modelName}Service ${modelName?uncap_first}Service;

	/**
     * ${table_annotation}列表
     */
    @RequestMapping(value = "/${modelName?uncap_first}/list", method = RequestMethod.GET)
    public String ${modelName?uncap_first}_list(ModelMap map,
            @RequestParam(value = "currentPage", defaultValue = "1", required = false) Integer currentPage,
            @RequestParam(value = "pageSize", defaultValue = "12", required = false) Integer pageSize,
            @RequestParam(value = "${modelName?uncap_first}Name", defaultValue = "", required = false) String ${modelName?uncap_first}Name) {
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("currentPage", currentPage);
        param.put("pageSize", pageSize);
        param.put("${modelName?uncap_first}Name", ${modelName?uncap_first}Name);
        JSONObject object = ${modelName?uncap_first}Service.list(param);
        map.addAttribute("object", object);
        map.addAttribute("paramMap", param);

        return "${modelName?uncap_first}/${modelName}_list";
    }

    /**
     * 跳转${table_annotation}新增
     */
    @RequestMapping(value = "/${modelName?uncap_first}/add", method = RequestMethod.GET)
    public String ${modelName?uncap_first}_add() {

        return "${modelName?uncap_first}/${modelName}_add";
    }

    /**
     * ${table_annotation}新增
     */
    @RequestMapping(value = "/${modelName?uncap_first}/add", method = RequestMethod.POST)
    @ResponseBody
    public String ${modelName?uncap_first}_add(@RequestBody String requestbody) {
        HashMap<String, Object> param = HttpClientUtil.toMap(JSONObject.fromObject(requestbody).toString());
        JSONObject object = ${modelName?uncap_first}Service.add(param);

        return object.toString();
    }

    /**
     * 删除${table_annotation}
     */
    @RequestMapping(value = "/${modelName?uncap_first}/del", method = RequestMethod.DELETE)
    @ResponseBody
    public String ${modelName?uncap_first}_del(@RequestParam(value = "${modelName?uncap_first}Id") String ${modelName?uncap_first}Id) {
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("${modelName?uncap_first}Id", ${modelName?uncap_first}Id);
        JSONObject object = ${modelName?uncap_first}Service.del(param);

        return object.toString();
    }

    /**
     * 跳转${table_annotation}更新
     */
    @RequestMapping(value = "/${modelName?uncap_first}/edit", method = RequestMethod.GET)
    public String ${modelName?uncap_first}_edit(ModelMap map,
            @RequestParam(value = "${modelName?uncap_first}Id") String ${modelName?uncap_first}Id) {
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("${modelName?uncap_first}Id", ${modelName?uncap_first}Id);
        JSONObject object = ${modelName?uncap_first}Service.details(param);
        map.addAttribute("object", object);

        return "${modelName?uncap_first}/${modelName}_edit";
    }

    /**
     * ${table_annotation}更新
     */
    @RequestMapping(value = "/${modelName?uncap_first}/edit", method = RequestMethod.PUT)
    @ResponseBody
    public String ${modelName?uncap_first}_edit(@RequestBody String requestbody) {
        try {
            HashMap<String, Object> param = HttpClientUtil.toMap(JSONObject.fromObject(requestbody).toString());
            JSONObject object = ${modelName?uncap_first}Service.edit(param);
            return object.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * ${table_annotation}详情
     */
    @RequestMapping(value = "/${modelName?uncap_first}/details", method = RequestMethod.GET)
    public String apply_details(ModelMap map,
            @RequestParam(value = "${modelName?uncap_first}Id") String ${modelName?uncap_first}Id) {
        HashMap<String, Object> param = new HashMap<String, Object>();
        param.put("${modelName?uncap_first}Id", ${modelName?uncap_first}Id);
        JSONObject object = ${modelName?uncap_first}Service.details(param);
        map.addAttribute("object", object);
        return "${modelName?uncap_first}/${modelName?uncap_first}_details";
    }
}
