package com.jay.fantasy.service;

import java.io.File;

public interface EmailService {
    void sendSimpleMail(String from, String to, String subject, String content);

}
