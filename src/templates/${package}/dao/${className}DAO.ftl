package ${package}.dao;

import com.common.base.BaseDAO;
import ${package}.domain.${className}Domain;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ${className}DAO extends BaseDAO<${className}Domain,Long>  {

}
