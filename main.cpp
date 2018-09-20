#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;

    view.setSource(QUrl("qrc:/main.qml"));
    view.setMinimumSize(QSize(1280,720));
    view.show();

    return app.exec();
}
