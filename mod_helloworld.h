
// Copyright (C) 2025 Riccardo Vacirca
// All rights reserved

#ifndef MOD_HELLOWORLD_H
#define MOD_HELLOWORLD_H

#include "microservice.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Basic example handler that returns a simple "Hello, World!" message
 */
int helloworld_handler(m_mg_service_t *svc);

#ifdef __cplusplus
}
#endif

#endif /* MOD_HELLOWORLD_H */
