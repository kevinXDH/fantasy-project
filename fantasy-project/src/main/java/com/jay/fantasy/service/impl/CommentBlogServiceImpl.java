package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.DTO.CommentBlogDTO;
import com.jay.fantasy.DTO.CommentResourceDTO;
import com.jay.fantasy.entity.CommentBlog;
import com.jay.fantasy.entity.CommentResource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.mapper.UserMapper;
import com.jay.fantasy.service.CommentBlogService;
import com.jay.fantasy.mapper.CommentBlogMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class CommentBlogServiceImpl extends ServiceImpl<CommentBlogMapper, CommentBlog>
    implements CommentBlogService{

    @Autowired
    private CommentBlogMapper commentBlogMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<CommentBlogDTO> getListByBid(Integer bid) {
        LambdaQueryWrapper<CommentBlog> queryWrapper =new LambdaQueryWrapper<>();
        queryWrapper.eq(bid!=null,CommentBlog::getBid,bid);
        queryWrapper.orderByDesc(CommentBlog::getCreateTime);
        List<CommentBlog> commentBlogList = this.list(queryWrapper);
        List<CommentBlogDTO> commentBlogDTOList = commentBlogList.stream().map(item -> {
            CommentBlogDTO dto =new CommentBlogDTO();
            BeanUtils.copyProperties(item,dto);
            User user = userMapper.selectById(item.getUid());
            user.setUsername(null);
            user.setEmail(null);
            user.setPhone(null);
            user.setCreateTime(null);
            user.setUpdateTime(null);
            dto.setUser(user);
            return dto;
        }).collect(Collectors.toList());
        return commentBlogDTOList;
    }

    @Override
    public int countByBid(Integer id) {
        int count = commentBlogMapper.countByBid(id);
        return count;
    }
}




