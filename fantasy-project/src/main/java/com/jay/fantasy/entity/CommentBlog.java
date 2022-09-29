package com.jay.fantasy.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * 博客评论表
 * @TableName comment_blog
 */
@TableName(value ="comment_blog")
@Data
public class CommentBlog implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 
     */
    private Integer bid;

    /**
     * 
     */
    private Integer uid;

    /**
     * 内容
     */
    private String content;

    /**
     * 点赞
     */
    private Integer star;

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