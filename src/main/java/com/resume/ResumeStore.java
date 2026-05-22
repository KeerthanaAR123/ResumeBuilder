package com.resume;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

public class ResumeStore {

    private static final ResumeStore INSTANCE = new ResumeStore();

    // username -> list of resumes (each resume is a map of field->value)
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<Map<String, String>>> store = new ConcurrentHashMap<>();

    private ResumeStore() {}

    public static ResumeStore getInstance() {
        return INSTANCE;
    }

    public void addResume(String username, Map<String, String> resume) {
        store.computeIfAbsent(username.toLowerCase().trim(), k -> new CopyOnWriteArrayList<>()).add(resume);
    }

    public List<Map<String, String>> getResumes(String username) {
        return store.getOrDefault(username.toLowerCase().trim(), new CopyOnWriteArrayList<>());
    }

    public Map<String, String> getResume(String username, int index) {
        var list = getResumes(username);
        if (index < 0 || index >= list.size()) return null;
        return list.get(index);
    }
}
