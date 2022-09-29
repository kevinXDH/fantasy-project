package com.jay.fantasy.DTO;

import com.jay.fantasy.entity.User;
import lombok.Data;

@Data
public class UserDTO extends User {
    private Integer star;
}
