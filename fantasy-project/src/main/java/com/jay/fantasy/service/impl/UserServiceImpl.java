package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.DTO.UserDTO;
import com.jay.fantasy.common.BusinessException;
import com.jay.fantasy.entity.Resource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.mapper.CategoryMapper;
import com.jay.fantasy.mapper.ResourceMapper;
import com.jay.fantasy.service.CategoryService;
import com.jay.fantasy.service.UserService;
import com.jay.fantasy.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ResourceMapper resourceMapper;
    @Override
    public User getByUserNameAndPassword(String username, String password) {
        return userMapper.getByUserNameAndPassword(username, password);
    }

    @Override
    public List<UserDTO> getSortList() {
        List<User> userList = userMapper.selectList(null);
        List<UserDTO> userDTOS = userList.stream().map(user -> {
            UserDTO userDTO = new UserDTO();
            BeanUtils.copyProperties(user, userDTO, "password","username");
            LambdaQueryWrapper<Resource> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Resource::getUid, user.getId());
            queryWrapper.last("limit 10");
            Long count = resourceMapper.selectCount(queryWrapper);
            userDTO.setStar(Math.toIntExact(count));
            return userDTO;
        }).collect(Collectors.toList());
        return userDTOS;
    }
}




