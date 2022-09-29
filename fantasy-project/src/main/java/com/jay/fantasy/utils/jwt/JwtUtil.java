package com.jay.fantasy.utils.jwt;

import cn.hutool.json.JSONUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import lombok.extern.slf4j.Slf4j;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Calendar;
import java.util.Date;

/**
 * Jwt工具类
 */
@Slf4j
public class JwtUtil {
    public static final String KEY_ALGORITHM = "RSA";

    public static final int KEY_SIZE = 1024;

    private static volatile RSA256Key rsa256Key;

    /**
     * 生成公钥和私钥
     */
    public static void generateRSA256Key() throws NoSuchAlgorithmException {
        // 单例模式，
        if (rsa256Key == null) {
            synchronized (RSA256Key.class) {
                if (rsa256Key == null) {
                    KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance(KEY_ALGORITHM);
                    keyPairGen.initialize(KEY_SIZE);
                    KeyPair keyPair = keyPairGen.generateKeyPair();
                    RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
                    RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
                    rsa256Key = new RSA256Key();
                    rsa256Key.setPublicKey(publicKey);
                    rsa256Key.setPrivateKey(privateKey);
                }
            }
        }
    }

    /**
     * 生成token
     */
    public static String getToken(Object data, int field, int amount) {
        try {
            generateRSA256Key();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        Algorithm algorithm = Algorithm.RSA256(rsa256Key.getPrivateKey());
        // 设置过期时间
        Calendar calendar = Calendar.getInstance();
        calendar.add(field, amount);
        return JWT.create()
                // 签发人
                .withIssuer("default")
                // 接收者
                .withAudience("default")
                // token生成时间
                .withIssuedAt(new Date())
                // 过期时间
                .withExpiresAt(calendar.getTime())
                // 主要信息
                .withClaim("data", JSONUtil.toJsonStr(data))
                // 签名算法
                .sign(algorithm);
    }

    /**
     * 验证token
     */
    public static DecodedJWT verifyToken(String token) {
        try {
            // 生成公钥和私钥
            generateRSA256Key();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        // 根据公钥对生成RS256算法对象
        Algorithm algorithm = Algorithm.RSA256(rsa256Key.getPublicKey());
        log.info("PublicKey: {}", rsa256Key.getPublicKey().getPublicExponent());
        // 验证token
        JWTVerifier verifier = JWT
                .require(algorithm)
                .withIssuer("default")
                .build();
        return verifier.verify(token);
    }
}
