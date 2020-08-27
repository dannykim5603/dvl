package com.sbs.dan.at.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.sbs.dan.at.dto.File;
import com.sbs.dan.at.service.FileService;
import com.sbs.dan.at.service.VideoStreamService;
import com.sbs.dan.at.util.Util;

@Controller
public class FileController {
	@Autowired
	private FileService fileService;
	@Autowired
	private VideoStreamService videoStreamService;
	
	private LoadingCache<Integer, File> fileCache = CacheBuilder.newBuilder().maximumSize(100).expireAfterAccess(2, TimeUnit.MINUTES).build(new CacheLoader<Integer,File>(){
		@Override
		public File load (Integer fileId) {
			return fileService.getFileById(fileId);
		}
	});
	@RequestMapping(value = "/usr/file/img", method = RequestMethod.GET)
	public void showImg(HttpServletResponse response, int id) throws IOException {
		File file = Util.getCacheData(fileCache, id);
		
		InputStream in = new ByteArrayInputStream(file.getBody());
		
		switch (file.getFileExtType2Code()) {
		case "jpg":
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		case "png":
			response.setContentType(MediaType.IMAGE_PNG_VALUE);
		case "gif":
			response.setContentType(MediaType.IMAGE_GIF_VALUE);
		}
		IOUtils.copy(in, response.getOutputStream());
	}
}