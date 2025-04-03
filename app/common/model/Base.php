<?php
namespace app\common\model;

use think\model\concern\SoftDelete;

class Base extends \think\Model
{
    use SoftDelete;
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    protected $updateTime = 'updated_time';
    protected $createTime = 'created_time';
    protected $deleteTime = 'deleted_time';
    protected $pk = 'id';
    protected $defaultSoftDelete = '0000-00-00 00:00:00';
}
