package com.jay.fantasy.controller;

import com.jay.fantasy.common.Response;
import com.jay.fantasy.service.FileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/cos")
@Api(tags = "腾讯云文件上传接口")
public class COSController {
    @Autowired
    private FileService fileService;

    @PostMapping("fileUpload")
    @ApiOperation(value = "文件上传")
    public Response<String> fileUpload(MultipartFile file,String type){
        String url = fileService.fileUpload(file,type);
        return Response.success(url);
    }
}

