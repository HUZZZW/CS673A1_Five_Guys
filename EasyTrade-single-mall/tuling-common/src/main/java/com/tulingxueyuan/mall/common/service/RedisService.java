package com.tulingxueyuan.mall.common.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * redis Operator Service
 * Created by macro on 2020/3/3.
 */
public interface RedisService {

    /**
     * Saving properties
     */
    void set(String key, Object value, long time);

    /**
     * Saving properties
     */
    void set(String key, Object value);

    /**
     * get property
     */
    Object get(String key);

    /**
     * Removing attributes
     */
    Boolean del(String key);

    /**
     * Deleting attributes in bulk
     */
    Long del(List<String> keys);

    /**
     * Set an expiration time
     */
    Boolean expire(String key, long time);

    /**
     * Getting the expiration time
     */
    Long getExpire(String key);

    /**
     * Determines if the property is present
     */
    Boolean hasKey(String key);

    /**
     * Follow delta increase
     */
    Long incr(String key, long delta);

    /**
     * Follow delta decrease
     */
    Long decr(String key, long delta);

    /**
     * Get the attributes in the Hash structure
     */
    Object hGet(String key, String hashKey);

    /**
     * Put an attribute into the Hash structure
     */
    Boolean hSet(String key, String hashKey, Object value, long time);

    /**
     * Put an attribute into the Hash structure
     */
    void hSet(String key, String hashKey, Object value);

    /**
     * Get the whole Hash structure directly
     */
    Map<Object, Object> hGetAll(String key);

    /**
     * Set up the entire Hash structure directly
     */
    Boolean hSetAll(String key, Map<String, Object> map, long time);

    /**
     * Set up the entire Hash structure directly
     */
    void hSetAll(String key, Map<String, ?> map);

    /**
     * Delete the attributes in the Hash structure
     */
    void hDel(String key, Object... hashKey);

    /**
     * Determine whether there is the attribute in the Hash structure
     */
    Boolean hHasKey(String key, String hashKey);

    /**
     * The attributes in a Hash structure are incremented
     */
    Long hIncr(String key, String hashKey, Long delta);

    /**
     * The attributes are decreasing in the Hash structure
     */
    Long hDecr(String key, String hashKey, Long delta);

    /**
     * Get Settings "Structure"
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
     * Is a property in Set
     */
    Boolean sIsMember(String key, Object value);

    /**
     * Retrieves the length of the Set structure
     */
    Long sSize(String key);

    /**
     * Removes the attribute from the Set structure
     */
    Long sRemove(String key, Object... values);

    /**
     * Get the properties in the List structure
     */
    List<Object> lRange(String key, long start, long end);

    /**
     * Gets the length of the List structure
     */
    Long lSize(String key);

    /**
     * Get the attributes from the List based on the index
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
     * Batch adds attributes to a List structure
     */
    Long lPushAll(String key, Object... values);

    /**
     * Batch adds attributes to a List structure
     */
    Long lPushAll(String key, Long time, Object... values);

    /**
     * Removes the attribute from the List structure
     */
    Long lRemove(String key, long count, Object value);
}