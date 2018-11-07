package org.qtproject.SimpleWeather;

import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import org.qtproject.qt5.android.bindings.QtActivity;
import org.qtproject.qt5.android.bindings.QtApplication;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.AdListener;

public class QtAdMobActivity extends QtActivity {

    // Private variables
    private AdView mAdView;
    private ViewGroup mViewGroup;

    // Singals
    private static native void onBannerLoaded();

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
    }
    @Override
    public void onResume() {
        super.onResume();

        // Resume the AdView.
        if ( mAdView != null) mAdView.resume();
    }
    @Override
    public void onPause() {
        super.onPause();

        // Pause the AdView.
        if ( mAdView != null) mAdView.pause();
    }
    @Override
    public void onDestroy() {
        super.onDestroy();

        // Destroy the AdView.
        if ( mAdView != null) mAdView.destroy();
    }

    public void InitializeBanner() {
        final QtAdMobActivity self = this;
        runOnUiThread(new Runnable()
        {
            public void run()
            {
                // Confirm AdView has already been available
                if (mAdView != null) return;

                // Initialize AdView with visible display
                mAdView = new AdView(self);
                mAdView.setVisibility(View.VISIBLE);

                // Get Android Window Root View
                View view = getWindow().getDecorView().getRootView();
                if (view instanceof ViewGroup)
                {
                    mViewGroup = (ViewGroup) view;

                    // Add a RelativeLayout overlay, make it fit the whole window
                    final RelativeLayout relativeLayout = new RelativeLayout(self);
                    RelativeLayout.LayoutParams rlp = new RelativeLayout.LayoutParams(
                            RelativeLayout.LayoutParams.MATCH_PARENT,
                            RelativeLayout.LayoutParams.MATCH_PARENT);

                    // Fit the adView to the top of RelativeLayout screen
                    RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(
                            RelativeLayout.LayoutParams.WRAP_CONTENT, RelativeLayout.LayoutParams.WRAP_CONTENT);
                    lp.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                    lp.addRule(RelativeLayout.CENTER_HORIZONTAL);
                    mAdView.setLayoutParams(lp);
                    relativeLayout.setLayoutParams(rlp);

                    // Add the adView to the RelativeLayout
                    relativeLayout.addView(mAdView);
                    mViewGroup.addView(relativeLayout);

                    mAdView.setAdListener(new AdListener() {
                        // Add listener when an ad finishes loading
                        public void onAdLoaded() {
                            onBannerLoaded();
                        }
                    });
                }
            }
        });
    }

    public void SetBannerSize(final int size)
    {
        final QtAdMobActivity self = this;
        runOnUiThread(new Runnable()
        {
            public void run()
            {
                AdSize adSize = AdSize.BANNER;
                switch(size)
                {
                    case 0:
                        adSize = AdSize.BANNER;
                    break;
                    case 1:
                        adSize = AdSize.FLUID;
                    break;
                    case 2:
                        adSize = AdSize.FULL_BANNER;
                    break;
                    case 3:
                        adSize = AdSize.LARGE_BANNER;
                    break;
                    case 4:
                        adSize = AdSize.LEADERBOARD;
                    break;
                    case 5:
                        adSize = AdSize.MEDIUM_RECTANGLE;
                    break;
                    case 6:
                        adSize = AdSize.SEARCH;
                    break;
                    case 7:
                        adSize = AdSize.SMART_BANNER;
                    break;
                    case 8:
                        adSize = AdSize.WIDE_SKYSCRAPER;
                    break;
                };

                mAdView.setAdSize(adSize);
            }
        });
    }

    public void SetBannerUnitId(final String adId)
    {
        runOnUiThread(new Runnable()
        {
            public void run()
            {
                mAdView.setAdUnitId(adId);
            }
        });
    }

    public void LoadBanner() {
        runOnUiThread(new Runnable()
        {
            public void run()
            {
                AdRequest.Builder adRequest = new AdRequest.Builder();
                mAdView.loadAd(adRequest.build());
            }
        });
    }
}
