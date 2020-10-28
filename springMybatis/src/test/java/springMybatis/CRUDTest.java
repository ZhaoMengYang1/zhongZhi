package springMybatis;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.BasicConfigurator;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.zz.springMybatis.entitys.UploadContent;
import com.zz.springMybatis.mappers.UploadContentMapper;
@RunWith(Parameterized.class)
public class CRUDTest {
	
	static UploadContentMapper uploadContent;
	@BeforeClass
	public static void before() {
		BasicConfigurator.configure();
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		 uploadContent = ctx.getBean(UploadContentMapper.class);
		
	}
	
	@Test
	public void SelectTest() {
		
		UploadContent content = uploadContent.selectByPrimaryKey("8888888");
		System.out.println(content);
	}
	
	@Test
	public void SelectAllTest() {
		List<UploadContent> content = uploadContent.getAllContent();
		for(UploadContent list : content) {
			System.out.println("目录列表");
			System.out.println(list);
		}
		
		String jsonOut = JSON.toJSONString(content);
		System.out.println(jsonOut);
	}
	
	
	
	
	 	int[] nums;
	    int target;
	    int[] exception;
	    @Test
	    public void test(){
	        TwoSum add = new TwoSum();
	        //待测试的方法
	        int[] result = add.twoSum(nums,target);
	    }

	    @Parameterized.Parameters
	    public static Collection prepareData(){  //必须为public static的 返回值必须是Collection类型的

	        Object [][] object = {{new int[]{2,7,11,15},9,new int[]{0,1}},{new int[]{0,4,3,0},0,new int[]{0,3}}};  //测试数据
	        //需返回一个二维数组  这种写法是为了方便控制测试数据
	        return Arrays.asList(new Object[][]{object[1]});
	    }

	    public CRUDTest(int[] nums, int target, int[] exception) {
	        this.nums = nums;
	        this.target = target;
	        this.exception = exception;
	    }
	}

	class TwoSum{
	    public int[] twoSum(int[] nums, int target) {
	        List<Integer> list=new ArrayList<>();
	        //将数组中大于target的数过滤 不能这么写因为数字既有正数又有负数
	        //或者说要考虑和未0的情况
	        //第一种情况肯定是不行的 【 5 -2   】  3
//	        if(target>0){
//	            for(int i=0;i<nums.length;i++){
//	                if(nums[i]>target)
//	                    continue;
//	                list.add(i);
//	            }
//	        }else if(target<0){
//	            //-3 -1 -2 -5 +2
//	            for(int i=0;i<nums.length;i++){
//	                if(nums[i]>target)
//	                    continue;
//	                list.add(i);
//	            }
//	        }

	        //遍历list
	        int[] list2=new int[2];
	        Integer[] arrSmall=(Integer[])list.toArray(new Integer[list.size()]);
	        for (int i = 0; i < arrSmall.length; i++) {
	            for (int j = i+1; j < arrSmall.length; j++) {
	                if((nums[arrSmall[i]]+nums[arrSmall[j]])==target){
	                    list2[0]=arrSmall[i];
	                    list2[1]=arrSmall[j];
	                    break;
	                }
	            }
	        }

	        return list2;
	    }
	
	
	
	
	
	
	
	
	
	
	
}
