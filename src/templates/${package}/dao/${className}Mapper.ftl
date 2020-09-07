package ${package}.dao;

import ${package}.bean.entity.${className};
import org.apache.ibatis.annotations.Mapper;

public interface ${className}Mapper {

    /**
    * @param vo
    * @description: 查询计数
    * @author: hudyang
    */
    Long queryCount(${className} vo);

    /**
    * @param vo
    * @description: 基本添加
    * @author: hudyang
    */
    Integer add(${className} vo);

    /**
    * @param list
    * @description: 批量添加
    * @author: hudyang
    */
    Integer addBatch(@Param("list") List<${className}> list);

    /**
    * @param vo
    * @description: 根据主键修改
    * @author: hudyang
    */
    Integer update(${className} vo);

    /**
    * @param list
    * @description: 根据主键批量修改
    * @author: hudyang
    */
    Integer updateBatch(@Param("list") List<${className}> list);

    /**
    * @param vo
    * @description: 根据主键查询
    * @author: hudyang
    */
    ${className} queryById(@Param("id") Long id);

    /**
    * @param vo
    * @description: 根据条件查询
    * @author: hudyang
    */
    ${className} queryByParam(${className} vo);

    /**
    * @param vo
    * @description: 根据主键删除
    * @author: hudyang
    */
    Integer delete(@Param("id") Long id);

    /**
    * @param idList
    * @description: 根据主键集合批量删除
    * @author: hudyang
    */
    Integer deleteByIdList(@Param("idList") List<Long> idList);

    /**
    * @param vo
    * @description: 根据条件查询
    * @author: hudyang
    */
    List<${className}> queryList(${className} vo);


}
