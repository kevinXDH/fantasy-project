package com.jay.fantasy.VO;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.jay.fantasy.entity.Resource;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class ResourceVO implements Serializable {
    private Integer id;

    private Integer uid;

    private Integer cid;

    private String name;

    private String description;

    private String content;

    private String image;

    private String url;


    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    private List<String> tagArr;
}
