
// Copyright (C) 2025 Riccardo Vacirca
// All rights reserved

#include "mod_helloworld.h"

int helloworld_handler(m_mg_service_t *svc)
{
  const char *msg = apr_psprintf(svc->pool, M_MG_JSON_SUCCESS_FMT, "\"Hello, World!\"");
  m_mg_response_header_set(svc, "Content-Type", "application/json");
  m_mg_response_buffer_set(svc, (void*)(msg), strlen(msg));
  return 200;
}
