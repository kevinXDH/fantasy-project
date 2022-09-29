package com.jay.fantasy.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * 博客表
 * @TableName blog
 */
@TableName(value ="blog")
@Data
public class Blog implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;


    private Integer uid;


    private Integer cid;

    /**
     * 标题
     */
    private String name;

    /**
     * 点赞
     */
    private Integer star;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 内容
     */
    private String content;

    /**
     * 封面图
     */
    private String coverImg;

    /**
     * 文章内容图
     */
    private String img;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 是否删除;0未删除 1 删除
     */
    @TableLogic
    private Integer deleted;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}