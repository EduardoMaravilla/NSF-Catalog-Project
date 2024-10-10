package org.eduardomaravill.nfs_catalogo.services.auth.implement;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.io.Decoders;
import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.services.auth.IJwtService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import javax.crypto.SecretKey;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.Map;

public class JwtServiceImpl implements IJwtService {

    private final Long expirationInMinutes;

    private final String secretKey;

    public JwtServiceImpl(@Value("${security.jwt.token.expiration-in-minutes}") Long expirationInMinutes, @Value("${security.jwt.token.secret-key}") String secretKey) {
        this.expirationInMinutes = expirationInMinutes;
        this.secretKey = secretKey;
    }

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
                .signWith(generateKey(),Jwts.SIG.HS256)
                .compact();
    }

    private SecretKey generateKey(){
        byte[] bytes = Decoders.BASE64.decode(secretKey);
        return Keys.hmacShaKeyFor(bytes);
    }

    @Override
    public String extractUsername(String jwtToken) {
        return extractAllClaims(jwtToken).getSubject();
    }

    private Claims extractAllClaims(String jwtToken){
        return Jwts.parser()
                .verifyWith(generateKey())
                .build()
                .parseSignedClaims(jwtToken)
                .getPayload();
    }

    @Override
    public String extractJwtFromRequest(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (!StringUtils.hasText(authHeader) || !authHeader.startsWith("Bearer ") ) {
            return null;
        }
        return authHeader.substring(7);
    }

    @Override
    public LocalDateTime extractExpiration(String jwtToken) {
        return dateToLocalDateTime(extractAllClaims(jwtToken).getExpiration());
    }

    private Date localDateTimeToDate(LocalDateTime localDate){
        return Date.from(localDate.atZone(ZoneOffset.UTC).toInstant());
    }

    private LocalDateTime dateToLocalDateTime(Date date){
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }
}
