package ${package}.service.impl;

import org.springframework.stereotype.Service;
import org.slf4j.Logger;

import javax.annotation.Resource;

import ${package}.dao.${className}DAO;
import ${package}.domain.${className}Domain;
import ${package}.vo.${className}VO;
import ${package}.service.${className}Service;
import ${package}.service.base.impl.BaseServiceImpl;
import com.common.utils.Log;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;


@Service("${classNameLower}Service")
public class ${className}ServiceImpl extends BaseServiceImpl<${className}VO, ${className}Domain> implements ${className}Service {

	private static Logger log = Log.get(${className}ServiceImpl.class);

	@Resource
	private ${className}DAO ${classNameLower}Dao;


}