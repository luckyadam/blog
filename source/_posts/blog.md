title: 使用Github Pages和Hexo搭建属于自己的站点
date: 2015-01-13 20:05:46
tags: Github Hexo
---
一直以来都想开始自己写点博客，积累点东西，这个想法存在很久了，无奈拖延症实在逆天，直到2014年末了也迟迟未能实现。其实之前也有过好几个博客，有博客园的，有Lofter的，还有自己用WordPress搭的，但俱是无疾而终，域名都过期未续了，再也无法访问了，终究还是太懒。最近在探索全球最大的同性交友社区[GitHub](https://github.com/),于是乘机想再开一个新的博客，想用来写点字。博客还是要有的，万一想要写了呢~呵呵哒~

以下给大家共勉~
> My goal for 2015 is to accomplish the goals of 2014 which I should have done in 2013 because I made a promise in 2012 and planned in 2011

![image](http://ww3.sinaimg.cn/large/49320207jw1eo8607jhycj208w05k3ys.jpg)

## Github Pages

![image](http://ww1.sinaimg.cn/large/49320207jw1eo86vh0dwfj20go06gweo.jpg)

### 为什么要用嘞

使用Github Pages来创建自己的博客的原因很简单：

* 穷，买不起空间
* 版本控制天然Github，灰常方便
* 纯静态，没有繁琐的配置，作为前端屌丝表示很开心:-)

Github Pages介绍地址[https://pages.github.com/](https://pages.github.com/)，如果不想看英文，就继续往下看吧~~

### Github Pages介绍

首先要知道Github提供了两种类型的站点，**User or organization pages**和**Project pages**。这两种主页的创建方式有很大的不同，在开始做之前我们必须要区分开来，否则会踩坑。

* __User or organization pages__，或者就叫个人或组织主页吧，它依赖一个比较特殊的github repo来托管代码，首先，必须使用你自己的用户名来给这个repo命名，比如，我的github用户名叫luckyadam，那么这个repo的名字必须是`luckyadam.github.io`；再者这个项目创建好后将会以`master`分支的代码来构建站点，构建完后的站点名字是`http(s)://<username>.github.io`，所以如果`master`分支里面没有`index.html`的话会404哦。

* __Project pages__，或者就叫项目主页吧，与个人主页不同的是，项目主页的代码将会和项目的代码存在于同一个repo中作为一个完整的项目，所以，你可以创建无数个项目主页，但个人主页却只能有一个。如果是个人账户，项目主页的url将会是`http(s)://<username>.github.io/<projectname>`，如果是组织账户那么地址是`http(s)://<orgname>.github.io/<projectname>`。项目主页将会以repo的`gh-pages`分支来构建站点。

讲了这么多枯燥的东西( '-ωก̀ )小伙伴肯定看得不开心了，那么让我们来开始动手尝试一下吧！

当然啦，首先你得有一个Github账号，如果你习惯用终端来使用git的话，别忘了手动生成一个ssh key来让github和你的电脑之间建立信任[Generating SSH keys](https://help.github.com/articles/generating-ssh-keys/)，好处你应该懂的，如果你是客户端用户，那就当我是在废话了。

#### 来愉快构建一个个人主页吧！

首先创建一个repository

![image](http://ww2.sinaimg.cn/large/49320207jw1eo882u1w4cj215s05wjss.jpg)

然后填写相关内容啦，记得名称必须是`<username>.github.io`哟

![image](http://ww2.sinaimg.cn/large/49320207jw1eo884f580hj21980rwaf8.jpg)

然后可以在Repo的设置里可以看到这样一个提示

![image](http://ww3.sinaimg.cn/large/49320207jw1eo886esr4sj212w0fogp0.jpg)

好啦，这样就创建成功啦，让我们打开[http://luckyadam.github.io/](http://luckyadam.github.io/)来看看吧，真是好期待的呢

![image](http://ww1.sinaimg.cn/large/49320207jw1eo88b639dvj205o06qwes.jpg)

![image](http://ww1.sinaimg.cn/large/49320207jw1eo888zi5vvj211q0r2773.jpg)

**What the f*ck!!!** ![image](http://ww3.sinaimg.cn/large/49320207jw1eo88eqwn45j206404j0sr.jpg)

容老夫想一想，哦，对了！![image](http://ww1.sinaimg.cn/large/49320207jw1eo88fuemqjj203i02ydfq.jpg)

许是忘了加`index.html`了，且让我加上一个试上一试，首先将项目clone下来

```
$ git clone git@github.com:luckyadam/luckyadam.github.io.git
$ cd luckyadam.github.io
```

用vi新增一个`index.html`文件，内容自己看着办啦，然后push到``master``。

```
$ git add .
$ git commit -m 'add index.html'
$ git push [origin] [master]
```
    
接着看看[http://luckyadam.github.io/](http://luckyadam.github.io/)，哈哈，发现已经有了~

![image](http://ww4.sinaimg.cn/large/49320207jw1eo8cl1ro3hj21e80gqgnm.jpg)

现在我们已经创建好一个个人主页啦！

> Ps:首次build需要过大约10分钟后才能看到效果，并且无论有没有成功，github都会往你的邮箱中发送一封通知邮件哦

#### 再来愉快地创建一个项目主页吧！

创建项目主页的步骤和创建个人主页有点类似，创建一个普通的Repo，比如我创建了一个叫[blog](https://github.com/luckyadam/blog)的Repo，给这个Repo创建一个`gh-pages`分支，然后将静态页面push到这个分支就可以了，当然`index.html`是必须的。

使用git init初始化一个本地仓库，增加静态文件

```
#初始化一个本地仓库
$ git init
```
 
经所有改动`add`后`commit`，随后直接push到Repo的`gh-pages`分支

```
$ git push --force --quiet https://github.com/luckyadam/blog.git master:gh-pages
```
    
## HEXO

### 简单说说

Github Pages默认是纯静态的方案，但我们总不能每次都手写一个html文件，然后发布吧，那得多蛋疼啊，所以我们会想，要是能有一个软件，我们只用关注写文章，然后这个软件会将我们的文章根据一个模板输出静态html文件，然后我们将它发布出去，这样多爽啊~事实上，市面上已经有了很多这种静态博客生成工具了，比如jekyll、hexo等。Github推荐使用的是jekyll，我使用的是hexo，为什么呢，因为任性，就是这样。

![image](http://ww3.sinaimg.cn/large/49320207jw1eo89ray0s2j203j00ut8k.jpg)

[Hexo](http://hexo.io/)是一个非常优秀简洁的博客生成工具，它支持[Markdown](http://www.markdown.cn/)，并且有很多的主题和插件可供选择，可以很快地构建出一个看起来不错的博客。并且通过学习官方文档，构建属于自己的主题也非常简单，总而言之，就是用起来挺爽。

> 安装Hexo前的准备
>
  * [Git](http://git-scm.com/) _这个当然已经有了，要不然前面我们在忙活什么_
  * [NodeJs](http://nodejs.org/) _前端狗说，node你都不用，你太low了_
  
然后我们就可以安装hexo了

```
# mac用户可能需要加上sudo来执行
$ npm i -g hexo
```
我们可以在本地随意找个目录，初始化一个Hexo项目，并且不要忘了安装项目依赖

```
#初始化安装
$ hexo init
#安装依赖
$ npm i
```
这样在这个目录下会出现如下目录结构

    .
    ├── _config.yml
    ├── package.json
    ├── scaffolds
    |   ├── draft.md
    |   ├── page.md
    |   ├── post.md
    |   └── photo.md
    ├── source
    |   ├── _drafts
    |   └── _posts
    └── themes

* ___config.html__ 是一个YMAL文件，它是Hexo的配置文件，在这个配置文件中我们可以配置网站的标题，作者，网站主题等，具体的配置项，可以参见[Hexo配置](http://hexo.io/docs/configuration.html)
* __scaffolds__目录中存放着_draft.md_，_page.md_，_post.md_，_photo.md_ 四个模板文件用于生成不同类型的静态页面
* __source__目录中存放着用户已经写好的文件，比如用户写的post类型的文件就存放在 `source/_posts` 中
* themes中存放用到得主题

### 书写文章

我们可以按照以下步骤来新建一篇文章，并且在本地预览

```
# layout 是指文件的类型，如果是要写一篇博文，可以使用post，title是文件标题
# 执行完这个命令后会有提示：
# [info] File created at /Users/username/project/blog/source/_<layout>s/<title>.md
$ hexo new [layout] <title>

# 写完文章保存后，可以在本地预览
$ hexo server
```
### 主题

我觉得主题是大家比较关心的东西，毕竟谁都希望自己的博客能非常漂亮嘛~

我们可以在[这里](https://github.com/hexojs/hexo/wiki/Themes)找到hexo的各种主题，这里有各种款式，各种姿势，总有一款能满足你！

选择完自己喜欢的主题后，我们可以通过git clone到自己的themes目录下，由于我不想添加git submodules，并且没有更新需求，我clone完后就把主题的.git删了，这样省事很多啊。下载完主题后在项目的___config.yml__文件中将 `theme` 改成想要的主题名字就行了。

当然机智的你会发现在主题的目录下也有一个___config.yml__的文件，这个文件是当前主题的配置文件，你可以按照自己的喜好随意调教，同时你也可以修改主题的其他文件，来打造成满足自己口味的风格。

### 生成静态文件

我们可以通过下面命令来生成静态文件

```
$ hexo generate
```

### 发布站点

做完以上配置和操作，并写（bie）出自己的第一篇博客后当然是要优雅地发布到自己的站点，让大家观摩观摩了，这也是非常easy的。

通过修改项目的__config.yml__文件中的__deploy__配置，可以轻松实现发布。

    deploy:
      type: github
      repo: <repository url>
      branch: [branch]
      message: [message]
 
如果你创建的是**个人主页**，那么这里的配置中 `branch` 为 `master`，如果是**项目主页**那么为`gh-pages`

随后通过执行下面一条命令就能直接发布了

```
$ hexo deploy
```
或者__生成静态文件__和__发布__二合一通过下面任何一条命令

```
$ hexo generate --deploy
$ hexo deploy --generate
```

当然你也可以自己cd 进入public目录，然后将里面内容push到Repo的 `gh-pages` 分支上去，就是很蛋疼啦。

发布完后通过访问自己的Github Pages，就能看到效果啦，本博就是这样生成的。
