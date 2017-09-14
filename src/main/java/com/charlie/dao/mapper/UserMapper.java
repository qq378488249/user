package com.charlie.dao.mapper;

import com.charlie.entity.User;
import com.charlie.util.ParamMap;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User get(ParamMap paramMap);
}