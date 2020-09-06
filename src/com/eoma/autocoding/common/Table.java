package com.eoma.autocoding.common;

import java.util.List;

public class Table {

	private String name;
	private String dbName;
	private List<Column> columns;
	private List<Column> pkColumns;
	
	public String getName() {
		return name;
	}
	public String getNameUpper() {
		return name.replaceFirst(name.substring(0, 1), name.substring(0, 1).toUpperCase());
	}
	public String getNameUpper(String str, String replace) {
		return name.replaceFirst(str + replace, "");
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDbName() {
		return dbName;
	}
	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
	public List<Column> getPkColumns() {
		return pkColumns;
	}
	public void setPkColumns(List<Column> pkColumns) {
		this.pkColumns = pkColumns;
	}
}