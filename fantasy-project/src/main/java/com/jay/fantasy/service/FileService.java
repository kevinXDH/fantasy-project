package com.jay.fantasy.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    String fileUpload(MultipartFile file,String type);
}
