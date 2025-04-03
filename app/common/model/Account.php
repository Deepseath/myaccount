<?php
namespace app\common\model;

use think\Model;

class Account extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'account';

    // 设置主键
    protected $pk = 'id';

    // 设置当前模型的数据库连接
    protected $connection = 'mysql';

    // 设置字段信息
    protected $schema = [
        'id' => 'int',
        'amount' => 'decimal',
        'description' => 'string',
        'category' => 'string',
        'date' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];
}