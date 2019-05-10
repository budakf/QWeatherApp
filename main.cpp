#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "weathercondition.h"
#include "jsonreader.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    WeatherCondition * weatherCondition = new WeatherCondition{};
    engine.rootContext()->setContextProperty("WeatherCondition", weatherCondition); // the object will be available in QML with name "WeatherCondition"

//    JsonReader * jsonReader = new JsonReader{"/Users/budakf/Qt_Projects/QWeatherApp/city-list.json", nullptr};
//    engine.rootContext()->setContextProperty("JsonReader", jsonReader);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject * background = engine.rootObjects().first()->findChild<QObject *>("backgroundObject");
    QObject::connect( weatherCondition, SIGNAL(dataReady()), background, SIGNAL(dataReady()) );

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
