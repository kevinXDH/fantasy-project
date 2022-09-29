package com.jay.fantasy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jay.fantasy.entity.UserStar;
import com.jay.fantasy.mapper.UserStarMapper;
import com.jay.fantasy.service.UserStarService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserStarServiceImpl extends ServiceImpl<UserStarMapper,UserStar> implements UserStarService {
    @Override
    public List<Integer> getCollectListByUid(Integer uid) {
        LambdaQueryWrapper<UserStar> queryWrapper =new LambdaQueryWrapper<>();
        queryWrapper.eq( uid!=null,UserStar::getUid, uid);
        List<UserStar> userStarList = this.list(queryWrapper);
        System.err.println(uid);
        List<Integer> list = userStarList.stream().map(UserStar::getRid).collect(Collectors.toList());
        return list;
    }
}
