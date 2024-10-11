package org.eduardomaravill.nfs_catalogo.services.auth.implement;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.services.auth.IJwtService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Base64;
import java.util.Date;
import java.util.Map;
import java.util.Scanner;

@Service
public class JwtServiceRsaImpl implements IJwtService {

    @Value("classpath:jwtKeys/private_key.pem")
    private Resource privateKeyResource;

    @Value("classpath:jwtKeys/public_key.pem")
    private Resource publicKeyResource;

    @Value("${security.jwt.token.expiration-in-minutes}")
    private Long expirationInMinutes;

    @Value("${security.jwt.token.email.expiration-in-minutes}")
    private Long expirationEmailInMinutes;

    @Override
    public String generateToken(UserDetails userDetails, Map<String, Object> extraClaims) {
        LocalDateTime issuedAt = LocalDateTime.now();
        LocalDateTime expiresAt = issuedAt.plusMinutes(expirationInMinutes);
        return Jwts.builder()
                .header()
                .type("JWT")
                .and()
                .subject(userDetails.getUsername())
                .issuedAt(localDateTimeToDate(issuedAt))
                .expiration(localDateTimeToDate(expiresAt))
                .claims(extraClaims)
                .signWith(getPrivateKey(), Jwts.SIG.RS256)
                .compact();
    }

    @Override
    public String generateTokenEmailValidate(UserDetails userDetails, Map<String, Object> extraClaims) {
        LocalDateTime issuedAt = LocalDateTime.now();
        LocalDateTime expiresAt = issuedAt.plusMinutes(expirationEmailInMinutes);
        return Jwts.builder()
                .header()
                .type("JWT")
                .and()
                .subject(userDetails.getUsername())
                .issuedAt(localDateTimeToDate(issuedAt))
                .expiration(localDateTimeToDate(expiresAt))
                .claims(extraClaims)
                .signWith(getPrivateKey(), Jwts.SIG.RS256)
                .compact();
    }

    @Override
    public String extractUsername(String jwtToken) {
        return extractAllClaims(jwtToken).getSubject();
    }

    @Override
    public String extractJwtFromRequest(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (!StringUtils.hasText(authHeader) || !authHeader.startsWith("Bearer ")) {
            return null;
        }
        return authHeader.substring(7);
    }

    @Override
    public LocalDateTime extractExpiration(String jwtToken) {
        return dateToLocalDateTime(extractAllClaims(jwtToken).getExpiration());
    }

    private Claims extractAllClaims(String jwtToken) {
        return Jwts.parser()
                .verifyWith(getPublicKey())
                .build()
                .parseSignedClaims(jwtToken)
                .getPayload();
    }

    private PrivateKey getPrivateKey() {
        try (InputStream inputStream = privateKeyResource.getInputStream()) {
            String privateKeyPEM = new Scanner(inputStream, StandardCharsets.UTF_8).useDelimiter("\\A").next()
                    .replace("-----BEGIN PRIVATE KEY-----", "")
                    .replace("-----END PRIVATE KEY-----", "")
                    .replaceAll("\\s+", "");
            byte[] keyBytes = Base64.getDecoder().decode(privateKeyPEM);
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePrivate(keySpec);
        } catch (Exception e) {
            throw new IllegalStateException("Could not load private key");
        }
    }

    private PublicKey getPublicKey() {
        try (InputStream inputStream = publicKeyResource.getInputStream()) {
            String publicKeyPEM = new Scanner(inputStream, StandardCharsets.UTF_8).useDelimiter("\\A").next()
                    .replace("-----BEGIN PUBLIC KEY-----", "")
                    .replace("-----END PUBLIC KEY-----", "")
                    .replaceAll("\\s+", "");
            byte[] keyBytes = java.util.Base64.getDecoder().decode(publicKeyPEM);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePublic(keySpec);
        } catch (Exception e) {
            throw new IllegalStateException("Could not load public key");
        }
    }

    private Date localDateTimeToDate(LocalDateTime localDate) {
        return Date.from(localDate.atZone(ZoneOffset.UTC).toInstant());
    }

    private LocalDateTime dateToLocalDateTime(Date date) {
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }
}
