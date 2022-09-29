package com.jay.fantasy.DTO;

import com.jay.fantasy.entity.Blog;
import com.jay.fantasy.entity.User;
import lombok.Data;

@Data
public class BlogDTO extends Blog {
    private User user;

    private Integer commentCount;
}
