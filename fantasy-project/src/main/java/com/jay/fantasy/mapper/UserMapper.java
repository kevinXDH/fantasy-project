package com.jay.fantasy.mapper;

import com.jay.fantasy.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

public interface UserMapper extends BaseMapper<User> {

    User getByUserNameAndPassword(String username, String password);
}




