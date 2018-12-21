
##简介
根据dict字典生成对象。 适用webview和push推送时，根据后台传回字典实现动态跳转。  
###场景1：从apns推送来的的信息，根据服务端推送过来的数据规则，跳转到对应的控制器。  
###场景2:点击webview中某条链接时，跳转到原生ViewController中继续机型后续操作。  
要实现以上的产品逻辑， 通常都需要前后端约定一些规则实现跳转。  
弊端很明显， 需要开发前就约定很多规则， 并且不一定能覆盖所有逻辑。  
本项目就是为了实现这种逻辑，只要根据后台返回的数据则可实现万能跳转。

##使用
可以直接根据字典规则跳转
'' [D3Generator createViewControllerWithDictAndPush:data];

可以生成控制器自行跳转
'' UIViewController *vc = [D3Generator createViewControllerWithDict:data];

data的格式如：
{
'className':"xxxxVC",
'name':'D3',
}
只有className参数是必须的， 这个字段决定了要生成的控制器ViewController
