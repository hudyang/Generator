package ${package}.service.impl;

import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import javax.annotation.Resource;
import ${package}.dao.${className}Mapper;
import ${package}.bean.entity.${className};
import ${package}.service.${className}Service;
import ${package}.common.utils.Log;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.alibaba.fastjson.JSONObject;
import org.springframework.transaction.annotation.Transactional;
import java.sql.SQLException;
import java.util.List;


@Service("${classNameLower}Service")
public class ${className}ServiceImpl implements ${className}Service {

	private static Logger log = Log.get(${className}ServiceImpl.class);

	@Resource
	private ${className}Mapper ${classNameLower}Mapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${className} add(${className} vo) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-add", JSONObject.toJSONString(vo));
        try {
            Integer result = ${classNameLower}Mapper.add(vo);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-add", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-add", JSONObject.toJSONString(vo));
        return vo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<${className}> addBatch(List<${className}> list) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-addBatch", JSONObject.toJSONString(list));
        try {
            Integer result = ${classNameLower}Mapper.addBatch(list);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-addBatch", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-addBatch", JSONObject.toJSONString(list));
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer update(${className} vo) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-update", JSONObject.toJSONString(vo));
        Integer result = null;
        try {
            result = ${classNameLower}Mapper.update(vo);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-update", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-update", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer updateBatch(List<${className}> list) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-add", JSONObject.toJSONString(list));
        Integer result = null;
        try {
            result = ${classNameLower}Mapper.updateBatch(list);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-add", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-add", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    public ${className} queryById(Long id) {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-queryById", id);
        ${className} result = null;
        try {
            result = ${classNameLower}Mapper.queryById(id);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-queryById", e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-queryById", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    public ${className} queryByParam(${className} vo) {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-add", JSONObject.toJSONString(vo));
        ${className} result = null;
        try {
            result = ${classNameLower}Mapper.queryByParam(vo);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-queryByParam", e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-queryByParam", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer delete(Long id) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-delete", id);
        Integer result = null;
        try {
            result = ${classNameLower}Mapper.delete(id);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-delete", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-delete", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deleteByIdList(List<Long> idList) throws Exception {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-deleteByIdList", JSONObject.toJSONString(idList));
        Integer result = null;
        try {
            result = ${classNameLower}Mapper.deleteByIdList(idList);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-deleteByIdList", e.getMessage());
            throw new SQLException(e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-deleteByIdList", JSONObject.toJSONString(result));
        return result;
    }

    @Override
    public List<${className}> queryList(${className} vo) {
        Log.info(log, "\n 方法[{}]，入参：[{}]", "${className}ServiceImpl-queryList", JSONObject.toJSONString(vo));
        List<${className}>  result = null;
        try {
            result = ${classNameLower}Mapper.queryList(vo);
        } catch (Exception e) {
            Log.error(log, "\n 方法[{}]，异常：[{}]", "${className}ServiceImpl-queryList", e.getMessage());
        }
        Log.info(log, "\n 方法[{}]，出参：[{}]", "${className}ServiceImpl-queryList", JSONObject.toJSONString(result));
        return result;
    }

}