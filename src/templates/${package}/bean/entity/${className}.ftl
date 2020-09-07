package ${package}.export.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class ${className} implements Serializable {

<#list table.columns as column>
	/**${column.label}*/
	private ${column.type} ${column.name};
</#list>
 
}
