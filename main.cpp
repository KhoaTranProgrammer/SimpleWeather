#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "qmlbanner.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;

    qmlRegisterType<QmlBanner>("QmlBanner", 1, 0, "QmlBanner");

    view.setSource(QUrl("qrc:/main.qml"));
    view.setMinimumSize(QSize(1280,720));
    view.show();

    return app.exec();
}
