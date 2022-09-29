package com.jay.fantasy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import springfox.documentation.oas.annotations.EnableOpenApi;

import javax.sql.DataSource;

@SpringBootApplication
@MapperScan("com.jay.fantasy.mapper")
@EnableOpenApi
public class FantasyApplication {

    public static void main(String[] args) {
        SpringApplication.run(FantasyApplication.class, args);
    }

}
