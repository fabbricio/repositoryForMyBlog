package com.org.test.coop.junit;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.Resource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.org.coop.admin.servicehelper.BranchSetupServiceHelperImpl;
import com.org.coop.bs.config.DozerConfig;
import com.org.coop.society.data.admin.repositories.DistrictMasterRepository;
import com.org.test.coop.config.LoadUnitTestFiles;
import com.org.test.coop.society.data.transaction.config.TestDataAppConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ComponentScan(basePackages = "com.org.test.coop")
@SpringApplicationConfiguration(classes={TestDataAppConfig.class, DozerConfig.class})
//@ContextConfiguration(classes={TestDataAppConfig.class, DozerConfig.class})
//@ActiveProfile("test")
public class CooperativeServiceBSTest {
	private static final Logger logger = Logger.getLogger(CooperativeServiceBSTest.class);
	
	@Autowired
	private BranchSetupServiceHelperImpl branchSetupServiceImpl;
	
	@Autowired
	private DistrictMasterRepository districtMasterRepository;
	
//	@Autowired
//	private LoadUnitTestFiles loadUnitTestFiles;
	
	@Test
	public void getBranch() {
//		branchSetupServiceImpl.getBranch(25);
		try {
			String str = getFile("inputJson/createBranch.json");
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		districtMasterRepository.findByDistId(0);
	}
	
	private String getFile(String fileName) {

		String result = "";

		ClassLoader classLoader = getClass().getClassLoader();
		try {
			result = IOUtils.toString(classLoader.getResourceAsStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}
}
