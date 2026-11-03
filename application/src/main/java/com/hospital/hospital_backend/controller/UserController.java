package com.hospital.hospital_backend.controller;

import com.hospital.hospital_backend.entity.User;
import com.hospital.hospital_backend.service.UserService;

import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<UserResponse> getAllUsers() {
        return userService.getAllUsers()
                .stream()
                .map(user -> new UserResponse(
                        user.getId(),
                        user.getFullName(),
                        user.getEmail(),
                        user.getRole(),
                        user.isActive()
                ))
                .toList();
    }

    public record UserResponse(
            Long id,
            String fullName,
            String email,
            com.hospital.hospital_backend.entity.Role role,
            boolean active
    ) {}
}
