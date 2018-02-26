# AppBestPractice
<font color=#228B22>这篇文章可能有些标题党，方案有很多，我只是把我认为最简单的方案告诉你，想吐槽就吐吧</font> 

### 应用升级
应用升级使用的是[腾讯Bugly](https://bugly.qq.com/v2/),这个看文档就可以搞定，没什么说的，看图吧!

<img src="https://github.com/ainiyiwan/AppBestPractice/blob/master/png/update.png" width = "300"/>

### 应用加固 自动签名 多渠道打包
应用加固和多渠道打包，[乐固](https://cloud.tencent.com/product/ms)提供了[一键式解决方案](http://console.qcloud.com/legu/myapplication/index)，具体使用请自行下载，里面有详细说明

![](https://github.com/ainiyiwan/AppBestPractice/blob/master/png/legu.jpg)

![](https://github.com/ainiyiwan/AppBestPractice/blob/master/png/channel.jpg)

### 渠道信息获取
乐固一键式多渠道打包需要在AndroidManifest中配置以下代码
```java
<meta-data
            android:name="channel"
            android:value="默认值"/>
```
那么渠道信息的获取就变的很简单了，直接在代码中读取channel的值，废话不多说，上代码
```java
    /**
     * 　获取渠道号
     *
     * @return
     */
    public String getChannelName() {
        ApplicationInfo appInfo = null;
        try {
            appInfo = this.getPackageManager()
                    .getApplicationInfo(getPackageName(),
                            PackageManager.GET_META_DATA);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        String msg=appInfo.metaData.getString("channel");
        return msg;
    }
```
<img src="https://github.com/ainiyiwan/AppBestPractice/blob/master/png/default.png" width = "300"/> <img src="https://github.com/ainiyiwan/AppBestPractice/blob/master/png/huawei.png" width = "300"/>

### 完结
老规矩，如果你遇到任何问题，请给我提issue，你遇到的问题，我都遇到过。

