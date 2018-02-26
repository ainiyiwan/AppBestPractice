#常规混淆
# 代码混淆压缩比，在0~7之间
 -optimizationpasses 5

 # 混合时不使用大小写混合，混合后的类名为小写
 -dontusemixedcaseclassnames

 # 指定不去忽略非公共库的类
 -dontskipnonpubliclibraryclasses

 # 不做预校验，preverify是proguard的四个步骤之一，Android不需要preverify，去掉这一步能够加快混淆速度。
 -dontpreverify

 -verbose

 #google推荐算法
 -optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*

 # 避免混淆Annotation、内部类、泛型、匿名类
 -keepattributes *Annotation*,InnerClasses,Signature,EnclosingMethod

 # 重命名抛出异常时的文件名称
 -renamesourcefileattribute SourceFile

 # 抛出异常时保留代码行号
 -keepattributes SourceFile,LineNumberTable

 # 处理support包
 -dontnote android.support.**
 -dontwarn android.support.**

 # 保留四大组件，自定义的Application等这些类不被混淆
 -keep public class * extends android.app.Activity
 -keep public class * extends android.app.Appliction
 -keep public class * extends android.app.Service
 -keep public class * extends android.content.BroadcastReceiver
 -keep public class * extends android.content.ContentProvider
 -keep public class * extends android.preference.Preference
 -keep public class com.android.vending.licensing.ILicensingService

 # 保留本地native方法不被混淆
 -keepclasseswithmembernames class * {
     native <methods>;
 }

 # 保留枚举类不被混淆
 -keepclassmembers enum * {
     public static **[] values();
     public static ** valueOf(java.lang.String);
 }

 # 保留Parcelable序列化类不被混淆
 -keep class * implements android.os.Parcelable {
     public static final android.os.Parcelable$Creator *;
 }

 #第三方jar包不被混淆
 -keep class com.github.test.** {*;}

 #保留自定义的Test类和类成员不被混淆
 -keep class com.lily.Test {*;}
 #保留自定义的xlog文件夹下面的类、类成员和方法不被混淆
 -keep class com.test.xlog.** {
     <fields>;
     <methods>;
 }

 #assume no side effects:删除android.util.Log输出的日志
 -assumenosideeffects class android.util.Log {
     public static *** v(...);
     public static *** d(...);
     public static *** i(...);
     public static *** w(...);
     public static *** e(...);
 }

 #保留Keep注解的类名和方法
 -keep,allowobfuscation @interface android.support.annotation.Keep
 -keep @android.support.annotation.Keep class *
 -keepclassmembers class * {
     @android.support.annotation.Keep *;
 }

#bugly混淆
-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}
-keep class android.support.**{*;}