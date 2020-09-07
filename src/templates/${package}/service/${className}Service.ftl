package ${package}.service;

import ${package}.bean.entity.${className};
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ${className}Service {

    /**
    * @param vo
    * @description: 基本添加
    */
    ${className} add(${className} vo) throws Exception;

    /**
    * @param list
    * @description: 批量添加
    */
    List<${className}> addBatch(@Param("list") List<${className}> list) throws Exception;

    /**
    * @param vo
    * @description: 根据主键修改
    */
    Integer update(${className} vo) throws Exception;

    /**
    * @param list
    * @description: 根据主键批量修改
    */
    Integer updateBatch(@Param("list") List<${className}> list) throws Exception;

    /**
    * @param id
    * @description: 根据主键查询
    */
    ${className} queryById(@Param("id") Long id);

    /**
    * @param vo
    * @description: 根据条件查询
    */
    ${className} queryByParam(${className} vo);

    /**
    * @param id
    * @description: 根据主键删除
    */
    Integer delete(@Param("id") Long id) throws Exception;

    /**
    * @param idList
    * @description: 根据主键集合批量删除
    */
    Integer deleteByIdList(@Param("idList") List<Long> idList) throws Exception;

    /**
    * @param vo
    * @description: 根据条件查询
    */
    List<${className}> queryList(${className} vo);



}
