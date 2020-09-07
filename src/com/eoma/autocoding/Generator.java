package com.eoma.autocoding;

import com.eoma.autocoding.common.Column;
import com.eoma.autocoding.common.Table;
import com.eoma.autocoding.utils.CamelCaseUtils;
import com.eoma.autocoding.utils.FileHelper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.log4j.Logger;

import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

public class Generator {
    private Logger logger = Logger.getLogger(this.getClass());
    private Properties properties = null;

    public Generator() throws Exception{
        properties = new Properties();
        String fileDir = this.getClass().getClassLoader().getResource("generator2.xml").getFile();
        properties.loadFromXML(new FileInputStream(fileDir));
    }

    public Table parseTable(String tableName) throws Exception{
        String driverName = properties.getProperty("jdbc.driver");
        String userName = properties.getProperty("jdbc.username");
        String userPwd = properties.getProperty("jdbc.password");
        String dbURL = properties.getProperty("jdbc.url");

        String catalog = properties.getProperty("jdbc.catalog");
        String schema = properties.getProperty("jdbc.schema");
        schema = schema == null ? "%" : schema;
        String column = "%";

        logger.debug("driver>>"+driverName);
        logger.debug("url>>"+dbURL);
        logger.debug("name>>"+userName);
        logger.debug("password>>"+userPwd);
        logger.debug("catalog>>"+catalog);
        logger.debug("schema>>"+schema);

        Class.forName(driverName);
        Connection conn = java.sql.DriverManager.getConnection(dbURL, userName, userPwd);
        DatabaseMetaData dmd = conn.getMetaData();

        ResultSet rs = dmd.getColumns(catalog, schema, tableName, column);
        List<Column> columns = new ArrayList<Column>();
        while (rs.next()) {
            Column c = new Column();

            c.setLabel(rs.getString("REMARKS"));

            String name = rs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);

            String dbType = rs.getString("TYPE_NAME");
            String type = properties.getProperty(dbType);
            c.setDbType(dbType);
            c.setType(type == null ? "String" : type);

            c.setLength(rs.getInt("COLUMN_SIZE"));
            c.setDecimalDigits(rs.getInt("DECIMAL_DIGITS"));
            c.setNullable(rs.getBoolean("NULLABLE"));
            columns.add(c);
        }

        List<Column> pkColumns = new ArrayList<Column>();
        ResultSet pkrs = dmd.getPrimaryKeys(catalog, schema, tableName);
        while(pkrs.next()){
            Column c = new Column();
            String name = pkrs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);
            pkColumns.add(c);
        }

        conn.close();

        Table t = new Table();

        String prefiex = properties.getProperty("tableRemovePrefixes");
        String name = tableName;
        if( prefiex != null && !"".equals(prefiex) ){
            name = tableName.replaceFirst(prefiex,"");
        }
        t.setName(CamelCaseUtils.toCamelCase(name));
        t.setDbName(tableName);
        t.setColumns(columns);
        t.setPkColumns(pkColumns);
        return t;
    }

    /**
     * @throws Exception
     */
    public void gen(String tableName) throws Exception{
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_21);

        String outRoot = properties.getProperty("outRoot");
        String basepackage = properties.getProperty("basepackage");
        SimpleDateFormat sm_date = new SimpleDateFormat("yyyyMMdd HHssmm");
        SimpleDateFormat sm_year = new SimpleDateFormat("yyyy");

        Map<String, Object> root = new HashMap<String, Object>();
        Table t = this.parseTable(tableName);
        System.out.println("tableName = [" + t.getNameUpper().replaceFirst("Lk", "") + "]");
//        root.put("table", t);
//        root.put("className", t.getNameUpper().replaceFirst("Lk", ""));
//        System.out.println(t.getName() + "===");
//        root.put("classNameLower", t.getName().replaceFirst("lk", "").replaceFirst(t.getName().replaceFirst("lk", "").substring(0, 1), t.getName().replaceFirst("lk", "").substring(0, 1).toLowerCase()) );
//        System.out.println("tableName = [" + t.getName().replaceFirst("lk", "").replaceFirst(t.getName().replaceFirst("lk", "").substring(0, 1), t.getName().replaceFirst("lk", "").substring(0, 1).toLowerCase()) + "]");
//        root.put("package", basepackage);
//        root.put("date", sm_date.format(new Date()));
//        root.put("year", sm_year.format(new Date()));
        root.put("table", t);
        root.put("className", t.getNameUpper());
        root.put("classNameLower", t.getName());
        root.put("package", basepackage);
        root.put("date", sm_date.format(new Date()));
        root.put("year", sm_year.format(new Date()));

        String templateDir = this.getClass().getClassLoader().getResource("templates").getPath();

        File tdf = new File(templateDir);
        List<File> files = FileHelper.findAllFile(tdf);

        for(File f: files){
            String parentDir = "";
            if( f.getParentFile().compareTo(tdf) != 0 ){
                parentDir = f.getParent().split("templates")[1];
            }
            cfg.setClassForTemplateLoading(this.getClass(), "/templates" + parentDir);

            Template template = cfg.getTemplate(f.getName());
            template.setEncoding("UTF-8");

            String parentFileDir = FileHelper.genFileDir(parentDir, root);
            parentFileDir = parentFileDir.replace(".", "/");
            String file = FileHelper.genFileDir(f.getName(),root).replace(".ftl", ".java");


            File newFile = FileHelper.makeFile(outRoot + parentFileDir + "/" + file);
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream( newFile ), "UTF-8"));
            template.process(root, out);
            logger.debug("输出" + outRoot + parentFileDir + "/" + file);
        }
    }

    public static void main(String[] args) throws Exception{
        Generator g = new Generator();

        g.gen("t_hb_test");

        System.out.println("table完成------------------");
    }
}
