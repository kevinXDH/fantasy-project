package com.jay.fantasy.service;

import com.jay.fantasy.DTO.CommentBlogDTO;
import com.jay.fantasy.entity.CommentBlog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface CommentBlogService extends IService<CommentBlog> {

    List<CommentBlogDTO> getListByBid(Integer bid);

    int countByBid(Integer id);
}
