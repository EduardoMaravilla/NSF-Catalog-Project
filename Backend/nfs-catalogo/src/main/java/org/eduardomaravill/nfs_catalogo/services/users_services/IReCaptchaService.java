package org.eduardomaravill.nfs_catalogo.services.users_services;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;

public interface IReCaptchaService {
    ValidTokenResponse verifyReCaptcha(String token);
}
