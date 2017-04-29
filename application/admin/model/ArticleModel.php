<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class ArticleModel extends Model
{
    protected $name = 'article';
    
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;


    /**
     * 根据搜索条件获取用户列表信息
     * @author [朱鑫飚] [864491238@qq.com]
     */
    public function getArticleByWhere($map, $Nowpage, $limits)
    {
        return $this->field('think_article.*,name')->join('think_article_cate', 'think_article.cate_id = think_article_cate.id')->where($map)->page($Nowpage, $limits)->order('id desc')->select();
    }
    
    
    /**
     * [insertCate 添加分类]
     * @author [朱鑫飚] [864491238@qq.com]
     */
    public function insertCate($param)
    {
        try{
            $result = $this->save($param);
            if(false === $result){             
                return ['code' => -1, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '分类添加成功'];
            }
        }catch( PDOException $e){
            return ['code' => -2, 'data' => '', 'msg' => $e->getMessage()];
        }
    }



    /**
     * [editMenu 编辑分类]
     * @author [朱鑫飚] [864491238@qq.com]
     */
    public function editCate($param)
    {
        try{
            $result = $this->save($param, ['id' => $param['id']]);
            if(false === $result){          
                return ['code' => 0, 'data' => '', 'msg' => $this->getError()];
            }else{
                return ['code' => 1, 'data' => '', 'msg' => '分类编辑成功'];
            }
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }



    /**
     * [getOneMenu 根据分类id获取一条信息]
     * @author [朱鑫飚] [864491238@qq.com]
     */
    public function getOneCate($id)
    {
        return $this->where('id', $id)->find();
    }



    /**
     * [delMenu 删除分类]
     * @author [朱鑫飚] [864491238@qq.com]
     */
    public function delCate($id)
    {
        try{
            $this->where('id', $id)->delete();
            return ['code' => 1, 'data' => '', 'msg' => '删除分类成功'];
        }catch( PDOException $e){
            return ['code' => 0, 'data' => '', 'msg' => $e->getMessage()];
        }
    }

}