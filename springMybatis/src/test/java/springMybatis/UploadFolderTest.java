package springMybatis;

import java.io.File;

import org.apache.log4j.BasicConfigurator;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UploadFolderTest {

	@BeforeClass
	public static void before() {
		BasicConfigurator.configure();
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		
	}
	
	
	
	@Test
	public void testSubString() {
		String folderName = "item.getName01======新建文件夹/新建文件夹 (2)/新建文件夹 (3)/新建文件夹 (4)/新建文本文档 (4).txt";
		String[] s = folderName.split("/");
		folderName =  s[s.length-2];
		System.out.println("item.getFieldName======"+folderName);
		String str = "lly://enterVideoList?result={jsonString}";

		    //截取?之后字符串
		    String str1=str.substring(0, str.indexOf("?"));
		    String str2=str.substring(str1.length()+1, str.length());
		System.out.println("str1 : " + str1 + "  str2 : " + str2);
	}
	
	@Test
	public void testSubString02() {
		String Str = new String("菜鸟教程:www.runoob.com");
        String SubStr1 = new String("runoob");
        String SubStr2 = new String("com");
        String str02 = "房估字(2014)第YPQD0006号";
        String jieguo = str02.substring(str02.indexOf(""),str02.indexOf("06号"));
        System.out.println("截取中间 ： " + jieguo);
        System.out.print("查找字符 o 最后出现的位置 :" );
        System.out.println(Str.lastIndexOf( 'o' ));
        System.out.print("从第14个位置查找字符 o 最后出现的位置 :" );
        System.out.println(Str.lastIndexOf( 'o', 14 ));
        System.out.print("子字符串 SubStr1 最后出现的位置:" );
        System.out.println( Str.lastIndexOf( SubStr1 ));
        System.out.print("从第十五个位置开始搜索子字符串 SubStr1最后出现的位置 :" );
        System.out.println( Str.lastIndexOf( SubStr1, 15 ));
        System.out.print("子字符串 SubStr2 最后出现的位置 :" );
        System.out.println(Str.lastIndexOf( SubStr2 ));
	}
	
	@Test
	public void createDirectory() {
		String folderName = "D://新建文件夹/新建文件夹 (2)/新建文件夹 (3)/新建文件夹 (4)/新建文本文档 (4).txt";
		String fileName = "新建文本文档 (4).txt";
		String folderName01 = folderName.replaceAll(fileName, "");
		File file = new File(folderName01);
		
		
		 if(!file.exists()&& !file.isDirectory()) {
			 System.out.println("目录不存在，需要创建");
			 file.mkdirs();
			 
		 }
		
	}
	
	
	
	
}
