package com.jay.fantasy.utils.jwt;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

/**
 * 密钥实体类：存放公钥和私钥
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RSA256Key {
    private RSAPublicKey publicKey;

    private RSAPrivateKey privateKey;
}
