<?php

namespace app\admin\controller;
use app\admin\Model\ArticleCateModel;
use app\admin\Model\ArticleModel;
use think\Db;

class Article extends Base
{


    /**
     * [index 文章列表]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function index(){

        $key = input('key');
        $map = [];
        if($key&&$key!=="")
        {
            $map['username'] = ['like',"%" . $key . "%"];          
        }       
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = 10;// 获取总条数
        $count = Db::name('article')->where($map)->count();//计算总页面
        $allpage = intval(ceil($count / $limits));
        $article = new ArticleModel();
        $lists = $article->getArticleByWhere($map, $Nowpage, $limits);
        foreach($lists as $k=>$v)
        {
            $lists[$k]['create_time']=date('Y-m-d H:i:s',$v['create_time']);
            $lists[$k]['update_time']=date('Y-m-d H:i:s',$v['update_time']);
        }  
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数
        $this->assign('count', $count); 
        $this->assign('val', $key);
        if(input('get.page'))
        {
            return json($lists);
        }
        return $this->fetch();
    }


    /**
     * [userAdd 添加文章]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function add_article()
    {
        if(request()->isAjax()){

            $param = input('post.');
            //$flag = $user->insertUser($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        return $this->fetch();
    }



    /**
     * [index_cate 分类列表]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function index_cate(){

        $cate = new ArticleCateModel();
        $list = $cate->getAllCate();
        $this->assign('list',$list);
        return $this->fetch();
    }


    /**
     * [add_cate 添加分类]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function add_cate()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $cate = new ArticleCateModel();
            $flag = $cate->insertCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        return $this->fetch();
    }


    /**
     * [edit_cate 编辑分类]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function edit_cate()
    {
        $cate = new ArticleCateModel();

        if(request()->isAjax()){

            $param = input('post.');
            $flag = $cate->editCate($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $this->assign('cate',$cate->getOneCate($id));
        return $this->fetch();
    }


    /**
     * [UserDel 删除分类]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function del_cate()
    {
        $id = input('param.id');
        $cate = new ArticleCateModel();
        $flag = $cate->delCate($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }



    /**
     * [user_state 分类状态]
     * @return [type] [description]
     * @author [田建龙] [864491238@qq.com]
     */
    public function cate_state()
    {
        $id=input('param.id');
        $status = Db::name('article_cate')->where(array('id'=>$id))->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = Db::name('article_cate')->where(array('id'=>$id))->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }
        else
        {
            $flag = Db::name('article_cate')->where(array('id'=>$id))->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    
    }


}