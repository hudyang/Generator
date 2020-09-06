package ${package}.dao;

import ${package}.dao.base.BaseDAO;
import ${package}.domain.${className}Domain;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ${className}DAO extends BaseDAO<${className}Domain,Long>  {

}
