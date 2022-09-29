package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.DTO.CommentResourceDTO;
import com.jay.fantasy.entity.CommentResource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.mapper.UserMapper;
import com.jay.fantasy.service.CommentResourceService;
import com.jay.fantasy.mapper.CommentResourceMapper;
import com.jay.fantasy.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentResourceServiceImpl extends ServiceImpl<CommentResourceMapper, CommentResource>
    implements CommentResourceService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<CommentResourceDTO> getListByRid(Integer rid) {
        LambdaQueryWrapper<CommentResource> queryWrapper =new LambdaQueryWrapper<>();
        queryWrapper.eq(rid!=null,CommentResource::getRid,rid);
        return getCommentResourceDTOS(queryWrapper);
    }

    @Override
    public List<CommentResourceDTO> getAllComment() {
        LambdaQueryWrapper<CommentResource> queryWrapper =new LambdaQueryWrapper<>();
        return getCommentResourceDTOS(queryWrapper);
    }

    private List<CommentResourceDTO> getCommentResourceDTOS(LambdaQueryWrapper<CommentResource> queryWrapper) {
        queryWrapper.orderByDesc(CommentResource::getCreateTime);
        List<CommentResource> commentResourceList = this.list(queryWrapper);
        List<CommentResourceDTO> commentResourceDTOList = commentResourceList.stream().map(item -> {
            CommentResourceDTO dto =new CommentResourceDTO();
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
        return commentResourceDTOList;
    }
}




