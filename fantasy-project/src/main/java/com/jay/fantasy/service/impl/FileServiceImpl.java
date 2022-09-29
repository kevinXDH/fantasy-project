package com.jay.fantasy.service.impl;

import com.jay.fantasy.service.FileService;
import com.jay.fantasy.utils.ConstantCOSPropertiesUtils;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.http.HttpMethodName;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.model.GeneratePresignedUrlRequest;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URL;
import java.util.Date;
import java.util.UUID;

@Service
@Slf4j
public class FileServiceImpl implements FileService {
    @Override
    public String fileUpload(MultipartFile file,String type) {
        String secretId = ConstantCOSPropertiesUtils.Tencent_secretId;
        String secretKey = ConstantCOSPropertiesUtils.Tencent_secretKey;

        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        Region region = new Region("ap-shanghai");
        ClientConfig clientConfig = new ClientConfig(region);

        clientConfig.setHttpProtocol(HttpProtocol.https);

        COSClient cosClient = new COSClient(cred, clientConfig);

        // 指定文件将要存放的存储桶
        String bucketName = "fantasy-1305765455";

        //文件名称 为了保证文件名称唯一，此处使用uuid来设置文件名称
        String filename = UUID.randomUUID().toString().replaceAll("-","") +"_"+file.getOriginalFilename();

        String key = type+"/"+filename;
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, multipartFileToFile(file));
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        log.info("putObjectResult:"+putObjectResult);

        //删除本地上传资源
        delTempFile(multipartFileToFile(file));

        Date expiration = new Date(new Date().getTime() + 5 * 60 * 10000);

        GeneratePresignedUrlRequest req =
                new GeneratePresignedUrlRequest(bucketName, key, HttpMethodName.GET);
        // 设置签名过期时间(可选), 若未进行设置, 则默认使用 ClientConfig 中的签名过期时间(1小时)
        // 可以设置任意一个未来的时间，推荐是设置 10 分钟到 3 天的过期时间
        req.setExpiration(expiration);

        URL url = cosClient.generatePresignedUrl(req);

        //关闭客户端
        cosClient.shutdown();

        //拼接文件地址
        StringBuffer stringBuffer = new StringBuffer()
                .append(url.getProtocol())
                .append("://")
                .append(url.getHost())
                .append(url.getPath());

        return stringBuffer.toString();
    }

    /**
     * 将multipartFile转为file
     **/
    private File multipartFileToFile(MultipartFile file)  {
        File toFile = null;
        if (file.equals("") || file.getSize() <= 0) {
            file = null;
        } else {
            try {
                InputStream ins = null;
                ins = file.getInputStream();
                toFile = new File(file.getOriginalFilename());
                inputStreamToFile(ins, toFile);
                ins.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return toFile;
    }

    /**
     * 获取流文件
     */
    private static void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 删除本地临时文件
     */
    public static void delTempFile(File file) {
        if (file != null) {
            File del = new File(file.toURI());
            del.delete();
        }
    }
}

