package com.tulingxueyuan.mall.config;

import com.tulingxueyuan.mall.common.config.BaseRedisConfig;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;

/**
 *
 * Redis configuration class
 */
@EnableCaching
@Configuration
public class RedisConfig extends BaseRedisConfig {

}
