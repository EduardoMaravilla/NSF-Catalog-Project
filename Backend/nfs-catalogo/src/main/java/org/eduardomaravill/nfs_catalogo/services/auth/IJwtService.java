package org.eduardomaravill.nfs_catalogo.services.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Map;

public interface IJwtService {
    String generateToken(UserDetails userDetails, Map<String, Object> extraClaims);
    String extractUsername(String jwtToken);
    String extractJwtFromRequest(HttpServletRequest request);
    LocalDateTime extractExpiration(String jwtToken);
}
