package org.addrMy.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
  public static SqlSessionFactory  sqlSessionFactor;
  static {
	  String resource = "org/addrMy/config/Configuration.xml";
  
	  try {
		Reader  reader = Resources.getResourceAsReader(resource);
		sqlSessionFactor = new SqlSessionFactoryBuilder().build(reader);
	} catch (IOException e) {
			e.printStackTrace();
	}
  }  //static
  
  public static  SqlSessionFactory getSqlSessionFactor() {
	  return sqlSessionFactor;
  }
  
}
