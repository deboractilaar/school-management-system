package com.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.Attachment;
import com.dao.AttachmentDao;

@Controller
public class AttachmentController {
	@Autowired
	private AttachmentDao attachmentDao;
	
	@RequestMapping(value={"/files/{fileId}"})
	public ResponseEntity getFile(@PathVariable(value="fileId") String id) throws SQLException {
		Attachment attachment = attachmentDao.getAttachmentbyId(Integer.parseInt(id));
		HttpHeaders httpHeaders = new HttpHeaders();
		InputStreamResource inputStreamResource = new InputStreamResource(attachment.getFileBlob().getBinaryStream());
		httpHeaders.setContentLength(attachment.getFileBlob().length());
		httpHeaders.setContentType(MediaType.valueOf(attachment.getFileMimeType()));
		httpHeaders.setContentDispositionFormData("inline", attachment.getFileName());
		return new ResponseEntity(inputStreamResource, httpHeaders, HttpStatus.OK);
	}
}
