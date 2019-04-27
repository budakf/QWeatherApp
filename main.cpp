#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "WeatherCondition.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

//    qmlRegisterType<WeatherCondition>("budakf.qweatherapp.weathercondition", 1, 0, "WeatherCondition");

    WeatherCondition * weatherCondition = new WeatherCondition{};
    engine.rootContext()->setContextProperty("WeatherCondition", weatherCondition); // the object will be available in QML with name "WeatherCondition"

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject * background = engine.rootObjects().first()->findChild<QObject *>("backgroundObject");
    QObject::connect( weatherCondition, SIGNAL(dataReady()), background, SIGNAL(isDataReady()) );

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
