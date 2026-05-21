package com.resume;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class UserStore {

    private static final UserStore INSTANCE = new UserStore();
    private final ConcurrentMap<String, String> users = new ConcurrentHashMap<>();

    private UserStore() {
        users.put("admin", "admin123");
    }

    public static UserStore getInstance() {
        return INSTANCE;
    }

    public boolean isValidUser(String username, String password) {
        if (username == null || password == null) {
            return false;
        }
        String storedPassword = users.get(normalize(username));
        return storedPassword != null && storedPassword.equals(password);
    }

    public boolean registerUser(String username, String password) {
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            return false;
        }
        return users.putIfAbsent(normalize(username), password) == null;
    }

    public boolean exists(String username) {
        return username != null && users.containsKey(normalize(username));
    }

    private String normalize(String username) {
        return username.trim().toLowerCase();
    }
}
