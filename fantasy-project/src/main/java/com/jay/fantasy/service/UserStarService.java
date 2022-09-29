package com.jay.fantasy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jay.fantasy.entity.UserStar;

import java.util.List;

public interface UserStarService extends IService<UserStar> {
    List<Integer> getCollectListByUid(Integer uid);

}
