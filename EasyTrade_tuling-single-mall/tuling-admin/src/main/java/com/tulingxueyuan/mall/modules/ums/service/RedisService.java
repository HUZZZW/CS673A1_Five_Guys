package com.tulingxueyuan.mall.modules.ums.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * redis operation service
 */
public interface RedisService {

    /**
     * save properties
     */
    void set(String key, Object value, long time);

    /**
     *
     * save properties
     */
    void set(String key, Object value);

    /**
     *
     * get properties
     */
    Object get(String key);

    /**
     *
     * delete properties
     */
    Boolean del(String key);

    /**
     *
     * Bulk delete attributes
     */
    Long del(List<String> keys);

    /**
     *
     * set expiration time
     */
    Boolean expire(String key, long time);

    /**
     *
     * get expiration time
     */
    Long getExpire(String key);

    /**
     *
     * Determine whether this attribute exists
     */
    Boolean hasKey(String key);

    /**
     *
     * Increment by delta
     */
    Long incr(String key, long delta);

    /**
     * decrement by delta
     */
    Long decr(String key, long delta);

    /**
     * Get the attributes in the Hash structure
     */
    Object hGet(String key, String hashKey);

    /**
     *
     * Put an attribute into the Hash structure
     */
    Boolean hSet(String key, String hashKey, Object value, long time);

    /**
     *
     * Put an attribute into the Hash structure
     */
    void hSet(String key, String hashKey, Object value);

    /**
     *
     * Get the entire Hash structure directly
     */
    Map<Object, Object> hGetAll(String key);

    /**
     *
     * Directly set the entire Hash structure
     */
    Boolean hSetAll(String key, Map<String, Object> map, long time);

    /**
     *
     * Directly set the entire Hash structure
     */
    void hSetAll(String key, Map<String, ?> map);

    /**
     *
     * Delete the attribute in the Hash structure
     */
    void hDel(String key, Object... hashKey);

    /**
     * Determine whether the attribute exists in the Hash structure
     */
    Boolean hHasKey(String key, String hashKey);

    /**
     *
     * Attribute increment in Hash structure
     */
    Long hIncr(String key, String hashKey, Long delta);

    /**
     *
     * Attribute decrement in Hash structure
     */
    Long hDecr(String key, String hashKey, Long delta);

    /**
     *
     * Get the Set structure
     */
    Set<Object> sMembers(String key);

    /**
     * Add properties to the Set structure
     */
    Long sAdd(String key, Object... values);

    /**
     * Add properties to the Set structure
     */
    Long sAdd(String key, long time, Object... values);

    /**
     *
     * Whether it is an attribute in Set
     */
    Boolean sIsMember(String key, Object value);

    /**
     *
     * Get the length of the Set structure
     */
    Long sSize(String key);

    /**
     *
     * Delete the attributes in the Set structure
     */
    Long sRemove(String key, Object... values);

    /**
     * Get the attributes in the List structure
     */
    List<Object> lRange(String key, long start, long end);

    /**
     *
     * Get the length of the List structure
     */
    Long lSize(String key);

    /**
     *
     * Get the attributes in the List according to the index
     */
    Object lIndex(String key, long index);

    /**
     *
     * Add attributes to the List structure
     */
    Long lPush(String key, Object value);

    /**
     *
     * Add attributes to the List structure
     */
    Long lPush(String key, Object value, long time);

    /**
     *
     * Add properties in batches to the List structure
     */
    Long lPushAll(String key, Object... values);

    /**
     *
     * Add properties in batches to the List structure
     */
    Long lPushAll(String key, Long time, Object... values);

    /**
     * Remove property from List structure
     */
    Long lRemove(String key, long count, Object value);
}