package zy.com.jiagu;

import android.app.Application;

import com.tencent.bugly.Bugly;

/**
 * Created by Administrator on 2018/2/25.
 */

public class App extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        Bugly.init(getApplicationContext(), "3a617759a7", true);
    }
}
