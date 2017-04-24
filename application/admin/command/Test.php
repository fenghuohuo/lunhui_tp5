<?php
namespace app\admin\command;

use app\admin\model\TradeRecordModel;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class Test extends Command
{
    protected function configure()
    {
        $this->setName('test')->setDescription('Here is the remark ');
    }

    protected function execute(Input $input, Output $output)
    {
        $output->writeln("TestCommand:");

        $uid = 120295;
        $time = time();
        $action = 1;
        $type = 1;
        $tradeNo = 120295;

        while (true) {
            $time = $time + 1;
            $dateline = date("Y-m-d H:i:s", $time);
            $uid = $uid + 1;
            $tradeNo = $tradeNo + 1;
            $test = new TradeRecordModel();
            $test->data([
                'uid' => $uid,
                'dateline' => $dateline,
                'action' => $action,
                'type' => $type,
                'tradeNo' => $tradeNo,
            ]);
            $test->save();
            $output->writeln($test->id);
            if ($test->id > 1000000000) {
                break;
            }
        }

    }
}