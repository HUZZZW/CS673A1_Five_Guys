package com.tulingxueyuan.mall.modules.ums.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * redis operator Service
 * Created by macro on 2020/3/3.
 */
public interface RedisService {

    /**
     * Save attribute
     */
    void set(String key, Object value, long time);

    /**
     * Save attribute
     */
    void set(String key, Object value);

    /**
     * get property
     */
    Object get(String key);

    /**
     * Delete attribute
     */
    Boolean del(String key);

    /**
     * Batch delete attribute
     */
    Long del(List<String> keys);

    /**
     * Set expiration time
     */
    Boolean expire(String key, long time);

    /**
     * Acquire expiration time

     */
    Long getExpire(String key);

    /**
     * Determines whether the attribute exists

     */
    Boolean hasKey(String key);

    /**
     * follow delta increase
     */
    Long incr(String key, long delta);

    /**
     * follow delta decrease
     */
    Long decr(String key, long delta);

    /**
     * Gets the properties in the Hash structure
     */
    Object hGet(String key, String hashKey);

    /**
     * Puts a property into the Hash structure
     */
    Boolean hSet(String key, String hashKey, Object value, long time);

    /**
     * Puts a property into the Hash structure
     */
    void hSet(String key, String hashKey, Object value);

    /**
     * Get the entire Hash structure directly
     */
    Map<Object, Object> hGetAll(String key);

    /**
     * Set the entire Hash structure directly
     */
    Boolean hSetAll(String key, Map<String, Object> map, long time);

    /**
     * Set the entire Hash structure directly
     */
    void hSetAll(String key, Map<String, ?> map);

    /**
     * Delete attributes in the Hash structure
     */
    void hDel(String key, Object... hashKey);

    /**
     * Determines whether the attribute exists in the Hash structure
     */
    Boolean hHasKey(String key, String hashKey);

    /**
     * Attribute increment in the Hash structure
     */
    Long hIncr(String key, String hashKey, Long delta);

    /**
     * Attribute decrement in Hash structure
     */
    Long hDecr(String key, String hashKey, Long delta);

    /**
     * Get set construction
     */
    Set<Object> sMembers(String key);

    /**
     * Adds properties to the Set structure
     */
    Long sAdd(String key, Object... values);

    /**
     * Adds properties to the Set structure
     */
    Long sAdd(String key, long time, Object... values);

    /**
     * Whether it is an attribute in a Se
     */
    Boolean sIsMember(String key, Object value);

    /**
     * Gets the length of the Set structure
     */
    Long sSize(String key);

    /**
     * Delete an attribute from a Set structure
     */
    Long sRemove(String key, Object... values);

    /**
     * Gets the properties in the List structure
     */
    List<Object> lRange(String key, long start, long end);

    /**
     * Gets the length of the List structure
     */
    Long lSize(String key);

    /**
     * Gets the properties in the List according to the index
     */
    Object lIndex(String key, long index);

    /**
     * Add properties to the List structure
     */
    Long lPush(String key, Object value);

    /**
     * Add properties to the List structure
     */
    Long lPush(String key, Object value, long time);

    /**
     * Add attributes in batches to the List structure
     */
    Long lPushAll(String key, Object... values);

    /**
     * Add attributes in batches to the List structure
     */
    Long lPushAll(String key, Long time, Object... values);

    /**
     * Removes properties from the List structure
     */
    Long lRemove(String key, long count, Object value);
}