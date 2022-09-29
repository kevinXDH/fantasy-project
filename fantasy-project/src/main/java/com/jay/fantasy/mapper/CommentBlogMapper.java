package com.jay.fantasy.mapper;

import com.jay.fantasy.entity.CommentBlog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

public interface CommentBlogMapper extends BaseMapper<CommentBlog> {

    int countByBid(Integer id);
}




