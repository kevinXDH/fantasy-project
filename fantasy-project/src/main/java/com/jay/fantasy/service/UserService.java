package com.jay.fantasy.service;

import com.jay.fantasy.DTO.UserDTO;
import com.jay.fantasy.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface UserService extends IService<User>{

    User getByUserNameAndPassword(String username, String password);

    List<UserDTO> getSortList();
}
