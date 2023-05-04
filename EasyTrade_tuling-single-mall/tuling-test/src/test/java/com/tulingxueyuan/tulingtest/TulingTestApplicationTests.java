package com.tulingxueyuan.tulingtest;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@SpringBootTest
class TulingTestApplicationTests {

    @Test
    void uploadOSS() throws FileNotFoundException {

        String endpoint = "http://oss-cn-chengdu.aliyuncs.com";

        String accessKeyId = "LTAI4GHWCM5LdNoiLy35mBog";
        String accessKeySecret = "Vytl0LAIKGmiWATIuuwevN3LjzQs9S";


        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dir = simpleDateFormat.format(new Date())+"/";

        InputStream inputStream = new FileInputStream("C:\\Users\\zengjin\\Pictures\\v2-def8223c53c7c90774515cf9c106da57_720w.jpg");
        ossClient.putObject("tulingmall-xushu", dir+"v2-def8223c53c7c90774515cf9c106da57_720w.jpg", inputStream);

        ossClient.shutdown();

        System.out.println("上传成功！");
    }

}
