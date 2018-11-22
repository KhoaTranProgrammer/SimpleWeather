#ifndef QMLBANNER_H
#define QMLBANNER_H

#include <QObject>

#ifdef Q_OS_ANDROID
class QAndroidJniObject;
#endif

class QmlBanner : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString unitId WRITE setUnitId)
    Q_PROPERTY(BannerSizes bannerSize WRITE setBannerSize)

public:
    // Banner sizes
    enum BannerSizes
    {
        BANNER = 0,
        FLUID,
        FULL_BANNER,
        LARGE_BANNER,
        LEADERBOARD,
        MEDIUM_RECTANGLE,
        SEARCH,
        SMART_BANNER,
        WIDE_SKYSCRAPER
    };
    Q_ENUM(BannerSizes)

    QmlBanner();

    // Add static method to get instance of class
    static QmlBanner* Instances();

    // Writing method for unitId
    void setUnitId(const QString& unitId);

    // Setting method for size of banner
    void setBannerSize(BannerSizes size);

public slots:
    // LoadBanner method for loading banner
    void loadBanner();

signals:
    // Emit to QML app when an ad finishes loading
    void bannerLoaded();

private:
#ifdef Q_OS_ANDROID
    QAndroidJniObject* m_Activity;
#endif
};

#endif // QMLBANNER_H
