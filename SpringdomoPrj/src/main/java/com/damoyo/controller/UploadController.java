package com.damoyo.controller;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	// @PostMapping("/uploadFormAction")
		// public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		//
		// for (MultipartFile multipartFile : uploadFile) {
		//
		// log.info("-------------------------------------");
		// log.info("Upload File Name: " +multipartFile.getOriginalFilename());
		// log.info("Upload File Size: " +multipartFile.getSize());
		//
		// }
		// }
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile) {
		
		String uploadFolder = "C:\\upload";
		
		for(MultipartFile multipartFile: uploadFile) {
			log.info("--------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
		
		String uploadFileName = multipartFile.getOriginalFilename();
		
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		log.info("only file name: " + uploadFileName);
		
		File saveFile= new File(uploadFolder, multipartFile.getOriginalFilename());
		
		try {
			multipartFile.transferTo(saveFile);
		} catch(Exception e) {
			log.error(e.getMessage());
		} // end catch
		} // end for
	} 
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {

		log.info("update ajax post.................");
		
		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName. lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
/*	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path:" + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			
			
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
		
	} */
/*	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:\\upload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path:" + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
		
	} */
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	
}
