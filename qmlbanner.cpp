#include "qmlbanner.h"
#include <QAndroidJniObject>
#include <qpa/qplatformnativeinterface.h>
#include <QGuiApplication>

#ifdef __cplusplus
extern "C" {
#endif

// Listener when Java calls onBannerLoaded signal
JNIEXPORT void JNICALL Java_org_qtproject_SimpleWeather_QtAdMobActivity_onBannerLoaded(JNIEnv *env, jobject thiz)
{
    Q_UNUSED(env)
    Q_UNUSED(thiz)

    // Emit to QML app by calling bannerLoaded signal
    emit QmlBanner::Instances()->bannerLoaded();
}

#ifdef __cplusplus
}
#endif

// Global variable to keep instance of class
static QmlBanner *mQMLBanner = NULL;

// Implement Instances() method
QmlBanner* QmlBanner::Instances()
{
    return mQMLBanner;
}

// Implement initialize method
QmlBanner::QmlBanner()
{
    // Update global instance
    mQMLBanner = this;

    // Create Android Activity on Qt
    QPlatformNativeInterface* interface = QGuiApplication::platformNativeInterface();
    jobject activity = (jobject)interface->nativeResourceForIntegration("QtActivity");
    if (activity)
    {
        m_Activity = new QAndroidJniObject(activity);
    }

    // Call InitializeBanner method of Java
    m_Activity->callMethod<void>("InitializeBanner");
}

void QmlBanner::setUnitId(const QString& unitId)
{
    if(m_Activity != 0)
    {
        QAndroidJniObject param1 = QAndroidJniObject::fromString(unitId);
        // Call SetBannerUnitId method of Java
        m_Activity->callMethod<void>("SetBannerUnitId", "(Ljava/lang/String;)V", param1.object<jstring>());
    }
}

void QmlBanner::setBannerSize(BannerSizes size)
{
    if(m_Activity != 0)
    {
        // Call SetBannerSize method of Java
        m_Activity->callMethod<void>("SetBannerSize", "(I)V", (int)size);
    }
}

void QmlBanner::loadBanner()
{
    if(m_Activity != 0)
    {
        // Call LoadBanner method of Java
        m_Activity->callMethod<void>("LoadBanner");
    }
}
