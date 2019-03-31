package ru.sokol.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ru.sokol.dto.user.CreateUserRequest;
import ru.sokol.dto.user.UserDto;
import ru.sokol.service.UserService;

import javax.validation.Valid;

@RestController
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/api/users")
    public ResponseEntity<Page<UserDto>> getUsers(Pageable pageable) {
        Page<UserDto> result = userService.findAllUsers(pageable);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/api/users")
    public ResponseEntity<UserDto> createUser(@Valid @RequestBody CreateUserRequest request) {
        UserDto result = userService.createUser(request);
        return new ResponseEntity<>(result, HttpStatus.CREATED);
    }
}