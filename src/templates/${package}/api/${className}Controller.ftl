package ${package}.api;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ${package}.common.utils.Log;
import io.swagger.annotations.Api;
import ${package}.service.${className}Service;

@RestController
@RequestMapping("${classNameLower}")
public class ${className}Controller  {

    private static Logger log = Log.get(${className}Controller.class);

    @Autowired
    private ${className}Service ${classNameLower}Service;


}
