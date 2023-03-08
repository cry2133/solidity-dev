

[["0x26425e93c3fc3ce42050d5326d9c8853c9bcb0d862601c9a47fc2daf8d80cf0e","0x04e634123cd360f43f8bd0c410c943abc00ba7e4d64d407862a334b9ea5e7f66"],[["0x165da04b6ed178fc684173c60ca9331b623c9de0f8c02439f6c698036426b559","0x1c2edede7c31e023245f5c7d3675e10f377fdfbc0eafdcdc4dea3c4a8cfe2b3d"],["0x27fef2c53d07100882377e1c525e3f237b658df4d13ad24b74e99ecd7a20c314","0x13f83f99c9affd0d7a450ac9c23c6cdab1226db63f4208193a5e39afb99ee491"]],["0x0da5c38e13436df5899979c30793ae380e9a71544b51e65a94d4245eb7161a19","0x1c286f124cb142837788c7be66218fc08d62a9d50299c11e33c27119b9fde2a4"]]







Remix https://remix.ethereum.org/ 一个写智能合约的网页平台

ZoKrates https://zokrates.github.io/introduction.html 一个方便码农们写含有 zkSNARK 算法的工具箱

本文内容：利用 ZoKrates 生成的代码，写一个证明者证明自己知道某一个哈希值的 pre-iamge （哈希函数的输入值）的 zkSNARK, 将验证者的验证秘钥 verification key 和 验证算法 写到智能合约中，发布到本地虚拟的区块链网络中。

首先开启 Remix IDE, 将我们需要的插件载入到项目中：


左边的小插头是 Plugin Manager 点击后在面板里搜索 zokrates 激活，同样，还需要激活 solidity compiler, deploy & run transactions. 完成之后，面板左边就出现了更多的选项，都是我们的插件。




在文档区创建一个新文件 main.zok


然后我们来到 zokrates 的教程中把教程里的代码贴过来。 这段代码是证明者证明他知道一个特定函数的pre-image (哈希函数的输入值)

import "hashes/sha256/512bitPacked" as sha256packed  
def main(private field a, private field b, private field c, private field d) -> (field):
     h = sha256packed([a, b, c, d])     
     h[0] == 263561599766550617289250058199814760685     
     h[1] == 65303172752238645975888084098459749904     
     return 1
代码内容是将四个输入值 a,b,c,d 一起做哈希，然后将哈希的结果保存在 h[0] 和 h[1] 中， 再拿这两个值和预定好的哈希结果（5 的哈希值 ）作比较 ， 如果都相同，则输出 1。


然后我们来到 ZOKRATES 的插件板块 点击compile 编译


编译后再 setup, 这一步会计算 common reference, proving key, verification key. 花的时间会比较长，耐心等待


然后是产生一个含有·zkSNARK 的验证算法的智能合约， 合约里会包含verification key, 可以点击 Export 右边的箭头在编辑区查看智能合约的代码。

然后输入我们的 witness, 我直接输入了正确的值 也就是5， 然后再点击 Compute 下面的 generate proofd





将proof 复制，等会需要发送到智能合约里去验证. 在这之前我们要编译 刚才export 的智能合约


然后再把合约发布到本地的区块链上，打开DEPLOY &RUN TRANSACTIONS 模块


contract 如图选择，Deploy 之后在下方就能看到交易的信息，展开后把刚才复制的proof 输入，然后就可以验证了


在右下方能看到发送到智能合约的交易，并且验证正确


原文：https://zhuanlan.zhihu.com/p/135800409 Remix +ZoKrates 创建zkSNARK 智能合约

