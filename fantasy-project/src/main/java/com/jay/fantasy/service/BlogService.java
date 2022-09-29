package com.jay.fantasy.service;

import com.jay.fantasy.DTO.BlogDTO;
import com.jay.fantasy.entity.Blog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface BlogService extends IService<Blog> {

    List<BlogDTO> getList(int page, int pageSize);

    BlogDTO getBlogById(Integer id);

    List<BlogDTO> getHotList();
}
