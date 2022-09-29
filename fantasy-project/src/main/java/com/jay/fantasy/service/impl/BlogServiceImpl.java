package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.DTO.BlogDTO;
import com.jay.fantasy.DTO.CommentBlogDTO;
import com.jay.fantasy.DTO.ResourceDetailDTO;
import com.jay.fantasy.entity.Blog;
import com.jay.fantasy.entity.Resource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.mapper.UserMapper;
import com.jay.fantasy.service.BlogService;
import com.jay.fantasy.mapper.BlogMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService{
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CommentBlogServiceImpl commentBlogService;

    @Override
    public List<BlogDTO> getList(int page, int pageSize) {
        Page<Blog> pageInfo =new Page<>(page, pageSize);
        LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Blog::getCreateTime);
        Page<Blog> blogPage = this.page(pageInfo, queryWrapper);
        List<Blog> records = blogPage.getRecords();
        List<BlogDTO> blogDTOList = records.stream().map(e -> {
            BlogDTO dto =new BlogDTO();
            int commentCount = commentBlogService.countByBid(e.getId());
            User user = userMapper.selectById(e.getUid());
            return getBlogDTO(e, dto, user, commentCount);
        }).collect(Collectors.toList());
        return blogDTOList;
    }

    @Override
    public BlogDTO getBlogById(Integer id) {
        Blog blog = this.getById(id);
        BlogDTO dto =new BlogDTO();
        BeanUtils.copyProperties(blog,dto);
        User user = userMapper.selectById(blog.getUid());
        user.setEmail(null);
        user.setPhone(null);
        user.setUsername(null);
        user.setCreateTime(null);
        user.setUpdateTime(null);
        dto.setUser(user);
        return dto;
    }

    @Override
    public List<BlogDTO> getHotList() {
        LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(Blog::getCreateTime);
        queryWrapper.last("limit 4");
        List<Blog> blogList = this.list(queryWrapper);
        List<BlogDTO> blogDTOList = blogList.stream().map(e -> {
            BlogDTO dto =new BlogDTO();
            User user = userMapper.selectById(e.getUid());
            List<CommentBlogDTO> commentBlogDTOS = commentBlogService.getListByBid(e.getId());
            int commentCount = commentBlogDTOS.size();
            return getBlogDTO(e, dto, user, commentCount);
        }).collect(Collectors.toList());
        return blogDTOList;
    }

    private BlogDTO getBlogDTO(Blog e, BlogDTO dto, User user, int commentCount) {
        user.setEmail(null);
        user.setPhone(null);
        user.setUsername(null);
        user.setCreateTime(null);
        user.setUpdateTime(null);
        BeanUtils.copyProperties(e,dto);
        dto.setUser(user);
        dto.setCommentCount(commentCount);
        return dto;
    }
}




